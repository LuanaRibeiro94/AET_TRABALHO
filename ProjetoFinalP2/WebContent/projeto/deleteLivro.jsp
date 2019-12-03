<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exclusão de registro</title>

<jsp:useBean id="lDao" class="dao.LivroDao"></jsp:useBean>

</head>
<body>

<%
	int id = Integer.parseInt(request.getParameter("codigo"));
	lDao.delete(id);
%>

<script>
alert("Registro excluído com sucesso.");

window.location.href = "formLivro.jsp";
</script>

</body>
</html>