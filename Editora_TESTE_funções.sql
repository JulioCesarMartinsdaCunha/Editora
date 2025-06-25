-- TESTE get_funcionario_vendas
select get_funcionario_vendas("123.456.789-10") as "Quantidade de vendas";

-- TESTE get_quantidade_pessoal_departamento
select get_quantidade_pessoal_departamento("Design");
select * from editoradb.departamento;

-- TESTE get_maior_venda_atual
select get_maior_venda_atual();
select * from editoradb.venda;

-- TESTE get_funcionario_mais_vendeu
select get_funcionario_mais_vendeu();
select * from editoradb.venda;

-- TESTE get_genero_mais_vendido
select get_genero_mais_vendido();
select * from editoradb.livro_genero;

-- TESTE get_autor_quantidade_livro
select get_autor_quantidade_livro("José Saramago");
select * from livro;