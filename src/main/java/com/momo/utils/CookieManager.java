package com.momo.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 쿠키 생성 및 출력 메서드를 만들기 위한 클래스 정의
public class CookieManager {

	// 기본 생성자
	public CookieManager() {

	}

	/**
	 * 쿠키를 생성 후 응답 객체에 저장하는 메서드
	 * 
	 * 쿠키를 생성하기 위해 필요한 데이터 -> 매개변수로 쿠키이름, 쿠키값, 만료시간, 응답객체
	 * 
	 * 사용자에게 응답하기 위해서 응답객체를 매개변수로 전달 받는다.
	 */
	public static void makeCookie(HttpServletResponse response, String name, String value, int time) {
		// 쿠키 생성
		Cookie cookie = new Cookie(name, value);

		// 쿠키 유지기간 설정
		cookie.setMaxAge(time);

		// 응답객체에 추가
		response.addCookie(cookie);
	}

	/**
	 * 요청객체로부터 쿠키배열을 호출한 뒤 원하는 쿠키이름을 찾아서 쿠키값을 반환하는 메서드
	 * 
	 * @return
	 */
	public static String readCookie(HttpServletRequest request, String name) {
		String value = "";
		// 요청객체로부터 쿠키배열을 획득
		Cookie[] cookies = request.getCookies();

		// 브라우저를 통해 처음 접근했을 때
		// 쿠키가 하나도 저장되어 있지 않은 경우
		// getCookies 메서드를 호출하면 null을 반환
		if (cookies != null) {
			// 쿠키 배열을 돌면서 쿠키이름이 일치하는 객체가 있는지 확인
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(name)) {
					value = cookie.getValue();
					break;
				}
			}
		}
		return value;
	}

	/**
	 * 쿠키 삭제 메서드
	 */
	public static void deleteCookie(HttpServletResponse response, String name) {
		// 쿠키 만료시간 -> 0
		makeCookie(response, name, "", 0);

	}

}
