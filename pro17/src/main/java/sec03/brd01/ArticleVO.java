package sec03.brd01;
import java.sql.Date;

public class ArticleVO {
	private int level;
	private int articleNO;
	private int parentNO;
	private String title;
	private String imageFileName;
	public ArticleVO(int level, int articleNO, int parentNO, String title, String content, String imageFileName,
			String id, Date writeDate) {
		this.level = level;
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.id = id;
		this.writeDate = writeDate;
	}

	private String content;
	private String imageFIleName;
	private String id;
	private Date writeDate;
	
	public ArticleVO() {
		
	}

	public ArticleVO(int articleNO, int parentNO, String title, String content, String imageFileName, String id) {
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.id = id;
	}
	
	public ArticleVO(int articleNO, int parentNO, String title, String content, String imageFileName, String id, 
			Date writeDate) {
		this.articleNO = articleNO;
		this.parentNO = parentNO;
		this.title = title;
		this.content = content;
		this.imageFileName = imageFileName;
		this.id = id;
		this.writeDate = writeDate;
	}

	public int getArticleNO() {
		return articleNO;
	}

	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}

	public int getParentNO() {
		return parentNO;
	}

	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
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

	public String getImageFIleName() {
		return imageFIleName;
	}

	public void setImageFIleName(String imageFIleName) {
		this.imageFIleName = imageFIleName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
}
