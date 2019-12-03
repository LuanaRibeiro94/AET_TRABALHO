<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List" %>
<%@page import="modelo.Livro" %>

<jsp:useBean id="lDao" class="dao.LivroDao"></jsp:useBean>
<jsp:useBean id="l" class="modelo.Livro"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulário de Alteração</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>

<%
	int id = Integer.parseInt(request.getParameter("id"));

	List<Livro> book = lDao.selectById(id);
	
	String titulo = book.get(0).getTitulo();
	String autor = book.get(0).getAutor();
	String editora = book.get(0).getEditora();
	String ano_publicacao = book.get(0).getAno_publicacao();
%>

<div class="form-group">
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
			<div class="modal-header text-center">
				<h5 class="modal-title w-100 font-weight-bold">Alteração de registro</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="close">
		         		<span aria-hidden="true">&times;</span>
					</button>
		      	</div>
		      	
		      	<form action="updateLivro.jsp" id="formAlteracao" method="post">
		      	
		      		<div class="modal-body mx-3">
				
						<label for="titulo">Titulo: </label>
						<input type="text" class="form-control" id="titulo" name="titulo" value="<%=titulo %>">
					
						<label for="autor">Autor:</label>
						<input type="text" class="form-control" id="autor" name="autor" value="<%=autor %>">
						
						<label>Editora</label>
						<input type="text" class="form-control" id="editora" name="editora" value="<%=editora%>">
									
						<label>Ano de publicação</label>
						<input type="text" class="form-control" id="ano_publicacao" name="ano_publicacao" value="<%=ano_publicacao%>">
						
					</div>
					
					<div class="modal-footer d-flex justify-content-center">
				    	<button id="atualizar" type=submit class="btn btn-outline-secondary">Atualizar</button>
				    </div>
				    
				<input type="hidden" name="id" value="<%=id %>">
			</form>
		</div>
	</div>
</div>

</body>
</html>