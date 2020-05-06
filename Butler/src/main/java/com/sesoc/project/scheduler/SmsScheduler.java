package com.sesoc.project.scheduler;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.sesoc.project.dao.CatDAO;
import com.sesoc.project.dao.MemberDAO;
import com.sesoc.project.vo.CatVO;
import com.sesoc.project.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Component
public class SmsScheduler {
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private CatDAO catDao;
	/*
	 * 
	 * CoolSMS API를 사용한 sms전송 메소드
	 *
	 */
	public void smsSend(String phone, String text) {
	    String api_key = "NCSGIB6NK1HORTNH";
	    String api_secret = "FCWI0B9TCORBPWE3VXLXSIB8CNQJDMT5";
	    // 내 계정 정보에서 가져온 key값들.
	    Message coolsms = new Message(api_key, api_secret);

	    // to, from, type, text 는 꼭 필요한 부분
	    // to, from 부 번호는 10-11자리 숫자로 구성된 문자열
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone); //to
	    params.put("from", "01032847782"); //from
	    params.put("type", "SMS"); //mms 등 옵션 존재
	    params.put("text", text); //text
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
	
	@Scheduled(cron="0 0 10 * * ?") //매일 오전 10시에 실행하자
//	@Scheduled(cron="0/15 * * * * ?") //15초에 한 번
	public void autoSms() {
		/*
		 * 기준점이 되는 현재 년월일 설정하기
		 */
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar td = Calendar.getInstance();
		td.setTime(new Date()); //Calendar형식의 현재 년월일
		String today = df.format(td.getTime()); //String형식의 현재 년월일
		
		
		/*
		 * 멤버 리스트의 고양이 생일을 기준으로 문자발송 여부 판별 및 전송 
		 */

	
		/*
		 * 문자 내용 설정
		 */
		//////////////////////////....../////////////////////////////////////
		String firstText = "総合ワクチン4種1次、(選択)白血病1次接種推奨時期です。";
		String secondText = "総合ワクチン4種2次、(選択)白血病2次接種推奨時期です。";
		String thirdText = "総合ワクチン4種3次、(選択)腹膜炎1次接種推奨時期です。";
		String fourthText = "(義務)狂犬病ワクチン、(選択)腹膜炎2次接種推奨時期です。";
		/////////////////////////////////////////////////////////////////////

		/*
		 * 반복문 돌려서 검증 후 발송메서드 이용해서 발송 
		 * */
		
		ArrayList<String>list = memberDao.smsOkList(); //smsOk한 userid ArrayList list
		for (String userid : list) {
			//MemberVO객체의 고양이생일을 가져와 calendar객체화
			
			ArrayList<CatVO>catList = catDao.getList(userid); //smsOk한 유저아이디가 가진 고양이들 정보 소환
			for(CatVO cat : catList) { //고양이들 정보에서 한 마리씩 검증

				String getCat_birth = cat.getCat_birth(); //고양이 생일 빼오기
				Calendar cal_catBD = Calendar.getInstance();
				Date date_catBD = null;
				try {
					date_catBD = df.parse(getCat_birth);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				cal_catBD.setTime(date_catBD);
				
				
				if(cal_catBD.get(Calendar.MONTH) == td.get(Calendar.MONTH) && cal_catBD.get(Calendar.DAY_OF_MONTH) == td.get(Calendar.DAY_OF_MONTH)) {
					String phone = memberDao.getPhone(cat.getUserid()); //userid를 통해 번호 빼오기
					phone = phone.replaceAll("=", "");
					smsSend(phone, cat.getCatname()+"の誕生日、おめでとうございます - 執事の条件");
				}
				
				//1차 : 생일로부터 2개월 후
				cal_catBD.add(Calendar.MONTH, 2);
				Calendar first = Calendar.getInstance();
				first = cal_catBD;
				if(today.equals(df.format(first.getTime()))) {
					String phone = memberDao.getPhone(cat.getUserid()); //userid를 통해 번호 빼오기
					phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
					smsSend(phone, cat.getCatname()+ "의 " + firstText); //번호로 메세지 전송
					System.out.println("1차 접종 맞아야 함" + phone + cat.getCatname());
				}
				//2차 : 생일로부터 3개월 후
				cal_catBD.add(Calendar.MONTH, 1);
				Calendar second = Calendar.getInstance();
				second = cal_catBD;
				if(today.equals(df.format(second.getTime()))) {
					String phone = memberDao.getPhone(cat.getUserid()); //userid를 통해 번호 빼오기
					phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
					smsSend(phone, cat.getCatname()+ "ちゃんの " + secondText); //번호로 메세지 전송
					System.out.println("2차 접종 맞아야 함" + phone + cat.getCatname());
				}
				//3차 : 생일로부터 4개월 후
				cal_catBD.add(Calendar.MONTH, 1);
				Calendar third = Calendar.getInstance();
				third = cal_catBD;
				if(today.equals(df.format(third.getTime()))) {
					String phone = memberDao.getPhone(cat.getUserid()); //userid를 통해 번호 빼오기
					phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
					smsSend(phone, cat.getCatname()+ "ちゃんの " + thirdText); //번호로 메세지 전송
					System.out.println("3차 접종 맞아야 함" + phone + cat.getCatname());
				}
				//4차 : 생일로부터 5개월 후
				cal_catBD.add(Calendar.MONTH, 1);
				Calendar fourth = Calendar.getInstance();
				fourth = cal_catBD;
				if(today.equals(df.format(fourth.getTime()))) {
					String phone = memberDao.getPhone(cat.getUserid()); //userid를 통해 번호 빼오기		
					phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
					smsSend(phone, cat.getCatname()+"ちゃんの " + fourthText); //번호로 메세지 전송
					System.out.println("4차 접종 맞아야 함" + phone + cat.getCatname());
				}
				
				
			}
		}
		
		
		
		
		/*
		/*DB에서 고양이생일을 받아서, Calendar 형식으로 맞춰준다.
		일자 관련 컬럼은 쿼리단에서 처리해 "yyyy-MM-dd"로 받자.

		String catBirthday = "2020-02-13"; //DB내의 고양이 생일 (실제로는 ArrayList로 대량으로 받아올 가능성이 크다.)
		
		Calendar cbd = Calendar.getInstance();
		Calendar cbd2 = Calendar.getInstance();
		Date date = null;
		Date date2 = null;
		try {
			date = df.parse(catBirthday);
			date2 = df.parse(catBirthday);
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		cbd.setTime(date);
		cbd2.setTime(date2);

		System.out.println("Cat birthDay : " + date); //String객체 catBirthday를 Calendar 객체로 변환. 
		*/
	}
}
