-- PRIMERIOS INSERTS -------------------
-- AS RAIZES DO BANCO DE DADOS ---------
-- --------------------------------------
insert into editoradb.cargo values(null, "GERENTE", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 4);
insert into editoradb.cargo values(null, "Editor-Chefe", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 3);
insert into editoradb.cargo values(null, "Editor de Texto", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);
insert into editoradb.cargo values(null, "Revisor Ortográfico", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);
insert into editoradb.cargo values(null, "Diagramador", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);
insert into editoradb.cargo values(null, "Designer Gráfico", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);
insert into editoradb.cargo values(null, "Gerente de Produção Editorial", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 3);
insert into editoradb.cargo values(null, "Analista de Marketing Editorial", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);
insert into editoradb.cargo values(null, "Vendedor", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 1);
insert into editoradb.cargo values(null, "Analista de Direitos Autorais", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", 2);

-- EXEMPLAR STATUS
insert into editoradb.exemplar_status values(null, "Disponivel", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Danificado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Reservado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Demonstração", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Premiado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Esgotado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Bloqueado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Vendido", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Revisão", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.exemplar_status values(null, "Em Reimpressão", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");

-- PEDIDO STATUS
insert into editoradb.pedido_status values(null, "Aprovado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Em Análise", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Cancelado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Em Separação", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Vendido", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Retornado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Bloqueado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Reembolsado", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Recebido", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
insert into editoradb.pedido_status values(null, "Indisponivel", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");

-- TIPO DE PAGAMENTO
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Cartão de Crédito", "3.5%", "Pagamento via cartão de crédito.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Cartão de Débito", "1.8%", "Pagamento via cartão de débito.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Boleto Bancário", "1.2%", "Pagamento por boleto bancário.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Pix", "0.5%", "Pagamento instantâneo via Pix.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Transferência Bancária", "0.8%", "Transferência entre contas.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "PayPal", "4.0%", "Pagamento com conta PayPal.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "PagSeguro", "3.9%", "Pagamento via PagSeguro.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Crédito em Conta", "0.0%", "Uso de crédito pré-existente.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Cheque", "2.0%", "Pagamento via cheque.");
INSERT INTO editoradb.tipo_de_pagamento VALUES (NULL, "Dinheiro", "0.0%", "Pagamento em dinheiro físico.");

-- AREA DE CONHECIMENTO
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Literatura", "Estudos de obras literárias, autores, gêneros e teorias literárias.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Ciências Humanas", "Engloba filosofia, história, sociologia, antropologia e afins.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Ciências Exatas", "Abrange matemática, física, química e áreas correlatas.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Ciências Biológicas", "Estudo dos seres vivos, incluindo biologia, ecologia e genética.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Engenharias", "Engenharia civil, elétrica, mecânica, de produção, entre outras.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Saúde", "Inclui medicina, enfermagem, psicologia, odontologia e áreas afins.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Tecnologia da Informação", "Abrange programação, bancos de dados, redes e ciência de dados.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Educação", "Estudos pedagógicos, metodologias de ensino e políticas educacionais.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Direito", "Área jurídica que trata de leis, jurisprudência, constituição e afins.");
INSERT INTO editoradb.area_de_conhecimento VALUES (NULL, "Administração e Negócios", "Abrange gestão, marketing, contabilidade, finanças e empreendedorismo.");

-- GENERO LITERARIO
INSERT INTO editoradb.genero_literario VALUES (NULL, "Romance", "Gênero narrativo que explora relacionamentos, emoções e dramas pessoais.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Ficção Científica", "Narrativas baseadas em avanços científicos e tecnológicos imaginários.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Fantasia", "Histórias ambientadas em mundos fictícios com magia, criaturas míticas e heróis.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Suspense", "Obras focadas em mistério, tensão e reviravoltas que prendem o leitor.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Terror", "Histórias criadas para provocar medo, tensão e apreensão.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Biografia", "Relatos detalhados sobre a vida de uma pessoa real.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Autoajuda", "Livros que oferecem conselhos para desenvolvimento pessoal e profissional.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Poesia", "Textos literários que usam linguagem estética, métrica e recursos poéticos.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Drama", "Narrativas centradas em conflitos humanos e dilemas emocionais.");
INSERT INTO editoradb.genero_literario VALUES (NULL, "Histórico", "Ficções ou relatos baseados em eventos e períodos históricos.");

-- PALAVRA CHAVE
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Amor", "Relacionamentos afetivos, paixões e conexões emocionais.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Tecnologia", "Temas relacionados a inovações, ciência e futuro digital.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Aventura", "Exploração, descobertas e jornadas intensas.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Magia", "Elementos sobrenaturais, feitiços e mundos mágicos.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Guerra", "Conflitos armados, estratégias militares e sobrevivência.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Mistério", "Enigmas, investigações e revelações inesperadas.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Psicologia", "Estudos da mente humana, comportamento e emoções.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Religião", "Crenças espirituais, fé, práticas e doutrinas.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Política", "Governança, ideologias, debates sociais e poder.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Natureza", "Ecologia, meio ambiente e relação homem-natureza.");
INSERT INTO editoradb.palavra_chave VALUES (NULL, "Distopia", "istopia é um gênero literário que retrata sociedades imaginárias marcadas por opressão.");

-- AUTOR
INSERT INTO editoradb.autor VALUES (NULL, "José Saramago", "Escritor português, vencedor do Prêmio Nobel de Literatura em 1998.", "1922-11-16", timestampdiff(year, "1922-11-16", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Clarice Lispector", "Importante escritora brasileira conhecida por sua escrita introspectiva e existencialista.", "1920-12-10", timestampdiff(year, "1920-12-10", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Machado de Assis", "Considerado um dos maiores escritores da literatura brasileira.", "1839-06-21", timestampdiff(year, "1839-06-21", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Virginia Woolf", "Pioneira do modernismo literário e importante figura do feminismo.", "1882-01-25", timestampdiff(year, "1882-01-25", now()));
INSERT INTO editoradb.autor VALUES (NULL, "George Orwell", "Autor britânico famoso por obras como 1984 e A Revolução dos Bichos.", "1903-06-25", timestampdiff(year, "1903-06-25", now()));
INSERT INTO editoradb.autor VALUES (NULL, "J.K. Rowling", "Autora britânica conhecida mundialmente pela série Harry Potter.", "1965-07-31", timestampdiff(year, "1965-07-31", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Gabriel García Márquez", "Escritor colombiano, vencedor do Nobel, expoente do realismo mágico.", "1927-03-06", timestampdiff(year, "1927-03-06", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Franz Kafka", "Autor tcheco cujas obras influenciaram a literatura existencialista do século XX.", "1883-07-03", timestampdiff(year, "1883-07-03", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Lygia Fagundes Telles", "Importante escritora brasileira, integrante da Academia Brasileira de Letras.", "1923-04-19", timestampdiff(year, "1923-04-19", now()));
INSERT INTO editoradb.autor VALUES (NULL, "Haruki Murakami", "Escritor japonês contemporâneo conhecido por suas narrativas surreais e introspectivas.", "1949-01-12", timestampdiff(year, "1949-01-12", now()));

INSERT INTO editoradb.departamento VALUES 
(null, "Editorial", "Responsável pela curadoria, edição e revisão dos conteúdos publicados.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Design", "Departamento encarregado da identidade visual, capas e diagramação dos livros.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Marketing", "Planeja e executa estratégias de divulgação e promoção dos produtos.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Comercial", "Gerencia vendas, relacionamento com livrarias e distribuição.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Jurídico", "Cuida dos aspectos legais, contratos com autores e direitos autorais.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Tecnologia da Informação", "Administra sistemas internos e suporte técnico.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Financeiro", "Responsável por contas a pagar, a receber e planejamento financeiro.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Recursos Humanos", "Realiza recrutamento, gestão de pessoas e folha de pagamento.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Produção", "Gerencia a impressão, acabamento e controle de qualidade dos livros.", null);

INSERT INTO editoradb.departamento VALUES 
(null, "Distribuição e Logística", "Cuida do armazenamento e envio dos livros para os pontos de venda.", null);

-- SEGUDOS INSERTS -------------------
-- TABELAS DO BANCO DE DADOS COM CHAVE ESTRANGEIRA ---------
-- --------------------------------------

INSERT INTO editoradb.exemplar (idEXEMPLAR, LOCALIZACAO, EXEMPLAR_STATUS_IDEXEMPLAR) VALUES
(NULL, "Biblioteca Editorial", 1),
(NULL, "Biblioteca Editorial", 1),
(NULL, "Biblioteca Design", 2),
(NULL, "Biblioteca Editorial", 1),
(NULL, "Biblioteca Marketing", 3),
(NULL, "Biblioteca Comercial", 4),
(NULL, "Biblioteca Editorial", 1),
(NULL, "Biblioteca Tecnologia da Informação", 6),
(NULL, "Biblioteca Financeiro", 7),
(NULL, "Biblioteca Recursos Humanos", 8);

INSERT INTO editoradb.livro (IDLIVRO, NOME, SINOPSE, ISBN, NUMERO_DE_PAGINAS, DATA_DE_PUBLICACAO, VALOR, AUTOR_idAUTOR, EXEMPLAR_idEXEMPLAR, AREA_DE_CONHECIMENTO_idAREA_DE_CONHECIMENTO)
VALUES 
(NULL, "Ensaio Sobre a Cegueira", "Uma epidemia de cegueira repentina afeta uma cidade.", "9788535914849", 100, "1995-03-01", 150.00, 1, 1, 1),
(NULL, "A Hora da Estrela", "História de Macabéa, uma nordestina no Rio de Janeiro.", "9788520927971", 120, "1977-10-25", 50.99, 2, 1, 1),
(NULL, "Dom Casmurro", "Narrativa sobre amor e ciúmes, centrada em Bentinho e Capitu.", "9788535914840", 80, "1899-01-01", 69.99,3, 1, 1),
(NULL, "Mrs. Dalloway", "Um dia na vida de Clarissa Dalloway.", "9780141182490", 134, "1925-05-14", 47.78, 4, 6, 9),
(NULL, "1984", "Distopia sobre vigilância e totalitarismo.", "9780451524935", 56, "1949-06-08", 566, 5, 2, 2),
(NULL, "Harry Potter e a Pedra Filosofal", "Um garoto descobre que é bruxo.", "9788532511013", 76, "1997-06-26", 300, 6, 1, 3),
(NULL, "Cem Anos de Solidão", "Saga da família Buendía em Macondo.", "9788535914843", 23, "1967-05-30", 23.45, 7, 3, 3),
(NULL, "A Metamorfose", "Homem acorda transformado em inseto.", "9788582850146", 96, "1915-10-01", 99.00, 8, 4, 4),
(NULL, "As Meninas", "Romance sobre a ditadura brasileira.", "9788535914841", 30, "1973-06-01", 69.69, 9, 5, 9),
(NULL, "Kafka à Beira-Mar", "Dois personagens em jornadas paralelas no Japão.", "9788535902771", 49, "2002-09-12", 150.00, 8, 10, 3);

INSERT INTO editoradb.livro_genero (GENERO_idGENERO, LIVRO_idLIVRO) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(3, 6),
(6, 4),
(5, 5),
(4, 1),
(4, 2),
(4, 3),
(5, 2);

INSERT INTO editoradb.livro_palavra_chave (LIVRO_idLIVRO, `PALAVRA_CHAVE_idPALAVRA CHAVE`) VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 9),
(5, 2),
(6, 4),
(7, 10),
(8, 6),
(9, 9),
(10, 2),
(10, 11);

-- select * from palavra_chave;

INSERT INTO editoradb.funcionario (CPF, NOME, EMAIL, TELEFONE, CARGO_idCARGO, DEPARTAMENTO_idDEPARTAMENTO) VALUES
("222.333.444-55", "Ana Silva", "ana@editora.com", "11999999991", 1, 1),
("333.444.555-66", "Bruno Souza", "bruno@editora.com", "11999999992", 2, 1),
("444.555.666-77", "Carlos Mendes", "carlos@editora.com", "11999999993", 3, 1),
("555.666.777-88", "Daniela Costa", "daniela@editora.com", "11999999994", 4, 1),
("666.777.888-99", "Eduardo Lima", "eduardo@editora.com", "11999999995", 5, 2),
("777.888.999-00", "Fernanda Rocha", "fernanda@editora.com", "11999999996", 6, 2),
("000.111.222-33", "Gustavo Pinto", "gustavo@editora.com", "11999999997", 7, 9),
("123.456.789-10", "Helena Martins", "helena@editora.com", "11999999998", 8, 3),
("789.123.456-55", "Igor Ferreira", "igor@editora.com", "11999999999", 9, 4),
("221.334.243-95", "Juliana Ramos", "juliana@editora.com", "11999999990", 10, 5);

INSERT INTO editoradb.pedido (idPEDIDO, DATAPEDIDO, PEDIDO_STATUS_IDSTATUS) VALUES
(NULL, '2022-03-23', 1),
(NULL, '2022-09-03', 2),
(NULL, '2018-02-20', 3),
(NULL, '2022-03-23', 4),
(NULL, '2022-12-31', 5),
(NULL, '2019-03-11', 6),
(NULL, '2020-11-23', 7),
(NULL, '2022-03-23', 8),
(NULL, '2023-06-10', 9),
(NULL, '2024-03-30', 10);

INSERT INTO editoradb.livro_pedido (LIVRO_idLIVRO, PEDIDO_idPEDIDO) values
(10, 1),
(9, 1),
(6, 2),
(4, 3),
(5, 3),
(7, 3),
(8, 5),
(1, 6),
(2, 6),
(3, 9);

INSERT INTO editoradb.venda (idVENDA, FUNCIONARIO_CPF, PEDIDO_idPEDIDO, TIPO_DE_PAGAMENTO_idTIPO_DE_PAGAMENTO, DATAVENDA, VALOR, PROMOCAO) VALUES
(NULL, "000.111.222-33", 1, 1, '2024-01-01', 46.5, 5.00),
(NULL, "123.456.789-10", 2, 2, '2024-01-05', 67.99, 3.00),
(NULL, "123.456.789-10", 3, 3, '2024-01-10', 54.3, 2.00),
(NULL, "221.334.243-95", 4, 4, '2024-01-12', 33.0, 0.00),
(NULL, "222.333.444-55", 5, 5, '2024-01-15', 123.5, 1.50),
(NULL, "333.444.555-66", 6, 6, '2024-01-20', 20.0, 0.00),
(NULL, "444.555.666-77", 7, 7, '2024-01-25', 34.4, 0.00),
(NULL, "555.666.777-88", 8, 8, '2024-01-30', 12.3, 0.00),
(NULL, "555.666.777-88", 9, 9, '2024-02-01', 60.5, 2.50),
(NULL, "777.888.999-00", 10, 10, '2024-02-10', 55.5, 0.00);