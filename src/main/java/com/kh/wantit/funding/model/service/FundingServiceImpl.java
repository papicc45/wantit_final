package com.kh.wantit.funding.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.dao.FundingDAO;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingDibs;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;

@Service("fService")
public class FundingServiceImpl implements FundingService{

	@Autowired
	private FundingDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertFunding(Funding f) {
		return fDAO.insertFunding(f, sqlSession);
	}

	@Override
	public int insertImage(Image i) {
		return fDAO.insertImage(i, sqlSession);
	}

	@Override
	public ArrayList<Funding> fundingList() {
		return fDAO.fundingList(sqlSession);
	}
	
	@Override
	public ArrayList<Funding> searchFundingList(String searchText) {
		return fDAO.searchFundingList(sqlSession, searchText);
	}

	@Override
	public String getCreatorName(String id) {
		return fDAO.getCreatorName(sqlSession, id);
	}

	@Override
	public ArrayList<Image> fundingImageList() {
		return fDAO.fundingImageList(sqlSession);
	}

	@Override
	public int getCreatorNum(String id) {
		return fDAO.getCreatorNum(id, sqlSession);
	}

	@Override
	public String checkWriter(int creatorNum) {
		return fDAO.checkWriter(sqlSession, creatorNum);
	}

	@Override
	public Funding getFunding(int bId, boolean yn) {
		int result = 0;
		if(yn) {
			result = fDAO.addCount(bId, sqlSession);
		}
		return fDAO.getFunding(sqlSession, bId);
	}

	@Override
	public Image getImage(int bId) {
		return fDAO.getImage(sqlSession, bId);
	}

	@Override
	public String getFundingCreator(int bId) {
		return fDAO.getFundingCreator(bId, sqlSession);
	}

	@Override
	public int insertFundingNotice(FundingNotice fn) {
		return fDAO.insertFundingNotice(fn, sqlSession);
	}

	@Override
	public ArrayList<FundingNotice> fundingNoticeList(int bId) {
		return fDAO.fundingNoticeList(bId, sqlSession);
	}

	@Override
	public int fnListCount(int bId) {
		return fDAO.fnListCount(bId, sqlSession);
	}

	@Override
	public FundingNotice getFundingNotice(int bId, boolean yn) {
		int result = 0;
		if(yn) {
			result = fDAO.addNoticeCount(bId, sqlSession);
		}
		return fDAO.getFundingNotice(bId, sqlSession);
	}

	@Override
	public int insertReward(Reward r) {
		return fDAO.insertReward(r, sqlSession);
	}

	@Override
	public Funding getCurrFunding(int bId) {
		return fDAO.getCurrFunding(bId, sqlSession);
	}

	@Override
	public int getFundingCreatorNum(String writer) {
		return fDAO.getFundingCreatorNum(writer, sqlSession);
	}

	@Override
	public ArrayList<Reward> fundingRewardList(int bId) {
		return fDAO.fundingRewardList(bId, sqlSession);
	}

	@Override
	public Funding getFundingInfo(int bId) {
		return fDAO.getFundingInfo(bId, sqlSession);
	}

	@Override
	public int fundingEdit(Funding f) {
		return fDAO.fundingEdit(f, sqlSession);
	}

	@Override
	public ArrayList<Review> getFundingReview(int fundingNum, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.getFundingReview", fundingNum);
	}

	@Override
	public ArrayList<PaySchedule> getPayList(int fundingNum) {
		return fDAO.getPayList(fundingNum, sqlSession);
	}

	@Override
	public int getSupportCount(int fundingNum) {
		return fDAO.getSupportCount(fundingNum, sqlSession);
	}

	@Override
	public int getReviewCount(int fundingNum) {
		return fDAO.getReviewCount(fundingNum, sqlSession);
	}

	@Override
	public int getListCountR(int fundingNum) {
		return fDAO.getListCountR(fundingNum, sqlSession);
	}

	@Override
	public ArrayList<Funding> getFundingIngListRanking() {
		return fDAO.getFundingIngListRanking(sqlSession);
	}

	@Override
	public ArrayList<Funding> getFundingEndLatest() {
		return fDAO.getFundingEndLatest(sqlSession);
	}

	@Override
	public ArrayList<Funding> getFundingEndRanking() {
		return fDAO.getFundingEndRanking(sqlSession);
	}

	@Override
	public int insertDibs(FundingDibs dibs) {
		return fDAO.insertDibs(dibs, sqlSession);
	}

	@Override
	public int deleteDibs(FundingDibs dibs) {
		return fDAO.deleteDibs(dibs, sqlSession);
	}

	@Override
	public ArrayList<Member> getReviewerNickName(Integer fundingNum) {
		return fDAO.getReviewerNickName(fundingNum, sqlSession);
	}

}
