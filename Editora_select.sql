 -- AREA DOS SELECTS NORMAIS
 SELECT * FROM area_de_conhecimento;
 SELECT * FROM autor;
 SELECT * FROM cargo;
 SELECT * FROM departamento;
 SELECT * FROM dependentes;
 SELECT * FROM endereco;
 SELECT * FROM exemplar;
 SELECT * FROM exemplar_status;
 SELECT * FROM ferias_funcionario;
 SELECT * FROM funcionario;
 SELECT * FROM genero_literario;
 SELECT * FROM livro;
 SELECT * FROM livro_genero;
 SELECT * FROM livro_palavra_chave;
 SELECT * FROM livro_pedido;
 SELECT * FROM palavra_chave;
 SELECT * FROM pedido;
 SELECT * FROM pedido_status;
 SELECT * FROM tipo_de_pagamento;
 SELECT * FROM venda;
 
 -- RELATORIOS COMPLETOS
 
 -- Quantidade de livro que tem mais ou 100 anos de sua publicação
 SELECT  
	l.Nome AS Livro,
    l.Data_publicacao AS "Data"
 FROM livros_mais_100_anos l;
 
 -- Exemplares e seus status
 SELECT e.idEXEMPLAR as ID, e.LOCALIZACAO,
       (SELECT es.NOME FROM editoradb.exemplar_status es WHERE es.idEXEMPLAR = e.EXEMPLAR_STATUS_IDEXEMPLAR) AS "Status"
FROM editoradb.exemplar e;
 
 -- Quantidade de livro por genero
SELECT g.NOMEGENERO AS Genero, 
       (SELECT COUNT(*) 
        FROM editoradb.livro_genero lg 
        WHERE lg.GENERO_idGENERO = g.idGENERO) AS Quantidade_Livros
FROM editoradb.genero_literario g;

-- Livros com mais de 100 páginas e suas áreas de conhecimento
SELECT l.NOME AS Livro, l.NUMERO_DE_PAGINAS, 
       (SELECT NOME 
        FROM editoradb.area_de_conhecimento a 
        WHERE a.idAREA_DE_CONHECIMENTO = l.AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO) AS Area
FROM editoradb.livro l
WHERE l.NUMERO_DE_PAGINAS > 100;

-- Listar livros com múltiplos gêneros
SELECT l.NOME AS Livro
FROM editoradb.livro l
WHERE (SELECT COUNT(*) 
       FROM editoradb.livro_genero lg 
       WHERE lg.LIVRO_idLIVRO = l.IDLIVRO) > 1;

-- Valor total de vendas de funcionário
SELECT f.NOME AS Funcionario,
       (SELECT SUM(v.VALOR) 
        FROM editoradb.venda v 
        WHERE v.FUNCIONARIO_CPF = f.CPF) AS Total_Vendas
FROM editoradb.funcionario f;

-- EXCLUIR ---
SELECT p.idPEDIDO
FROM editoradb.pedido p
WHERE (SELECT COUNT(*) 
       FROM editoradb.venda v 
       WHERE v.PEDIDO_idPEDIDO = p.idPEDIDO) > 1;

-- Funcionários e seus departamentos
SELECT f.NOME, 
       (SELECT d.NOME 
        FROM editoradb.departamento d 
        WHERE d.idDEPARTAMENTO = f.DEPARTAMENTO_idDEPARTAMENTO) AS Departamento
FROM editoradb.funcionario f;

-- Quantidade de livros por área de conhecimento
SELECT a.NOME AS Area, 
       (SELECT COUNT(*) 
        FROM editoradb.livro l 
        WHERE l.AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO = a.idAREA_DE_CONHECIMENTO) AS Quantidade
FROM editoradb.area_de_conhecimento a;

-- Livros sem pedido associado
SELECT l.NOME AS Livro
FROM editoradb.livro l, editoradb.livro_pedido lp 
WHERE l.idLIVRO = lp.LIVRO_idLIVRO;

-- Vendas com valor acima da média
SELECT * 
FROM editoradb.venda
WHERE VALOR > (SELECT AVG(VALOR) FROM editoradb.venda);

