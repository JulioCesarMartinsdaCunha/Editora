-- ATIVANDO A CHECAGEM DE CHAVE ESTRANGEIRA
SET foreign_key_checks = 1;

-- Remover a nacionalidade obrigatoria do autor
alter table editoradb.autor
drop column NACIONALIDADE;

-- Remover a referencia da tabela de endereço
alter table editoradb.endereco
drop column REFERENCIA;

-- Modificar a data de publicação para ser facultativo colocar
alter table editoradb.livro 
modify column DATA_DE_PUBLICACAO date;

-- Tira a taxa cobrada pelo tipo de pagamento
alter table editoradb.tipo_de_pagamento
drop column TAXA;

-- Adiciona uma tabela que conterá o valor da promoção daquele produto
alter table editoradb.venda
add PROMOCAO decimal(6, 2) not null default 0;-

-- Alterando um nome escrito errado na tabela
alter table editoradb.pedido_status
change column `DESC` DESCRICAO varchar(200);

-- Adicionando um campo de nivel do cargo
alter table editoradb.cargo
add NIVEL tinyint not null;

-- Renomeando a tabela toda
alter table editoradb.ferias
rename to ferias_funcionario;

-- Alterando o DESC para ele ter ate 500 caracteres e ser obrigatorio
alter table editoradb.pedido_status
modify column DESCRICAO varchar(500) not null;

-- Alterando o nome da tabela genero para genero_literario
alter table editoradb.genero
rename to genero_literario;

alter table editoradb.livro
modify NUMERO_DE_PAGINAS int default 0;

-- Alterando a tabela AUTOR para comportar a idade CALCULADA dele!
alter table editoradb.autor
add IDADE int not null;

-- Alterando a tabela de livros para adicionar o valor dele!alter
alter table editoradb.livro
add VALOR decimal(6, 2) after DATA_DE_PUBLICACAO;