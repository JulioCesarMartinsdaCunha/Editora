-- Remover o valor do livro se ele estiver em estado de REVISÃO (7) ou BLOQUEADO (9)
delimiter $$
create trigger auto_atualiza_valor_deAcordo_status
after update on editoradb.exemplar
for each row
begin
    if new.EXEMPLAR_STATUS_IDEXEMPLAR = 9 or new.EXEMPLAR_STATUS_IDEXEMPLAR = 7 then
		update editoradb.livro
        set VALOR = null
        where new.idEXEMPLAR = EXEMPLAR_idEXEMPLAR;
    end if;
end$$
delimiter ;

-- Insere automaticamente a data atual na venda que esta sendo instanciada.
-- OBS: apenas altera a data se não for adicionada uma anteriormente!
delimiter $$
create trigger auto_data_automatica_em_venda
before insert on editoradb.venda
for each row
begin
	if new.DATAVENDA is null then
		set new.DATAVENDA = now();
    end if;
end $$
delimiter ;

-- Atualiza automaticamente o status do pedido para vendido quando insere a venda relativa no banco de dados.
delimiter $$
create trigger auto_atualizacao_automatica_pedido
after insert on venda
for each row
begin
	update editoradb.pedido
    set PEDIDO_STATUS_IDSTATUS = 5
    where new.PEDIDO_idPEDIDO = idPEDIDO;
end $$
delimiter ;

-- Aumenta de forma automatica o valor do livro de acordo com a idade do autor.
-- OBS: tem um aumento de 27 centavos a cada 1 ano do autor. (Politica maluca!!!)
delimiter $$
create trigger auto_atualiza_valor_com_idade
before insert on editoradb.livro 
for each row
begin
	declare idade int;
    set idade = (select timestampdiff(year, data_de_nascimento, now()) from editoradb.autor where idAUTOR = new.AUTOR_idAUTOR);
    if idade is null then
		signal sqlstate '25000' set MESSAGE_TEXT = "ta nulo fi";
    end if;
	set new.VALOR = new.VALOR + 0.27 * idade;
end $$
delimiter ;

-- Atualiza automaticamente o responsável pelo departamento caso o funcionario seja GERENTE, e o departamento não tenha nenhum gerente.
delimiter $$
create trigger auto_declaracao_gerencia_departamento
after update on funcionario
for each row 
begin
	if new.CARGO_idCARGO = 1 and (select FUNCIONARIO_CPF from editoradb.departamento where FUNCIONARIO_CPF = new.cpf) is null then
		update editoradb.departamento
        set FUNCIONARIO_CPF = new.cpf
        where idDEPARTAMENTO = new.DEPARTAMENTO_idDEPARTAMENTO;
    end if;
end $$
delimiter ;

-- Atualiza as vendas adicionando uma promoção que aumenta a cada 3 livros adicionados a compra.
-- OBS: possui um aumento inicial de 5 reais, e vai somando mais 2 reais a cada 3 livros adicionado.
delimiter $$
create trigger auto_desconto_para_livros_emTres
after insert on livro_pedido
for each row
begin
    declare qtd_livros int;
    declare nova_promocao decimal (10,2);

    select count(*) into qtd_livros
    from livro_pedido
    where PEDIDO_idPEDIDO = New.PEDIDO_idPEDIDO;

    if mod(qtd_livros, 3) = 0 then
		set nova_promocao = (5.00 + floor((qtd_livros - 3) / 2) * 2.00);
		update venda
		set promocao = nova_promocao
		WHERE PEDIDO_idPEDIDO = NEW.PEDIDO_idPEDIDO;
	end if ;

end$$
delimiter ;