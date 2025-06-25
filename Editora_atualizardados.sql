-- UPDATES

-- Atualizando localização dos exemplares
UPDATE editoradb.exemplar SET LOCALIZACAO = "Biblioteca Central" WHERE idEXEMPLAR = 1;

-- Atualizando status do exemplar
UPDATE editoradb.exemplar SET EXEMPLAR_STATUS_IDEXEMPLAR = 2 WHERE idEXEMPLAR = 4;

-- Corrigindo nome de livro com erro de digitação
UPDATE editoradb.livro SET NOME = "Harry Potter e a Pedra Filosofal" WHERE IDLIVRO = 6;

-- Atualizando número de páginas
UPDATE editoradb.livro SET NUMERO_DE_PAGINAS = 352 WHERE IDLIVRO = 1;

-- Atualizando email do funcionário
UPDATE editoradb.funcionario SET EMAIL = "ana.silva@editora.com" WHERE CPF = "222.333.444-55";

-- Alterando o cargo de um funcionário
UPDATE editoradb.funcionario SET CARGO_idCARGO = 2 WHERE CPF = "333.444.555-66";

-- Atualizando promoção de venda
UPDATE editoradb.venda SET PROMOCAO = 10.00 WHERE idVENDA = 1;

-- Atualizando valor de uma venda
UPDATE editoradb.venda SET VALOR = 99.99 WHERE idVENDA = 5;

-- Mudando departamento de um funcionário
UPDATE editoradb.funcionario SET DEPARTAMENTO_idDEPARTAMENTO = 3 WHERE CPF = "555.666.777-88";

-- Atualizando palavra-chave de um livro
UPDATE editoradb.funcionario SET EMAIL = "shaolimmatadordeporco@editora.com" WHERE CPF = "555.666.777-88";
-- DELETES

-- Removendo um vínculo de palavra-chave
DELETE FROM editoradb.livro_palavra_chave WHERE LIVRO_idLIVRO = 3 AND `PALAVRA_CHAVE_idPALAVRA CHAVE` = 1;

-- Excluindo um gênero associado a um livro
DELETE FROM editoradb.livro_genero WHERE LIVRO_idLIVRO = 2 AND GENERO_idGENERO = 2;

-- Excluindo uma venda específica
DELETE FROM editoradb.venda WHERE idVENDA = 9;

-- Excluindo exemplar que está fora de uso
DELETE FROM editoradb.livro WHERE idLIVRO = 6;

-- Removendo um livro obsoleto
DELETE FROM editoradb.livro WHERE IDLIVRO = 8;

-- Deletando um funcionário desligado
DELETE FROM editoradb.funcionario WHERE CPF = "789.123.456-55";

-- Removendo um pedido com erro de registro
DELETE FROM editoradb.venda WHERE idVENDA = 7;

-- Removendo associação incorreta entre livro e gênero
DELETE FROM editoradb.livro_genero WHERE LIVRO_idLIVRO = 3 AND GENERO_idGENERO = 1;

-- Deletando palavra-chave associada incorretamente
DELETE FROM editoradb.livro_palavra_chave WHERE LIVRO_idLIVRO = 5 AND `PALAVRA_CHAVE_idPALAVRA CHAVE` = 2;

-- Excluindo exemplar duplicado
DELETE FROM editoradb.livro WHERE idLIVRO = 2;
