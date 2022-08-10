package sec03.brd02;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/servletex");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

	public List<ArticleVO> selectAllArticles() {
		
		List articlesList = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "SELECT function_hierarchical() AS articleNO, @LEVEL AS level,title,parentNO ,content,id,writeDate"
					+ " FROM (SELECT @start_with:=0, @articleNO:=@start_with, @LEVEL:=0) tbl"
					+ " JOIN t_board";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int level = rs.getInt("level");
				int articleNO = rs.getInt("articleNO");
				int parentNO = rs.getInt("parentNO");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String id = rs.getString("id");
				Date writeDate = rs.getDate("writeDate");
				ArticleVO article = new ArticleVO();
				article.setLevel(level);
				article.setArticleNO(articleNO);
				article.setParentNO(parentNO);
				article.setTitle(title);
				article.setContent(content);
				article.setId(id);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return articlesList;
	}



	private int getNewArticleNO() {
		try {
			con = dataFactory.getConnection();
			String query = "select max(articleNO) from t_board";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				return (rs.getInt(1)+1);
				rs.close();
				pstmt.close();
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
	
	public void insertNewArticle(ArticleVO article) {
		try {
			con = dataFactory.getConnection();
			int articleNO = getNewArticleNO();
			int parentNO = article.getParentNO();
			String title = article.getTitle();
			String content = article.getContent();
			String id = article.getId();
			String imageFileName = article.getImageFileName();
			System.out.println(imageFileName);
			String query = "INSERT INTO t_board (articleNO, parentNO, title, content, imageFileName, id)"
			+ " VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,articleNO);
			pstmt.setInt(2,parentNO);
			pstmt.setString(3,title);
			pstmt.setString(4,content);
			pstmt.setString(5,imageFileName);
			pstmt.setString(6,id);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
}