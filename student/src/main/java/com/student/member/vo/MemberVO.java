package com.student.member.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String imageFileName;
	private int articleNO;
	private Date joinDate;
 
	public MemberVO() {}
	
	public MemberVO(String id) {
		this.id = id;
	}
	
	public MemberVO(String id, String pwd, String name, String email, String imageFileName, int articleNO) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.imageFileName = imageFileName;
		this.articleNO = articleNO;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImageFileName() {
		try {
			if(imageFileName !=null &&imageFileName.length()!=0) {
				imageFileName = URLDecoder.decode(imageFileName,"utf-8");
			}
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName !=null &&imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"utf-8");
			}			
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public int getArticleNO() {
		return articleNO;
	}
	
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", imageFileName="
				+ imageFileName + ", articleNO=" + articleNO + ", joinDate=" + joinDate + "]";
	}
	
	
}