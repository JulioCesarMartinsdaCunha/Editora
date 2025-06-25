-- TESTE trigger 1 
update editoradb.exemplar
set EXEMPLAR_STATUS_IDEXEMPLAR = 9
where idEXEMPLAR = 1;

select * from editoradb.livro where idLIVRO = 1;

-- TESTE trigger 2
insert into venda values(null, null, 2000, 2, "000.111.222-33", 1, 0);
select * from venda;

-- TESTE trigger 3
insert into venda values(null, null, 300, 1, "000.111.222-33", 1, 0);
select * from pedido;

-- TESTE trigger 4
insert into livro values(null, "9780141182711", "The Waves", 
"As Ondas é um romance de Virginia Woolf publicado em 1931. É a obra mais experimental de Woolf, consistindo em solilóquios feitos pelos seis personagens do livro: Bernard, Susan, Rhoda, Neville, Jinny e Louis. Percival, o sétimo personagem, também importante, mesmo que o leitor nunca o escute falar por si mesmo.",
300, "1931-10-08", 47.78, 6, 4, 9);
select * from livro;

-- TESTE trigger 5
update editoradb.funcionario
set DEPARTAMENTO_idDEPARTAMENTO = 2
where CPF = "222.333.444-55";

select * from departamento;

-- TESTE trigger 6
INSERT INTO pedido (DATAPEDIDO, PEDIDO_STATUS_IDSTATUS) VALUES (CURDATE(), 1);
insert into venda values (null, current_date(), 0,1,'000.111.222-33',11, 0);

INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (1, 11); -- qtd = 1, sem desconto
INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (3, 11); -- qtd = 2, sem desconto
INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (4, 11); -- qtd = 3, desconto R$5,00 aplicado
INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (5, 11); -- qtd = 4, desconto ainda R$5,00
INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (7, 11); -- qtd = 5, desconto ainda R$5,00
INSERT INTO livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) VALUES (9, 11); -- qtd = 6, desconto R$7,00 (5 + 2)

select * from venda;