-- Obras produzidas por autor
SELECT a.NOME AS Autor,
       (SELECT COUNT(*) 
        FROM editoradb.livro l 
        WHERE l.AUTOR_idAUTOR = a.idAUTOR) AS Quantidade_Livros
FROM editoradb.autor a;

-- Funcionários que trabalham
SELECT f.NOME
FROM editoradb.funcionario f
WHERE EXISTS (
    SELECT 1 
    FROM editoradb.venda v 
    WHERE v.FUNCIONARIO_CPF = f.CPF
);

-- Departamentos com mais de um funcionário
SELECT d.NOME AS Departamento
FROM editoradb.departamento d
WHERE (SELECT COUNT(*) 
       FROM editoradb.funcionario f 
       WHERE f.DEPARTAMENTO_idDEPARTAMENTO = d.idDEPARTAMENTO) > 1;

-- Quantidade de palavras-chave associadas
SELECT l.NOME, 
       (SELECT COUNT(*) 
        FROM editoradb.livro_palavra_chave lp 
        WHERE lp.LIVRO_idLIVRO = l.IDLIVRO) AS Qtd_Palavras
FROM editoradb.livro l;

-- MAIS COMPLEXOS
-- Livros com múltiplos gêneros e palavras-chave e que foram vendidos
SELECT 
    l.NOME AS "NOME",
    COUNT(DISTINCT lg.GENERO_idGENERO) AS Qtde_Generos,
    COUNT(DISTINCT pk.`PALAVRA_CHAVE_idPALAVRA CHAVE`) AS Qtde_Palavras,
    COUNT(DISTINCT v.idVENDA) AS Qtde_Vendas
FROM editoradb.livro l
JOIN editoradb.livro_pedido lp ON l.idLIVRO = lp.LIVRO_idLIVRO
JOIN editoradb.livro_genero lg ON l.IDLIVRO = lg.LIVRO_idLIVRO
JOIN editoradb.livro_palavra_chave pk ON l.IDLIVRO = pk.LIVRO_idLIVRO
JOIN editoradb.pedido p ON lp.PEDIDO_idPEDIDO = p.idPEDIDO
JOIN editoradb.venda v ON p.idPEDIDO = v.PEDIDO_idPEDIDO
GROUP BY l.NOME
HAVING Qtde_Generos > 1 AND Qtde_Palavras > 1;

-- Áreas de conhecimento com mais livros vendidos
SELECT 
    rc.Area_de_Conhecimento,
    COUNT(v.idVENDA) AS Total_Vendas
FROM resumo_livros_completo rc
JOIN editoradb.livro l ON rc.IDLIVRO = l.IDLIVRO
JOIN editoradb.livro_pedido lp ON l.idLIVRO = lp.LIVRO_idLIVRO
JOIN editoradb.pedido p ON lp.PEDIDO_idPEDIDO = p.idPEDIDO
JOIN editoradb.venda v ON v.PEDIDO_idPEDIDO = p.idPEDIDO
GROUP BY rc.Area_de_Conhecimento
ORDER BY Total_Vendas DESC;

-- Livros com a tag "Distopia" e seus valores de venda
SELECT 
    vdlf.Livro,
    vdlf.Autor,
    vdlf.Funcionario,
    vdlf.DATAVENDA,
    vdlf.VALOR
FROM livros_com_tag_distopia ltd
JOIN venda_detalhada_livro_funcionario vdlf ON ltd.Livro = vdlf.Livro;

-- Funcionários que venderam com mais de um tipo de pagamento
SELECT 
    f.NOME AS Funcionario,
    COUNT(DISTINCT v.TIPO_DE_PAGAMENTO_idTIPO_DE_PAGAMENTO) AS Tipos_Pagamento
FROM editoradb.venda v
JOIN editoradb.funcionario f ON v.FUNCIONARIO_CPF = f.CPF
GROUP BY f.NOME
HAVING Tipos_Pagamento > 1;

SELECT * from livros_com_tag_distopia;