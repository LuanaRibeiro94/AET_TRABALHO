<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="banco.ConexaoMysql" %>
<%@ page import="modelo.Livro" %>
<%@ page import="dao.LivroDao" %>
<%@ page import="java.util.List" %>

<%
	int id_livro;
	String titulo;
	String autor;
	String editora;
	String ano_publicacao;
	
	List<Livro> livrosLista = (List<Livro>) request.getAttribute("listaLivros");
	
%>

	<table class="table">
			<thead class="thead-dark">
	   			<tr>	
	   				<th scope="col">Código</th>
		      		<th scope="col">Título</th>
		      		<th scope="col">Autor</th>
		      		<th scope="col">Editora</th>
		      		<th scope="col">Ano de publicação</th>
		      		<th scope="col">Operações</th>
		      		<th scope="col"></th>
	    		</tr>
	  		</thead>
	  		
	<tbody>
		<%
			for (Livro livro : livrosLista) {
		%>
		<tr>
				<td><%=id_livro = livro.getId()%></td>
				<td><%=titulo = livro.getTitulo()%></td>
				<td><%=autor = livro.getAutor()%></td>
				<td><%=editora = livro.getEditora()%></td>
				<td><%=ano_publicacao = livro.getAno_publicacao()%></td>
				<td><a href='formAlteracaoLivro.jsp?id=<%=id_livro %>' class='btn btn-outline-warning'>Alterar</a></td>
				<td><a href='deleteLivro.jsp?codigo=<%=id_livro %>' class='btn btn-outline-danger'>Excluir</a></td>
		</tr>
	
			
		<%
			}
		%>
		</tbody>
	</table>
