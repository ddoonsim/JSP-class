package com.momo.dto;

public class PageDto {
	
	// 페이지네이션을 그리기 위해 필요한 정보
	int startNo ;            // 페이지 블럭의 시작번호
	int endNo ;              // 페이지 블럭의 끝 번호
	int realEndNo ;          // 게시물의 끝 페이지 번호 = 올림(게시물의 개수 / 페이지 당 게시물 개수)
	boolean prev, next ;     // 이전, 다음 페이지 이동 버튼(true : 보여주기)
	
	// 위의 정보들을 세팅하기 위해 필요한 데이터
	int totalCnt ;           // 총 게시물 개수
	Criteria cri ;           // 요청 페이지번호, 페이지 당 게시물 개수
	int blockAmount = 10 ;   // 페이지 블럭에 보여줄 페이지의 개수
	
	
	/**
	 * 생성자(오버로딩)를 통해 페이지블럭을 그리기 위한 정보를 세팅
	 * @param totalCnt : 총 게시물 개수
	 * @param cri : 요청 페이지번호, 페이지 당 게시물 개수
	 * @param blockAmount : 페이지 블럭에 보여줄 페이지의 개수
	 */
	public PageDto(int totalCnt, Criteria cri, String blockAmount) {
		// 생성자 호출
		this(totalCnt, cri) ;
		
		if(blockAmount != null && 
				!"".equals(blockAmount)) {
			this.blockAmount = Integer.parseInt(blockAmount);
		}
	}
	
	public PageDto(int totalCnt, Criteria cri) {
		this.totalCnt = totalCnt;
		this.cri = cri;
		
		// 요청 페이지, 블럭 당 페이지 개수에 따라서 블럭의 범위가 정해짐
		// 페이지 블럭의 시작번호 & 끝번호 구하기
		endNo = (int)Math.ceil(cri.getPageNo()/(blockAmount*1.0)) * blockAmount ;
		startNo = endNo - (blockAmount - 1) ;
		
		// 페이지 끝 번호
		realEndNo = (int)Math.ceil((totalCnt*1.0)/cri.getAmount()) ;
		
		// 게시물이 67건인 경우
		// 페이지 진짜 끝번호는 7인데 블럭의 끝번호가 10일 수 없기 때문에
		// 게시물의 진짜 끝번호보다 페이지블럭의 끝번호가 큰 경우 페이지블럭의 끝 번호는 페이지 끝 번호(realEndNo)가 되어야함
		endNo = (endNo > realEndNo) ? realEndNo : endNo ;
		
		prev = (startNo == 1) ? false : true ;
		next = (endNo == realEndNo) ? false : true ;
	}

	
	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getRealEndNo() {
		return realEndNo;
	}

	public void setRealEndNo(int realEndNo) {
		this.realEndNo = realEndNo;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	

}
