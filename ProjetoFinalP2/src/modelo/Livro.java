package modelo;

public class Livro {
	private int id;
	private String titulo;
	private String autor;
	private String editora;
	private String ano_publicacao;
	
	public Livro() {}
	
	public Livro(String titulo, String autor, String editora, String ano_publicacao) {
		this.titulo = titulo;
		this.autor = autor;
		this.editora = editora;
		this.ano_publicacao = ano_publicacao;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getAutor() {
		return autor;
	}
	
	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getEditora() {
		return editora;
	}

	public void setEditora(String editora) {
		this.editora = editora;
	}

	public String getAno_publicacao() {
		return ano_publicacao;
	}

	public void setAno_publicacao(String ano_publicacao) {
		this.ano_publicacao = ano_publicacao;
	}

}
