package com.myspring.pro30.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("imageVO")
public class ImageVO {
	private int imageFileNO;
	private int articleNO;
	private String imageFileName;
	private Date refDate;
	
	
	public ImageVO(int imageFileNO, int articleNO, String imageFileName, Date refDate) {
		super();
		this.imageFileNO = imageFileNO;
		this.articleNO = articleNO;
		this.imageFileName = imageFileName;
		this.refDate = refDate;
	}



	public ImageVO() {
	}



	public int getImageFileNO() {
		return imageFileNO;
	}



	public void setImageFileNO(int imageFileNO) {
		this.imageFileNO = imageFileNO;
	}



	public int getArticleNO() {
		return articleNO;
	}



	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}



	public String getImageFileName() {
		return imageFileName;
	}



	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}



	public Date getRefDate() {
		return refDate;
	}



	public void setRefDate(Date refDate) {
		this.refDate = refDate;
	}



	
	
}
