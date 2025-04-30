-- TODAS AS VIEWS UTILIZADAS NOS PRINCIPAIS SELECTS!
CREATE OR REPLACE VIEW livros_autores AS
SELECT l.NOME AS Livro, a.NOME AS Autor
FROM editoradb.livro l
JOIN editoradb.autor a ON l.AUTOR_idAUTOR = a.idAUTOR;

CREATE OR REPLACE VIEW vendas_detalhadas AS
SELECT v.idVENDA, f.NOME AS Funcionario, p.idPEDIDO, t.NOME AS TipoPagamento, v.DATAVENDA, v.VALOR, v.PROMOCAO
FROM editoradb.venda v
JOIN editoradb.funcionario f ON v.FUNCIONARIO_CPF = f.CPF
JOIN editoradb.pedido p ON v.PEDIDO_idPEDIDO = p.idPEDIDO
JOIN editoradb.tipo_de_pagamento t ON v.TIPO_DE_PAGAMENTO_idTIPO_DE_PAGAMENTO = t.idTIPO_DE_PAGAMENTO;

CREATE OR REPLACE VIEW livros_palavras AS
SELECT l.NOME AS Livro, pk.NOME_PALAVRA_CHAVE AS Palavra_Chave
FROM editoradb.livro l
JOIN editoradb.livro_palavra_chave lpk ON l.IDLIVRO = lpk.LIVRO_idLIVRO
JOIN editoradb.palavra_chave pk ON lpk.`PALAVRA_CHAVE_idPALAVRA CHAVE` = pk.`idPALAVRA CHAVE`;

CREATE OR REPLACE VIEW pedidos_status AS
SELECT p.idPEDIDO, p.DATAPEDIDO, s.IDSTATUS
FROM editoradb.pedido p
JOIN editoradb.pedido_status s ON p.PEDIDO_STATUS_IDSTATUS = s.idSTATUS;

CREATE OR REPLACE VIEW autores_areas AS
SELECT DISTINCT a.NOME AS Autor, ac.NOME AS Area
FROM editoradb.livro l
JOIN editoradb.autor a ON l.AUTOR_idAUTOR = a.idAUTOR
JOIN editoradb.area_de_conhecimento ac ON l.AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO = ac.idAREA_DE_CONHECIMENTO;

CREATE OR REPLACE VIEW livros_exemplares_status AS
SELECT l.NOME AS Livro, e.LOCALIZACAO, es.IDEXEMPLAR
FROM editoradb.livro l
JOIN editoradb.exemplar e ON l.EXEMPLAR_idEXEMPLAR = e.idEXEMPLAR
JOIN editoradb.exemplar_status es ON e.EXEMPLAR_STATUS_IDEXEMPLAR = es.idEXEMPLAR;

CREATE OR REPLACE VIEW resumo_livros_completo AS
SELECT 
    l.IDLIVRO,
    l.NOME AS Livro,
    a.NOME AS Autor,
    ac.NOME AS Area_de_Conhecimento,
    es.IDEXEMPLAR AS Status_Exemplar,
    (SELECT COUNT(*) 
     FROM editoradb.livro_genero lg 
     WHERE lg.LIVRO_idLIVRO = l.IDLIVRO) AS Quantidade_Generos
FROM editoradb.livro l
JOIN editoradb.autor a ON l.AUTOR_idAUTOR = a.idAUTOR
JOIN editoradb.area_de_conhecimento ac ON l.AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO = ac.idAREA_DE_CONHECIMENTO
JOIN editoradb.exemplar e ON l.EXEMPLAR_idEXEMPLAR = e.idEXEMPLAR
JOIN editoradb.exemplar_status es ON e.EXEMPLAR_STATUS_IDEXEMPLAR = es.idEXEMPLAR;

CREATE OR REPLACE VIEW venda_detalhada_livro_funcionario AS
SELECT 
    v.idVENDA,
    l.NOME AS Livro,
    a.NOME AS Autor,
    f.NOME AS Funcionario,
    v.DATAVENDA,
    v.VALOR,
    v.PROMOCAO
FROM editoradb.venda v
JOIN editoradb.pedido p ON v.PEDIDO_idPEDIDO = p.idPEDIDO
JOIN editoradb.livro_pedido lp ON p.idPEDIDO = lp.PEDIDO_idPEDIDO
JOIN editoradb.livro l ON lp.LIVRO_idLIVRO = l.idLIVRO
JOIN editoradb.autor a ON l.AUTOR_idAUTOR = a.idAUTOR
JOIN editoradb.funcionario f ON v.FUNCIONARIO_CPF = f.CPF;

CREATE OR REPLACE VIEW livros_com_tag_distopia AS
SELECT l.NOME AS Livro
FROM editoradb.livro l
JOIN editoradb.livro_palavra_chave lp ON l.idLIVRO = lp.LIVRO_idLIVRO
JOIN editoradb.palavra_chave pk ON lp.`PALAVRA_CHAVE_idPALAVRA CHAVE` = pk.`idPALAVRA CHAVE`
WHERE pk.NOME_PALAVRA_CHAVE LIKE 'Distopia';

CREATE OR REPLACE VIEW livros_mais_100_anos AS
SELECT l.NOME AS Nome,
l.DATA_DE_PUBLICACAO AS Data_publicacao
FROM editoradb.livro l
WHERE timestampdiff(YEAR, l.DATA_DE_PUBLICACAO, now()) >= 100;
