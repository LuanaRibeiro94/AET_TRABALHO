package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import banco.ConexaoMysql;
import modelo.Livro;

public class LivroDao {
	private Connection con;
	private ConexaoMysql conexao;
	
	public LivroDao() {
		this.conexao = ConexaoMysql.getInstancia();
		this.con = conexao.conecta();
	}
	
	public void insert(Livro livro) {
		String sql = "insert into tb_livros(titulo, autor, editora, ano_publicacao) values (?, ?, ?, ?)";
			
		try {
			PreparedStatement stmt = this.con.prepareStatement(sql);
			
			stmt.setString(1, livro.getTitulo());
			stmt.setString(2, livro.getAutor());
			stmt.setString(3, livro.getEditora());
			stmt.setString(4, livro.getAno_publicacao());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Livro> select() {
		List<Livro> liv = new ArrayList<Livro>();
		String sql = "select * from tb_livros";
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Livro l = new Livro();
				
				l.setId(rs.getInt("id"));
				l.setTitulo(rs.getString("titulo"));
				l.setAutor(rs.getString("autor"));
				l.setEditora(rs.getString("editora"));
				l.setAno_publicacao(rs.getString("ano_publicacao"));
				
				liv.add(l);
			}
			
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			
		}
		
		return liv;
	}
	
	public List<Livro> selectById(int codigo) {
		List<Livro> liv = new ArrayList<Livro>();
		String sql = "select * from tb_livros where id = ?";
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, codigo);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Livro l = new Livro();
				
				l.setId(rs.getInt("id"));
				l.setTitulo(rs.getString("titulo"));
				l.setAutor(rs.getString("autor"));
				l.setEditora(rs.getString("editora"));
				l.setAno_publicacao(rs.getString("ano_publicacao"));
				
				liv.add(l);
			}
			
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			
		}
		
		return liv;
	}
	
	public List<Livro> selectByTitulo(String titulo) {
		List<Livro> liv = new ArrayList<Livro>();
		String sql = "select * from tb_livros where upper(titulo) like '%" + titulo.toUpperCase() + "%' order by id";
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Livro l = new Livro();
				
				l.setId(rs.getInt("id"));
				l.setTitulo(rs.getString("titulo"));
				l.setAutor(rs.getString("autor"));
				l.setEditora(rs.getString("editora"));
				l.setAno_publicacao(rs.getString("ano_publicacao"));
				
				liv.add(l);
			}
			
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			
		}
		
		return liv;	
	}
	
	public void delete(int id) {
		String sql = "delete from tb_livros where id = ?";
		
		try {
			PreparedStatement stmt = this.con.prepareStatement(sql);
			stmt.setInt(1, id);
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void deleteAll() {
		String sql = "truncate table tb_livros";
		
		try {
			PreparedStatement stmt = this.con.prepareStatement(sql);
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void update(Livro book) {
		String sql = "update tb_livros set titulo = ?, autor = ?, editora = ?, ano_publicacao = ? where id = ?";
		
		try {
			PreparedStatement stmt = this.con.prepareStatement(sql);
			
			stmt.setString(1, book.getTitulo());
			stmt.setString(2, book.getAutor());
			stmt.setString(3, book.getEditora());
			stmt.setString(4, book.getAno_publicacao());
			stmt.setInt(5, book.getId());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
