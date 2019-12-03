<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
<%@ page import="dao.LivroDao" %>
<%@ page import="modelo.Livro" %>
<%@ page import="banco.ConexaoMysql" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="lDao" class="dao.LivroDao"></jsp:useBean>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alteração de registro</title>

</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	String titulo = request.getParameter("titulo");
	String autor = request.getParameter("autor");
	String editora = request.getParameter("editora");
	String ano_publicacao = request.getParameter("ano_publicacao");
	
	Livro book = new Livro();
	
	book.setTitulo(titulo);
	book.setAutor(autor);
	book.setEditora(editora);
	book.setAno_publicacao(ano_publicacao);
	book.setId(id);
	
	lDao.update(book);
%>

<script>
alert("Registro alterado com sucesso.");

window.location.href = "formLivro.jsp";
</script>

</body>
</html>