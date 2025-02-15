﻿package com.kh.wantit.funding.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.wantit.admin.model.vo.PageInfo;
import com.kh.wantit.admin.model.vo.ReviewReport;
import com.kh.wantit.common.model.vo.Alarm;
import com.kh.wantit.common.model.vo.CreatorImage;
import com.kh.wantit.common.model.vo.Follow;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.funding.model.vo.FundingDibs;
import com.kh.wantit.funding.model.vo.FundingMessage;
import com.kh.wantit.funding.model.vo.FundingNotice;
import com.kh.wantit.funding.model.vo.Review;
import com.kh.wantit.funding.model.vo.SupportCount;
import com.kh.wantit.member.vo.Creator;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.pay.vo.PaySchedule;
import com.kh.wantit.pay.vo.Reward;

public interface FundingService {

	int insertFunding(Funding f);

	int insertImage(Image i);

	ArrayList<Funding> fundingList();

	ArrayList<Funding> searchFundingList(Map<String, String> searchMap);

	String getCreatorName(String id);

	ArrayList<Image> fundingImageList();

	int getCreatorNum(String id);

	String checkWriter(int creatorNum);

	Funding getFunding(int bId, boolean yn);

	Image getImage(int bId);

	String getFundingCreator(int bId);

	int insertFundingNotice(FundingNotice fn);

	ArrayList<FundingNotice> fundingNoticeList(int bId, PageInfo pi);

	int fnListCount(int bId);

	ArrayList<FundingNotice> getFundingNotice(String writer, int bId, boolean yn);

	int insertReward(Reward r);

	Funding getCurrFunding(int bId);

	int getFundingCreatorNum(String writer);

	ArrayList<Reward> fundingRewardList(int bId);

	Funding getFundingInfo(int fundingNum);

	int fundingEdit(Funding f);

	ArrayList<Review> getFundingReview(int fundingNum, PageInfo pi);

	ArrayList<PaySchedule> getPayList(int fundingNum);

	int getSupportCount(int fundingNum);

	int getReviewCount(int fundingNum);
	
	int insertReview(Review review);

	int checkExistReview(Review r);

	
	int getListCountR(int fundingNum);

	ArrayList<Funding> getFundingIngListRanking();

	ArrayList<Funding> getFundingEndLatest();

	ArrayList<Funding> getFundingEndRanking();

	int insertDibs(FundingDibs dibs);

	int deleteDibs(FundingDibs dibs);

	ArrayList<Member> getReviewerNickName(Integer fundingNum);

	int getDibsCount(int bId);

	ArrayList<FundingDibs> getDibs(int bId);
	
	int fundingConfirmUpdate(int fundingNum);

	ArrayList<Funding> getMyFundingList(String nickName);

	ArrayList<Funding> popularList();

	ArrayList<Funding> sortList(String sortType);

	ArrayList<Funding> sortCateList(String cate);

	ArrayList<Funding> getUserFundingList(String userId);

	int insertInquiry(FundingMessage fm);

	Creator getCreatorInfo(int creatorNum);

	ArrayList<Funding> getFundingListFromCreatorNum(int creatorNum);

	ArrayList<Review> getReviewList(int creatorNum);

	int insertAlarm(Alarm alarm);

	int checkAlreadyApplyAlarm(Alarm alarm);


	ArrayList<PaySchedule> fundingSupportor(int fundingNum);

	Member getMember(String buyerName);

	Image getMemberImage(String buyerName);

	String getCreator(String creatorNickname);

	int follow(Follow f);

	ArrayList<Follow> getFollowList(Integer creatorNum);

	int getFollowerCount(Integer creatorNum);

	int unfollow(Follow f);

	Image getCreatorImage(String writerCheckId);

	int reportReview(ReviewReport rr);

	int getDibsCount2(String userId);

	ArrayList<Funding> getDibsFundingList(PageInfo pi, String userId);

	int getListCountN(int bId);


}
