package sec01.ex01;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




@WebServlet("/upload.do")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		dohandel(request,response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		dohandel(request, response);
	}
	
	private void dohandel(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8"; //문자열 encoding에 = utf-8저장
		File currentDirPath = new File("c:\\file_repo"); //파일경로지만 이건 나중에 써먹을 경로 헷갈리지 말자
		File currentDirPath1 = new File("c:\\file_reop1"); // 새 파일 객체를 생성 이로 인해 일시적으로 나누는 메모리 공간을 확보
		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		//구현은 파일이 정해져있는 크기보다 작으면 유지 크기보다 크면 임시 저장소(repository)에 보관하는 메소드를 보유하고있음
		//즉 디스크에 저장되는 크기의 임계값(setsize)은 구성이 가능하며, 이 값을 넘을때 저장되는 공간(repository)를 지정하는 
		//메소드를 갖고 있음
		// multipart/form-data로 전송된 파라미터 또는 파일 정보를 저장하고 있는 클래스 -> fileitem
		factory.setRepository(currentDirPath1); //레포지토리: 경로 설정 -> 일시영역 저장
		factory.setSizeThreshold(1024*1024); //쓰레드 크기 -> 메모리버퍼의 최대값을 지정 -> 최대치시 임시 저장
		ServletFileUpload upload = new ServletFileUpload(factory); //서블릿 경유 파일데이터를 취득하는 클래스
		// 파일 업로드를 처리하기 위한 고레벨 api 
		// 이 클래스는 
		
		try {
			List items = upload.parseRequest(request); //특정 형식으로 보내진 데이터를 fileitem오브젝트에 분활하고 list콜렉션으로 돌려준다.
			for(int i = 0; i < items.size(); i ++) {
				System.out.println(items.size());
				FileItem fileItem = (FileItem) items.get(i); 
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));
				}else {
					System.out.println("매개변수이름:" + fileItem.getFieldName());
					System.out.println("파일이름:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\"); //업로된 파일의 파일명을 돌려준다.
						if(idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
							
						}	String fileName = fileItem.getName().substring(idx+1);
							File uploadFile = new File(currentDirPath + "\\" + fileName);
							fileItem.write(uploadFile); //업로드한 파일을  file이 아나태는 파일로 저장한다.
						} //end if
					} // end else
				} // end for
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
