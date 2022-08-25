package com.myspring.pro29.ex03;

public class ArticleVO {
	int articleNO;
	String writer;
	String title;
	String content;
	public ArticleVO() {
	}
	public ArticleVO(int articleNO, String writer, String title, String content) {
		this.articleNO = articleNO;
		this.writer = writer;
		this.title = title;
		this.content = content;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	
	
}
