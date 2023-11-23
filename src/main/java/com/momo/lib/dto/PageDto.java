package com.momo.lib.dto;

public class PageDto {
	
	// 페이지네이션을 그리기 위해 필요한 정보
	// 페이지 블럭의 시작번호, 페이지 블럭의 끝 번호, 게시물의 끝 페이지 번호, 
	// 이전, 다음 페이지 이동 버튼
	int startNo ;
	int endNo ;
	int realEndNo ;
	boolean prev, next ;
	
	// 위의 정보들을 세팅하기 위해 필요한 데이터
	// 총 게시물 개수
	// 요청 페이지번호, 페이지 당 게시물 개수
	// 페이지 블럭에 보여줄 페이지의 개수
	int totalCnt ;
	Criteria cri ;
	int blockAmount = 10 ;
	
	public PageDto(int totalCnt, Criteria cri, String blockAmount) {
		this(totalCnt, cri) ;
		this.blockAmount = Integer.parseInt(blockAmount);
	}

	public PageDto(int totalCnt, Criteria cri) {
		this.totalCnt = totalCnt ;
		this.cri = cri ;
		
		// 페이지 블럭의 시작번호 & 끝번호 구하기
		endNo = (int)(Math.ceil(cri.getPageNo()/(double)blockAmount) * blockAmount) ;
		startNo = endNo - (blockAmount - 1) ;
		
		// 진짜 페이지 끝 번호
		realEndNo = (int)Math.ceil((double)totalCnt/cri.getAmount()) ;
		
		endNo = (endNo > realEndNo) ? realEndNo : endNo ;
		
		prev = (startNo == 1) ? false : true ;
		next = (endNo == realEndNo) ? false : true ;
		
		//System.out.println("startNo : " + startNo);
		//System.out.println("endNo : " + endNo);
		//System.out.println("realEndNo : " + realEndNo);
		//System.out.println("prev : " + prev);
		//System.out.println("next : " + next);
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
