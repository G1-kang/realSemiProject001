package com.between.dto;

public class PageMaker {
    
    private Criteria cri;
    private int totalCount;
    private int startPage;
    private int endPage;	//보여지는 페이징의 마지막 번호
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5; //하단에 보여줄 페이징 갯수 < 1 2 3 4 >  <1 2 >
    
    private int tempEndPage;//마지막으로  가는 버튼을 만들기 위한 것, 
    
    public Criteria getCri() {
        return cri;
    }
    public void setCri(Criteria cri) {
        this.cri = cri;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }
    //위에서 보여준 모든 변수들을 계산해주는것.
    private void calcData() {
        
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        // endPage(보여질 페이지에서의 페이징끝번호 
        // = 버림(보고자 하는 페이지 번호 / 보여질 페이징번호 갯수 * 보여질페이징번호 갯수) 
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPageCount()));
        
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        prev = startPage == 1 ? false : true; // 첫 페이지일 경우 이전페이지로 가는 버튼 사리짐
        next = endPage * cri.getPageCount() < totalCount ? true : false; //tempendpage와 동일한 번호를 계산해서... 
        
        
//        System.out.println("startPage : "+startPage);
//        System.out.println("endPage : "+endPage);
//        System.out.println("totalCount : "+totalCount);
//        System.out.println("cri.getPageCount : "+cri.getPageCount());
//        System.out.println("tempEndPage : "+tempEndPage);
//        System.out.println(prev);
//        System.out.println(next);
        
    }
    
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
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
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }
	public int getTempEndPage() {
		return tempEndPage;
	}
	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}
 
}


