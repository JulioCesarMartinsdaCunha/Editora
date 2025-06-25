-- Procedure utilizada para cadastrar o autor (sem suas obras)
delimiter $$
create procedure CadastrarAutor(in nome varchar(45), in biografia varchar(1000), in dataNasc date)
begin
	declare idade int;
    set idade = timestampdiff(year, ifnull(dataNasc, now()), now());
    
	insert into editoradb.autor values(null, nome, biografia, dataNasc, idade);
end $$
delimiter ;

-- Procedure utilizada para cadastrar o funcionario, seu endereço e ferias.
delimiter $$
create procedure CadastrarFuncionario(in cpf varchar(14), 
in nome varchar(45), 
in telefone varchar(15),
in email varchar(60), 
in nomeCargo varchar(45), 
in nomeDepartamento varchar(45),
in feriasInicio date,
in feriasFinalizacao date,
in endCEP char(8),
in endUF varchar(2),
in endBairro varchar(45),
in endCidade varchar(45),
in endRua varchar(45),
in endNumero varchar(10),
in endComplemento varchar(45)
)
begin
	declare id_cargo int;
    declare id_depart int;
    declare ferias_duracao int;
    
    select cargo.idCARGO into id_cargo from editoradb.cargo as cargo where nomeCargo like cargo.NOMECARGO;
    select depart.idDEPARTAMENTO into id_depart from editoradb.departamento as depart where nomeDepartamento like depart.NOME;

	if id_cargo is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Cargo informado não encontrado no banco de dados!";
    end if;
    
	if id_depart is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Departamento informado não encontrado no banco de dados!";
    end if;

	set ferias_duracao = timestampdiff(day, feriasInicio, feriasFinalizacao);

	insert into editoradb.funcionario values(cpf, nome, telefone, email, id_cargo, id_depart);
    insert into editoradb.endereco values(endCEP, endUF, endBairro, endCidade, endRua, endNumero, endComplemento, cpf);
    insert into editoradb.ferias_funcionario values(feriasInicio, feriasFinalizacao, ferias_duracao, cpf);
end $$
delimiter ;

-- Procedure para cadastra qualquer dependente do funcionario.
delimiter $$
create procedure CadastrarDependente(in cpfFuncionario varchar(14), 
in cpf varchar(14), 
in nome varchar(45), 
in parentesco varchar(45), 
in dataNasc date)
begin
	declare verify varchar(60);
    select func.email into verify from funcionario as func where func.cpf = cpfFuncionario;
    
    if verify is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Funcionário informado não cadastrado no banco!";
    end if;
    
    insert into dependentes values(cpf, dataNasc, parentesco, nome, cpfFuncionario);
end $$
delimiter ;

-- Procedure utilizada para alterar o departamento do funcionario de forma facilitada.
-- OBS: ela utiliza o nome do DEPARTAMENTO e CARGO para sobrescreve-los no funcionario.
delimiter $$ 
create procedure AlterarDepartamento(in cpfFuncionario varchar(14), 
in novoDepartamento varchar(45), 
in novoCargo varchar(45))
begin
    declare id_depart int;
    declare id_cargo int;
    
    select cargo.idCARGO into id_cargo from editoradb.cargo as cargo where cargo.NOMECARGO = novoCargo;
    select depart.idDEPARTAMENTO into id_depart from editoradb.departamento as depart where depart.NOME = novoDepartamento;
    
    if (select email from editoradb.funcionario where cpf = cpfFuncionario) is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Funcionário informado não cadastrado no banco!";
    end if;
    
    if id_depart is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Departamento não encontrado no banco de dados!";
    end if;
    if id_cargo is null then 
		signal sqlstate '45000' set MESSAGE_TEXT = "Cargo não encontrado no banco de dados!";
    end if;
    
    update editoradb.funcionario 
    set cargo_idcargo = id_cargo, departamento_iddepartamento = id_depart
    where cpf = cpfFuncionario;
end $$
delimiter ;

-- Procedure utilizada para cadastrar livros.
-- OBS: ela utiliza o id das entidade para se relacionar. (forma não tão facilitada)
Delimiter $$
create procedure CadastrarLivro(in ISBN VARCHAR(13),
in NOME VARCHAR(45), 
in SINOPSE VARCHAR(500), 
in NUMERO_DE_PAGINAS int,
in DATA_DE_PUBLICACAO date, 
in EXEMPLAR_idEXEMPLAR int, 
in AUTOR_idAUTOR INT, 
in AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO INT) 
 begin
 
    DECLARE v_AUTOR_ID_FINAL INT;
    DECLARE v_AUTOR_EXISTE INT;
    declare v_AREA_EXISTE INT;
    
         IF AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO IS NULL THEN
SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Area de conhecimento não informada, porfavor cadastrar area primeiro. Cadastro de livro cancelado. ';

end if;
        
select count(*) into v_AREA_EXISTE
from area_de_conhecimento
        where idarea_de_conhecimento = AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO;

  IF v_AREA_EXISTE = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Área de conhecimento inexistente, porfavor cadastrar area primeiro. Cadastro de livro cancelado.';
    END IF;
    
    -- CASO AUTOR NÃO TENHA SIDO INFORMADO (NULL)
    IF AUTOR_idAUTOR IS NULL THEN
        -- Verifica se já existe um autor chamado 'Autor Não Cadastrado'
        SELECT idAUTOR INTO v_AUTOR_ID_FINAL
        FROM AUTOR
        WHERE NOME = 'Autor Não Cadastrado'
        LIMIT 1;

        -- Se não existir, cria o autor genérico
        IF v_AUTOR_ID_FINAL IS NULL THEN
            INSERT INTO AUTOR 
            VALUES (null, 'Autor Não Cadastrado', 'Autor usado quando não informado.', '1900-01-01', 0);

            -- Pega o ID do autor recém-criado
            SET v_AUTOR_ID_FINAL = LAST_INSERT_ID();
        END IF;

    ELSE
        -- Verifica se o autor informado existe
        SELECT COUNT(*) INTO v_AUTOR_EXISTE
        FROM AUTOR
        WHERE idAUTOR = AUTOR_idAUTOR;

        -- Se não existir, aborta
        IF v_AUTOR_EXISTE = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ID de autor informado não existe. Cadastro de livro cancelado.';
        ELSE
            SET v_AUTOR_ID_FINAL = AUTOR_idAUTOR;
        END IF;
    END IF;

insert into livro (
    ISBN, Nome, Sinopse, Numero_de_Paginas,
    DATA_DE_PUBLICACAO, EXEMPLAR_idEXEMPLAR,
    AUTOR_idAUTOR, AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO
)
values (
    ISBN, Nome, Sinopse, Numero_de_Paginas,
    DATA_DE_PUBLICACAO, EXEMPLAR_idEXEMPLAR,
    v_AUTOR_ID_FINAL, AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO
);
end $$
delimiter ;

-- Procedure utilizada para cadastrar uma nova area de conhecimento.
delimiter $$
    create procedure CadastrarAreaConhecimento(
    nome varchar(45) , descricao varchar(100)
    )
    begin
insert into area_de_conhecimento (
   nome, descricao
)
values (
      nome, descricao
);

end $$
delimiter ;