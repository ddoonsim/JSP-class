package com.momo.el;


public class MyElClass {
	
	public String gender ;
	
	/**
	 * 주민등록번호를 입력 받아서 성별을 반환
	 * @param jumin
	 * @return 성별(남/여)
	 */
	public String getGender(String jumin) {
		String gender = "" ;
		
		int startIndex = jumin.indexOf("-") + 1 ;
		String str = jumin.substring(startIndex, startIndex + 1) ;
		if("1".equals(str) || "3".equals(str)) {
			gender = "남자" ;
		} else if ("2".equals(str) || "4".equals(str)) {
			gender = "여자" ;
		} else {
			gender = "주민등록번호를 확인해주세요." ;
		}
		
		this.gender = gender ;
		return gender ;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public static void main(String[] args) {
		
		MyElClass e = new MyElClass() ;
		System.out.println(e.getGender("000000-1000000"));
		System.out.println(e.getGender("000000-2000000"));
		System.out.println(e.getGender("000000-3000000"));
		System.out.println(e.getGender("000000-4000000"));
		System.out.println(e.getGender("000000-5000000"));
		
	}

}
