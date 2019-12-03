package testes;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import dao.LivroDao;
import modelo.Livro;

class CRUDLivros {
	private static WebDriver browser;
	private static LivroDao livroDao = new LivroDao();
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		System.setProperty("webdriver.chrome.driver", "C:/chromedriver.exe");
		
		browser = new ChromeDriver();
		browser.manage().timeouts().implicitlyWait(3, TimeUnit.SECONDS);
	}
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
		browser.quit();
	}
	
	@BeforeEach
	void setUp() throws Exception {
		livroDao.deleteAll();
	}
	
	@Test
	void testeCriaNovoLivro() {
		browser.get("http://localhost:8080/ProjetoFinalP2/projeto/");
		browser.findElement(By.linkText("Livro")).click();
		
		browser.findElement(By.id("novoRegistro")).click();
		browser.findElement(By.name("titulo")).sendKeys("Harry Potter");
		browser.findElement(By.name("autor")).sendKeys("JK Rowling");
		browser.findElement(By.name("editora")).sendKeys("Rocco");
		browser.findElement(By.name("ano_publicacao")).sendKeys("2000");
		browser.findElement(By.id("gravar")).click();
		browser.switchTo().alert().accept();
		
		WebElement row = browser.findElement(By.cssSelector("tbody tr:first-child"));
		List<WebElement> tds = row.findElements(By.tagName("td"));

		assertEquals("Harry Potter", tds.get(1).getText());
		assertEquals("JK Rowling", tds.get(2).getText());
		assertEquals("Rocco", tds.get(3).getText());
		assertEquals("2000", tds.get(4).getText());
	}
	
	@Test
	void testeEditarLivro() {	
		Livro livro = new Livro("Harry Potter", "JK Rowling", "Rocco", "2000");
		livroDao.insert(livro);
		
		browser.get("http://localhost:8080/ProjetoFinalP2/projeto/");
		browser.findElement(By.linkText("Livro")).click();
		
		browser.findElement(By.linkText("Alterar")).click();
		browser.findElement(By.name("titulo")).clear();
		browser.findElement(By.name("titulo")).sendKeys("Caixa de pássaros");
		browser.findElement(By.id("atualizar")).click();
		browser.switchTo().alert().accept();
		
		WebElement row = browser.findElement(By.cssSelector("tbody tr:first-child"));
		List<WebElement> tds = row.findElements(By.tagName("td"));

		assertEquals("Caixa de pássaros", tds.get(1).getText());
	}
	
	@Test
	void testeExcluirLivro() {	
		Livro livro = new Livro("Harry Potter", "JK Rowling", "Rocco", "2000");
		livroDao.insert(livro);
		
		browser.get("http://localhost:8080/ProjetoFinalP2/projeto/");
		browser.findElement(By.linkText("Livro")).click();
		
		browser.findElement(By.linkText("Excluir")).click();
		browser.switchTo().alert().accept();
		
		WebElement tbody = browser.findElement(By.tagName("tbody"));
		List<WebElement> rows = tbody.findElements(By.tagName("tr"));

		assertEquals(0, rows.size());
	}
	
	@Test
	void testePesquisarLivro() {
		Livro livro1 = new Livro("Harry Potter", "JK Rowling", "Rocco", "2000");
		Livro livro2 = new Livro("A", "B", "C", "2000");
		livroDao.insert(livro1);
		livroDao.insert(livro2);
		
		browser.get("http://localhost:8080/ProjetoFinalP2/projeto/");
		browser.findElement(By.linkText("Livro")).click();
		
		browser.findElement(By.name("pesquisarLivro")).sendKeys("Harry");
		browser.findElement(By.id("pesquisar")).click();
		
		WebElement tbody = browser.findElement(By.tagName("tbody"));
		List<WebElement> rows = tbody.findElements(By.tagName("tr"));
		WebElement row = browser.findElement(By.cssSelector("tbody tr:first-child"));
		List<WebElement> tds = row.findElements(By.tagName("td"));
		
		// Traz apenas um resultado
		assertEquals(1, rows.size());
		assertEquals("Harry Potter", tds.get(1).getText());
		assertEquals("JK Rowling", tds.get(2).getText());
		assertEquals("Rocco", tds.get(3).getText());
		assertEquals("2000", tds.get(4).getText());
	}
}
