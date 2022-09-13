package com.myspring.pro30.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;



@Controller
public class FileDownloadController {
   private static String ARTICLE_IMAGE_REPO ="c:\\board\\article_imagefile";
   
   @RequestMapping("/download.do")

   public void download(@RequestParam("imageFileName") String imageFileName,
		   			 @RequestParam("articleNO") String articleNO,
                     HttpServletResponse response)throws Exception{
      OutputStream out = response.getOutputStream();
      String downFile = ARTICLE_IMAGE_REPO+ "\\" + articleNO + "\\" +imageFileName;

      File image= new File(downFile);
      int lastIndex = imageFileName.lastIndexOf(".");
      String fileName= imageFileName.substring(0,lastIndex);
      File thumbnail = new File(ARTICLE_IMAGE_REPO+"\\"+ articleNO +"\\"+fileName+".png");
      if(image.exists()) {
         thumbnail.getParentFile().mkdirs();
         //폴더만들지 못해도  makedirectory해서 폴더생성
         Thumbnails.of(image).size(50,50).outputFormat("png").toFile(thumbnail);
   
      }
      FileInputStream in = new FileInputStream(thumbnail);
      byte[] buffer = new byte[1024*8];
      while(true) {
         int count = in.read(buffer);
         if(count==-1)
            break;
         out.write(buffer,0,count);
      }
      in.close();
      out.close();
   }
}