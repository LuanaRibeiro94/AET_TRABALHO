<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="banco.ConexaoMysql" %>
<%@ page import="modelo.Livro" %>
<%@ page import="dao.LivroDao" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="livroDao" class="dao.LivroDao"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<title>Livros</title>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.jsp">Home</a>
      </li>
     <li class="nav-item active">
        <a class="nav-link" href="formLivro.jsp">Livro</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" id="pesquisarLivro" name="pesquisarLivro" type="search" placeholder="Pesquisar livro" aria-label="Pesquisar">
      <button id="pesquisar" class="btn btn-outline-info my-2 my-sm-0" type="submit">Pesquisar</button>
    </form>
  </div>
</nav>

<%
	String pesquisarLivro = request.getParameter("pesquisarLivro");
	
	List<Livro> livro2 = null;

	if(pesquisarLivro == null || pesquisarLivro == "") {
		livro2 = livroDao.select();
	} else {
		livro2 = livroDao.selectByTitulo(pesquisarLivro);
	}
	
	request.setAttribute("listaLivros", livro2);
	
%>
<br>
<p class="text-center text-info font-weight-bold">
Consulte nosso acervo ou cadastre um livro
</p>

<br>

<%@ include file="selectLivro.jsp" %>

<div class="modal fade" id="modalFormulario" tabindex="-1" role="dialog" aria-labelledby="modalFormulario" data-keyboard="false" 
			data-backdrop="static" aria-hidden="true">
			
	<div class="modal-dialog" role="document">
    	<div class="modal-content">
    		<div class="modal-header text-center">
        		<h5 class="modal-title w-100 font-weight-bold">Inclusão de registro</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="close">
         				<span aria-hidden="true">&times;</span>
					</button>
      		</div>
      				
      		<form action="insertLivro.jsp" id="formInclusao" method="post">
      			<div class="modal-body mx-3">
      				
					<label>Título</label>
					<input type="text" class="form-control" name="titulo">
					
					<label>Autor</label>
					<input type="text" class="form-control" name="autor">
					
					<label>Editora</label>
					<input type="text" class="form-control" name="editora">
						
					<label>Ano de publicação</label>
					<input type="text" class="form-control" name="ano_publicacao">
					
				</div>
					
				<div class="modal-footer d-flex justify-content-center">
	        		<button id="gravar" type=submit class="btn btn-outline-secondary">Gravar</button>
	      		</div>
		    	
		    </form>
		</div>
	</div>
</div>

<div class="d-flex justify-content-center">
	<button id="novoRegistro" type="button" onclick="exibeModal()" class="btn btn-outline-dark">Novo registro</button>
</div>

<br>

<footer class="text-center font-weight-light text-light bg-dark">
Todos os direitos reservados
</footer>

<script>
	function exibeModal(){
		$('#modalFormulario').modal('show')
	}
</script>

</body>
</html>