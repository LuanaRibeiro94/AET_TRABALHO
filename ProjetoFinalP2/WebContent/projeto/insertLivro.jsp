<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="banco.ConexaoMysql" %>
<%@ page import="modelo.Livro" %>
<%@ page import="dao.LivroDao" %>

<jsp:useBean id="livroDao" class="dao.LivroDao"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Inserção de registros</title>

</head>
<body>

<%
	int id_livro;
	String titulo;
	String autor;
	String editora;
	String ano_publicacao;
		
	Livro livro = new Livro();
			
	titulo = request.getParameter("titulo");
	autor = request.getParameter("autor");
	editora = request.getParameter("editora");
	ano_publicacao = request.getParameter("ano_publicacao");
			
	livro.setTitulo(titulo);
	livro.setAutor(autor);
	livro.setEditora(editora);
	livro.setAno_publicacao(ano_publicacao);
	
	livroDao.insert(livro);
	
%>

<script>
alert("Registro inserido com sucesso.");

window.location.href = "formLivro.jsp";
</script>

</body>
</html>