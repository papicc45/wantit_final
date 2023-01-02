package com.kh.wantit.wanting.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingAttend;

@Repository("wDAO")
public class WantingDAO {

	// 원팅 게시글 작성
	public int insertWanting(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.insert("wantingMapper.insertWanting", w);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("wantingMapper.insertImage", img);
	}

	// 원팅 리스트 불러오기
	public ArrayList<Wanting> selectWantingList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectWantingList");
	}

	public ArrayList<Image> selectImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectImageList");
	}


	// 원팅 게시글 상세보기
	public Wanting selectWanting(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.selectOne("wantingMapper.selectWanting", wantingNum);
	}

	public ArrayList<Image> selectImage(SqlSessionTemplate sqlSession, int wantingNum) {
		return (ArrayList)sqlSession.selectList("wantingMapper.selectImage", wantingNum);
	}

	public int getWantingYN(SqlSessionTemplate sqlSession, WantingAttend join) {
		return sqlSession.selectOne("wantingMapper.getWantingYN", join);
	}
	
	
	// 원팅 참여하기
	public int attendWanting(SqlSessionTemplate sqlSession, WantingAttend join) {
		return sqlSession.insert("wantingMapper.attendWanting", join);
	}
	
	public int getWantingCount(SqlSessionTemplate sqlSession, int wantingNum) {
		return sqlSession.selectOne("wantingMapper.getWantingCount", wantingNum);
	}

	public int updateWantingStatus(SqlSessionTemplate sqlSession, Wanting w) {
		return sqlSession.update("wantingMapper.updateWantingStatus", w);
	}

	public ArrayList<Wanting> searchWantingList(SqlSessionTemplate sqlSession, String searchText) {
		return (ArrayList)sqlSession.selectList("wantingMapper.searchWantingList", searchText);
	}



}
