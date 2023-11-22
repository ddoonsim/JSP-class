package com.momo.dto;

/**
 * 리스트를 조회하기 위한 파라미터 세팅
 */
public class Criteria {
	
	private int pageNo = 1 ;     // 페이지 번호
	private int amount = 10 ;    // 페이지 당 게시물 개수
	
	private String searchField = "" ;    // 검색필드
	private String searchWord = "" ;     // 검색어
	
	// 페이지 번호와 페이지 당 게시물의 개수를 받아서 조회할 게시글의 시작 번호와 끝 번호를 구함
	private int startNum ;    // 조회할 게시글의 시작 번호
	private int endNum ;      // 조회할 게시글의 끝 번호
	
	// 기본 생성자
	public Criteria() {
		// 시작 번호와 끝 번호 구하기
		// -> 페이지 조회 쿼리에서 사용됨
		endNum = this.pageNo * this.amount ;
		startNum = endNum - (this.amount - 1) ;
	}
	
	/**
	 * 생성자를 통해 페이지 번호와 페이지 당 게시물의 수를 매개 변수로 받아서
	 * 시작번호와 끝 번호를 구함
	 * @param pageNo
	 * @param amount
	 */
	public Criteria(String pageNo, String amount) {
		
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		
		endNum = this.pageNo * this.amount ;
		startNum = endNum - (this.amount - 1) ;
	}
	
	public Criteria(String pageNo, String amount, String searchField, String searchWord) {
		
		if(pageNo != null && !"".equals(pageNo)) {
			this.pageNo = Integer.parseInt(pageNo);
		}
		if(amount != null && !"".equals(amount)) {
			this.amount = Integer.parseInt(amount);
		}
		
		endNum = this.pageNo * this.amount ;
		startNum = endNum - (this.amount - 1) ;
		
		// 검색어 세팅
		if(searchField != null && !"".equals(searchField)) {
			this.searchField = searchField ;
		}
		if(searchWord != null && !"".equals(searchWord)) {
			this.searchWord = searchWord ;
		}
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

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	@Override
	public String toString() {
		// 재정의하지 않으면 객체의 메모리주소값 출력
		// toString메서드를 재정의하여 객체가 가진 필드값을 출력
		return "[searchWord] : " + searchWord
				 + "\n[searchField] : " + searchField 
				 + "\n[pageNo] : " + pageNo 
				 + "\n[amount] : " + amount;
	}

}
