package com.hipo.account_book.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hipo.account_book.vo.UserVo;
@Service 
public class ProfileService {
	private static final String URL = "account-book/";
	private static final String SAVE_PATH = "/image";
	
	@Autowired
	private ProfileDao dao;
	
	public UserVo checkUpdate(String id){
		return dao.checkUpdate(id);
	}

	public UserVo profile1(String id) {
	UserVo	vo = dao.profile1(id);
		return vo ;
	}

	public boolean updateProfile(String id, String name, MultipartFile photo, String password) {
		UserVo vo = new UserVo();
		vo.setName(name);
		vo.setId(id);
		vo.setPassword(password);
		dao.updateprofile(vo);
		String url = "";
		try{
			if(photo.isEmpty() == true){
				return  false;
			}
			
			String originalFileName = photo.getOriginalFilename();
			Long fileSize = photo.getSize();
			String extName = originalFileName.substring(originalFileName.lastIndexOf(".")+1,originalFileName.length());
			String saveFileName = generateSaveFileName(extName);
			
			url = URL + saveFileName;
			vo.setPhoto(saveFileName);
			writeFile(photo,saveFileName);//해주는 이유
		}catch (Exception e) {
			System.out.println("왜 못찾지?" + e);
		}
		return dao.updateprofilephoto(vo);
	}
	private void writeFile(MultipartFile file,String saveFileName)throws IOException
	{
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" +saveFileName);
		fos.write(data);
		fos.close();
		
	}
	private String generateSaveFileName(String extName)
	{
		String fileName="";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE); 
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += ("." + extName);
		return fileName;
	
	}

	public UserVo profileall(String id) {
	
			UserVo vo = dao.profileall(id);
			/*System.out.println("사진 =======" + vo);*/
			return vo;
	}

	public UserVo profileModify(String id) {
		return	 dao.profileModify(id);
		 
	}


/*	public UserVo checkUpdate1(String i) {
		return ;
	}
*/
}
