package com.student.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.student.member.vo.MemberVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	//Sign Up
	public int insertMember(Map memberMap) throws DataAccessException ;
	//Sign Up시 이미지 넘버 등록
	public int selectNewArticleNO() throws DataAccessException;
	//Login
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	//수정 Page 이동시 id가져오기
	public MemberVO selectMemberById(MemberVO memberVO)  throws DataAccessException;
	//Edit Member
	public void updateMember(Map memberMap) throws DataAccessException;
	//
	public MemberVO selectMemberList(String id) throws DataAccessException;
}
