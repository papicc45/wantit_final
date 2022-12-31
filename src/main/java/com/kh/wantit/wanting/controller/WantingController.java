package com.kh.wantit.wanting.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.wantit.common.model.vo.Image;
import com.kh.wantit.member.vo.Member;
import com.kh.wantit.wanting.exception.WantingException;
import com.kh.wantit.wanting.model.service.WantingService;
import com.kh.wantit.wanting.model.vo.Wanting;
import com.kh.wantit.wanting.model.vo.WantingAttend;


@Controller
public class WantingController {
	
	@Autowired
	private WantingService wService;
	
	@RequestMapping("wantingWrite.want")
	public String wantingWrite() {
	      return "wantingWrite";
	}

	@RequestMapping("wantingNotice.want")
	public String wantingNotice() {
	      return "wantingNotice";
	}
	
	@RequestMapping("wantingNoticeDetail.want")
	public String wantingNoticeDetail() {
	      return "wantingNoticeDetail";
	}
	
	
	// ==================== 원팅 작성 ====================
	@RequestMapping("insertWanting.want")
	public String inserteWanting(@ModelAttribute Wanting w, @RequestParam("wanting-file") ArrayList<MultipartFile> files, HttpServletRequest request) {
//		String wantingWriter = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		String wantingWriter = "user05";
		w.setWantingWriter(wantingWriter);
		
		System.out.println(w);
		System.out.println(files); // 받아온 파일들 ArrayList

		int result1 = wService.insertWanting(w); // 원팅 삽입
		int result2 = 0; // 이미지 삽입
		
		// 이미지 속성값 설정
		ArrayList<Image> list = new ArrayList<Image>();
		for(int i = 0; i < files.size(); i++) {
			MultipartFile upload = files.get(i);
			System.out.println(upload.getOriginalFilename());
			
			if(!upload.getOriginalFilename().equals("")) {	//upload에 오리지날 이름이 빈칸이 아니라면
			// if(upload != null && !upload.isEmpty()) {	// upload가 null이 아니고 upload가 비어있지 않다면
				String[] returnArr = saveFile(upload, request, i);
				// 파일이 upload 객체에 있는데 saveFile 함수를 거쳐서
				// returnArr[0]에는 저장경로 returnArr[1]에는 변경한 이름이 들어있다

				if(returnArr[1] != null) {
					// 리네임이 null이 아니라면
					Image img = new Image(); // img에 속성값을 넣어서 추가하자
					
					String originFileName = upload.getOriginalFilename();
					img.setImageForm(originFileName.substring(originFileName.lastIndexOf(".")));
					img.setOriginName(originFileName);
					img.setImageRename(returnArr[1]);
					img.setImageSrc(returnArr[0]);
					img.setImageBoardCate(4);
					img.setImageBoardId(100);
					list.add(img); // 받아온 files에 정보를 넣어서 Image list에 넣자
					System.out.println(upload.getOriginalFilename() + "list넣기");
				}
			}
		}
			
		// 이미지 속성값 설정 - 썸네일
		for(int i = 0; i < list.size(); i++) {
			Image img = list.get(i);
			if(i == 0) {
				img.setImageLevel(0);
			} else {
				img.setImageLevel(1);
			}
			result2 = wService.insertImage(img); // 이미지 삽입
			System.out.println(img + "삽입");

		}
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:wantingList.want";
		} else {
			throw new WantingException("원팅 삽입 실패");
		}
	}


	// ==================== 원팅 작성 - 이미지 처리 ====================
	public String[] saveFile(MultipartFile file, HttpServletRequest request, int i) {
		// saveFile이 있는 이유 : 우리가 지정한 경로에 넣어주고 자체형식으로 이름을 지정해줘야함 
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		// WEB-INF안에 있는 resources(정적파일관리)를 도달하려고 하는 경로
		
		// 윈도우OS 경로
		// String savePath = root + "\\wantingImage";
		// 맥OS 경로
		String savePath = root + "/wanting"; 
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); // 폴더가 없으면 폴더 만들기
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		// 날짜 이용하기 위해서 simpleDateFormat 이용
		
		int ranNum = (int)(Math.random()*1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "wantit " + sdf.format(new Date(System.currentTimeMillis())) + i + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 지어줌 : 					데이터 업로드된 날짜 및 시간 (+ 랜덤값은 넣기 싫어)			 + 몇번째 + 랜덤 + 원본파일에서 가장 마지막 . 뒤에 추출(파일확장자명 추출)
		
		String renamePath = folder + "//" + renameFileName;
		// 변경된 이름을 파일에 다시 저장
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath; // 저장 경로 넣기
		returnArr[1] = renameFileName; // 변경한 이름 넣기
		
		return returnArr;
	}
	

	// ==================== 원팅 작성 - 써머노트 이미지 ====================
	@RequestMapping("summernoteImage.want")
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("resources");
		// WEB-INF안에 있는 resources(정적파일관리)를 도달하려고 하는 경로
		String savePath = root + "/wanting/summernote"; 
		// 맥OS 경로
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs(); // 폴더가 없으면 폴더 만들기
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		// 날짜 이용하기 위해서 simpleDateFormat 이용
		int ranNum = (int)(Math.random()*1000);
		String originFileName = file.getOriginalFilename();
		String renameFileName = "wantit " + sdf.format(new Date(System.currentTimeMillis())) + ranNum + "sm" + originFileName.substring(originFileName.lastIndexOf("."));
		// 이름을 다시 지어줌 : 					데이터 업로드된 날짜 및 시간 (+ 랜덤값은 넣기 싫어)			 + 랜덤 + 원본파일에서 가장 마지막 . 뒤에 추출(파일확장자명 추출)
		String renamePath = folder + "//" + renameFileName;
		// 변경된 이름을 파일에 다시 저장
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} // 여기까지는 일반 첨부파일과 동일
		
		System.out.println("파일경로 : " + renamePath);
		PrintWriter out = response.getWriter();
		// out 출력 : org.apache.catalina.connector.CoyoteWriter@6472c824

		out.println(renameFileName); // 파일명 전송 
		out.close(); // 닫아줘야 한다
	}
	
	
	// ==================== 원팅 리스트 불러오기 ====================
	@RequestMapping("/wantingList.want")
	public String wantingList(Model model) {
		ArrayList<Wanting> wantingList = wService.selectWantingList();
		ArrayList<Image> imageList = wService.selectImageList();// 
		System.out.println(wantingList);
		System.out.println(imageList);
		
		if(wantingList != null && wantingList != null) {
			model.addAttribute("wantingList", wantingList);
			model.addAttribute("imageList",imageList);
			return "wantingListView";
	      } else {
	         throw new WantingException("원팅 리스트 조회 실패");
	      }
	}
	
	
	// ==================== 원팅 상세보기 ====================
	@RequestMapping("selectWanting.want")
	public String selectWanting(@RequestParam("wantingNum") int wantingNum, Model model, HttpSession session) {
		
		// 원팅 가져오기
		Wanting w = wService.selectWanting(wantingNum);
		System.out.println("원팅 상세보기 원팅 : " + w);
		
		
		// 원팅 며칠 지났는지 넣기 -> 디비
		//LocalDate wantingDate = LocalDate.parse(w.getWantingCreateDate().toString(), DateTimeFormatter.ISO_DATE); // 형변환 해주고 형식 맞춰주기. 어이없네 정말.
		//LocalDate currentDate = LocalDate.now(); // 현재 시간
		//System.out.println("시작일: " + wantingDate);
	    //System.out.println("종료일: " + currentDate);
	    
	    //Period diff = Period.between(wantingDate, currentDate); // 이건 몇년 몇개월 몇일 형식으로 나옴
	    //System.out.printf("두 날짜 사이 기간: %d년 %d개월 %d일", diff.getYears(), diff.getMonths(), diff.getDays());
	    //int diffDays = (int)ChronoUnit.DAYS.between(wantingDate, currentDate); // ChronoUnit으로 하면 바로 날짜가 나온다. long➝int 형변환
	    //System.out.println("두 날짜 사이 일수 : " + diffDays);
	    //w.setWantingDaysCount(diffDays);
	    
	    
		// 작성자인지 확인하는 건 프론트에서
		// 사용자가 원팅했는지 확인하기
		boolean wantingYN = false;
		if(session.getAttribute("loginUser") != null) {
			String id = ((Member)session.getAttribute("loginUser")).getMemberId();
			WantingAttend join = new WantingAttend(id, wantingNum);
			System.out.println(join);
			int result = wService.getWantingYN(join);
			if(result > 0) {
				wantingYN = true; 
			} else {
				wantingYN = false;
			}
		}
		
		// 이미지 가져와서 썸네일만 보내기
		ArrayList<Image> imageList = wService.selectImage(wantingNum);
		Image thumbnail = null;
		for(int i = 0; i < imageList.size(); i++) {
			if(imageList.get(i).getImageLevel() == 0) {
				thumbnail = imageList.get(i);
			}
		}
		System.out.println("원팅 상세보기 이미지 : " + imageList);

		if (w != null && imageList != null) {
			model.addAttribute("wanting", w);
			model.addAttribute("wantingYN", wantingYN);
			model.addAttribute("thumbnail", thumbnail);
			return "wantingMain";
		} else {
			throw new WantingException("원팅 상세보기 실패");
		}
		
	}

	
	// ==================== 원팅 참여하기 ====================
	@RequestMapping("attendWanting.want")
	public String attendWanting(@RequestParam("wantingNum") int wantingNum, HttpSession session, RedirectAttributes redirectAttributes) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		WantingAttend join = new WantingAttend(id, wantingNum);
		System.out.println("원팅 참여한다면 이것 : " + join);
		
		int result1 = wService.attendWanting(join);
		
		// 원팅에 참여자수랑 달성단계 DB에 넣기
		Wanting w = wService.selectWanting(wantingNum);
		int wantingCount = wService.getWantingCount(wantingNum);
		w.setWantingCount(wantingCount);
		
		int wantingLevel = 0;
		if(wantingCount <= 100) {
			wantingLevel = 1;
		} else if(wantingCount <= 500) {
			wantingLevel = 2;
		} else if(wantingCount <= 1000) {
			wantingLevel = 3;
		} else {
			wantingLevel = 9;
		}
		w.setWantingLevel(wantingLevel);
		System.out.println("원팅 참여 업데이트 : " + w);
		
		int result2 = wService.updateWantingStatus(w);
		System.out.println("result1 : " + result1 + "/ result2 : " + result2);
		
		if(result1 > 0 && result2 > 0) {
			redirectAttributes.addAttribute("wantingNum", wantingNum);
			return "redirect:selectWanting.want";
		} else {
			throw new WantingException("원팅하기 실패");
		}
	}

	
	// ==================== 원팅 수정하기 ====================
	@RequestMapping("editWanting.want")
	public String editWanting(@RequestParam("wantingNum") int wantingNum, HttpSession session) {
		
		return null;
	}

	
	// ==================== 원팅 삭제하기 ====================
	@RequestMapping("deleteWanting.want")
	public String deleteWanting(@RequestParam("wantingNum") int wantingNum, HttpSession session) {
		
		return null;
	}

	
	
	
}
