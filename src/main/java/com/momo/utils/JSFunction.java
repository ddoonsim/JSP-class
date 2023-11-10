package com.momo.utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	
	/*
	 * 알림창을 띄우고 이전 페이지로 이동하는 메서드
	 */
	public static void alertBack(String msg, JspWriter out) {
		// 삽입할 자바스크립트 코드를 생성
		String script = "" + "<script type='text/javascript'>" 
						+ "alert('" + msg + "');"
						+ "history.go(-1);"
						+ "</script>" ;
		try {
			// out객체를 활용하여 스크립트를 화면에 출력
			out.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 알림창을 띄우고 URL로 이동하는 메서드
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		// 삽입할 자바스크립트 코드를 생성
		String script = "" + "<script type='text/javascript'>" 
						+ "alert('" + msg + "');"
						+ "location.href='" + url + "';"
						+ "</script>" ;
		try {
			// out객체를 활용하여 스크립트를 화면에 출력
			out.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

}
