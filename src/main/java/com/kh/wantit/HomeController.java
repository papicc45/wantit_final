package com.kh.wantit;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Date;

import org.apache.http.HttpResponse;
import org.apache.maven.doxia.site.decoration.Banner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.wantit.admin.model.service.AdminService;
import com.kh.wantit.common.model.vo.BannerImage;
import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.funding.model.service.FundingService;
import com.kh.wantit.funding.model.vo.Funding;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private WantingService wService;
	@Autowired
	private FundingService fService;
	@Autowired
	private AdminService aService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		ArrayList<Wanting> wantingList = wService.selectWantingList();
		ArrayList<Image> wantingImageList = wService.selectImageList();// 

		ArrayList<Funding> fundingList = fService.fundingList();
		
		ArrayList<BannerImage> biList = aService.selectBannerIamgeList();
		
		ArrayList<Funding> fundingComingSoonList = new ArrayList<Funding>();
		ArrayList<Funding> fundingProceedList = new ArrayList<Funding>();
		
		Date now = new Date();
		
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				if(fundingComingSoonList.size() < 6) {
					fundingComingSoonList.add(f);
				}
			} else {
				if(fundingProceedList.size() < 6) {
					fundingProceedList.add(f);
				}
			}
		}

		
		model.addAttribute("fundingComingSoonList", fundingComingSoonList);
		model.addAttribute("fundingProceedList", fundingProceedList);
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("wantingImageList", wantingImageList);
		
		model.addAttribute("biList", biList);
		
		
		return "home";
	}
	
	@RequestMapping("search.do")
	public String search(@RequestParam(value = "searchText", required = false) String searchText, 
										@RequestParam(value = "searchCate", required = false) String cate,  Model model) {
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		ArrayList<Wanting> wantingList = new ArrayList<Wanting>();
		System.out.println(searchText);
		System.out.println(cate);
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			wantingList = wService.searchWantingList(searchText);
			model.addAttribute("searchText", searchText);
			model.addAttribute("wantingList", wantingList);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		model.addAttribute("fundingList", fundingList);
		
		return "common/searchView";
	}
	@RequestMapping("searchFP.do")
	public String searchFP(@RequestParam(value = "searchText", required = false) String searchText, 
											@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		ArrayList<Funding> fundingFPList = new ArrayList<Funding>();
		
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			model.addAttribute("searchText", searchText);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		Date now = new Date();
		for(Funding f : fundingList) {
			if(f.getFundingStart().compareTo(now) == -1) {
				fundingFPList.add(f);
			}
		}
		
		model.addAttribute("fundingList", fundingFPList);
		return "common/searchAjaxProceed";
	}
	
	@RequestMapping("searchFCS.do")
	public String searchFCS(@RequestParam(value = "searchText", required = false) String searchText, 
												@RequestParam(value = "searchCate", required = false) String cate, Model model) {
		ArrayList<Funding> fundingFCSList = new ArrayList<Funding>();
		
		ArrayList<Funding> fundingList = new ArrayList<Funding>();
		
		if(searchText != null) {
			fundingList = fService.searchFundingList(searchText);
			model.addAttribute("searchText", searchText);
		} else if(cate != null) {
			fundingList = fService.searchFundingList(cate);
			model.addAttribute("cate", cate);
		}
		
		Date now = new Date();
		for(Funding f : fundingList) {
			if(now.compareTo(f.getFundingStart()) == -1) {
				fundingFCSList.add(f);
			}
		}
		
		model.addAttribute("fundingList", fundingFCSList);
		
		return "common/searchAjaxComingSoon";
	}
	
	@RequestMapping("searchWant.do")
	public String searchWant(@RequestParam("searchText") String searchText, Model model) {
		ArrayList<Wanting> wantingList = wService.searchWantingList(searchText);
		ArrayList<Image> imageList = wService.selectImageList();
		
		model.addAttribute("wantingList", wantingList);
		model.addAttribute("imageList", imageList);
		
		return "common/searchAjaxWant";
	}
	
	
	@RequestMapping("noticeEvent.do")
	public String noticeEvent() {
		return "common/noticeAndEvent";
	}
	
	//로그인 페이지
	@RequestMapping("/loginenroll.me")
	public String loginenroll() {
		return "myPage_login";
	}
	
}
