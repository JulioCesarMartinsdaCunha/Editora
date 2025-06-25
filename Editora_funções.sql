-- Função tem como funcionalidade contar o total de vendas do funcionario passado por CPF no parametro.
delimiter $$
create function get_funcionario_vendas(cpfFuncionario varchar(14))
returns int
deterministic
begin
	declare amount int;
	if (select email from editoradb.funcionario where cpf like cpfFuncionario) is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Funcionario passado não está cadastrado no banco!";
    end if;
    
    select count(*) into amount from editoradb.funcionario as func 
    join editoradb.venda as venda on func.cpf = venda.funcionario_cpf 
    where func.cpf = cpfFuncionario;
    
    return amount;
end $$
delimiter ;

-- Função que calcula a quantidade total de pessoas em um determinado departamento.
delimiter $$
create function get_quantidade_pessoal_departamento(nomeDepartamento varchar(45))
returns int
deterministic
begin
	declare amount int;
	declare id_dep int;
    select dep.idDEPARTAMENTO into id_dep from editoradb.departamento as dep where dep.NOME like nomeDepartamento;
    
	if id_dep is null then
		signal sqlstate '45000' set MESSAGE_TEXT = "Departamento não encontrado!";
    end if;
    
    select count(*) into amount from editoradb.departamento as dep 
    join editoradb.funcionario as func on func.DEPARTAMENTO_idDEPARTAMENTO = dep.idDEPARTAMENTO
    where dep.idDEPARTAMENTO = id_dep;
    return amount;
end $$
delimiter ;

-- Função utilizada para conseguir a venda com maior valor até o momento.
delimiter $$
create function get_maior_venda_atual()
returns int
deterministic
begin
	declare id_best int;
    select venda.idVENDA into id_best 
    from editoradb.venda as venda 
    where venda.VALOR = (select max(valor) from editoradb.venda) 
    limit 1;
    
    return id_best;
end $$
delimiter ;

-- Função utilizada para adquirir o funcionario que mais vendeu até o momento.
-- OBS: ela devolve o CPF dele!
delimiter $$
create function get_funcionario_mais_vendeu()
returns varchar(14)
deterministic
begin
	declare cpf_best varchar(14);
    
    set cpf_best = (select venda.FUNCIONARIO_CPF 
    from editoradb.venda as venda
    group by venda.FUNCIONARIO_CPF
    order by count(venda.FUNCIONARIO_CPF) desc
    limit 1);
    
    return cpf_best;
end $$
delimiter ;

-- Função que pesquisa sobre o genero mais vendido até então.
-- OBS: retorna o ID do genero.
delimiter $$
create function get_genero_mais_vendido()
returns int
deterministic
begin
	declare id_best int;
    
    set id_best = (
		select lg.GENERO_idGENERO from editoradb.livro_genero as lg
        group by lg.GENERO_idGENERO
        order by count(lg.GENERO_idGENERO) desc
        limit 1
    );
    
    return id_best;
end $$
delimiter ;

-- Função que encontra a quantidade total de vendas dos livros de determinado autor.
delimiter $$
create function get_autor_quantidade_livro (nome varchar (45))
returns int
deterministic
    begin
        declare total_livros int;
        if (select count(*) from autor where autor.nome like nome) = 0 then 
         SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Autor não encontrado!, coloque outro, ou cadastre ele';
		END IF;
    select count(*) into total_livros
    from livro 
    where autor_idAutor = (select idAutor from autor where autor.nome like nome limit 1);

    return total_livros;
    end$$
delimiter ;