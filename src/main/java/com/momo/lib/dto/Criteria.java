package com.momo.lib.dto;

public class Criteria {
	
	private int pageNo = 1 ;     // 요청한 페이지 번호
	private int amount = 10 ;    // 한 페이지에 노출할 리스트의 개수
	
	private int startNum ;       // 조회할 리스트의 시작 번호
	private int endNum ;         // 조회할 리스트의 마지막 번호
	
	// 생성자
	public Criteria(String pageNo, String amount) {
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo) ;
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount) ;
		}
		
		endNum = this.pageNo * this.amount ;
		startNum = endNum - (this.amount - 1) ;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

}
