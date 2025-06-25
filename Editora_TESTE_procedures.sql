-- TESTE CadastrarAutor
call CadastrarAutor("Helena Duarte", 
"Helena Duarte é uma escritora brasileira nascida em Recife. Formada em Letras pela UFPE, iniciou a carreira como professora antes de se dedicar à literatura. Sua escrita mescla realismo mágico com temas sociais e regionais, especialmente ligados à vivência feminina no Nordeste. Em 2015, publicou seu primeiro romance, A Casa das Almas Vazias, finalista do Prêmio Jabuti. Desde então, tem colaborado com revistas literárias e promovido oficinas de escrita em comunidades carentes.",
"1980-03-12");
select * from editoradb.autor where idAUTOR = last_insert_id();

-- TESTE CadastrarFuncionario
call CadastrarFuncionario("123.432.175-43", "Joãozinho Bala", "11999999991", "joaozin.bala@gmail.com", "GERENTE", "Design", "2025-06-24", "2025-07-24", 52050430, "PE", "Encruzilhada", "Recife", "rua extreme venom", "1337", null);
select * from editoradb.funcionario where cpf like "123.432.175-43";
select * from editoradb.endereco where funcionario_cpf like "123.432.175-43";
select * from editoradb.ferias_funcionario where funcionario_cpf like "123.432.175-43";

delete from dependentes where cpf like "129.322.199-66";

-- TESTE CadastrarDependente
call CadastrarDependente("123.432.175-43", "129.322.199-66", "Joaozinhozinho", "Filho", "2022-04-24");
select * from dependentes where cpf like "129.322.199-66";

-- Teste AlterarDepartamento
call AlterarDepartamento("123.432.175-43", "Comercial", "Editor de Texto");
select * from editoradb.funcionario where cpf like "123.432.175-43";

-- TESTE CadastrarLivro
call CadastrarLivro("1123213", "Receba la ele bora bill", "um dia um home chamado bora bill começou a destruir tudo com o seu receba até que o la ele chegou e o matou, gg ez.",
46, "1500-06-14", 1, 2, 1);
select * from editoradb.livro where ISBN like "1123213";

-- TESTE CadastrarAreaConhecimento
call CadastrarAreaConhecimento("Dark Fantasy", "Um estilo muito popular hoje em dia entre os jovens, e o mais amado também!");
select * from editoradb.area_de_conhecimento where idAREA_DE_CONHECIMENTO = last_insert_id();