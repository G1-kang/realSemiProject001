package com.between.dto;

public class Criteria {
    
    private int page; // 현재 페이지 번호
    private int pageCount; // 페이지 당 보여줄 게시글 갯수
    private int boardNum;  // 댓글게시판에서 쓰일 변수..
    
    public int getPageStart() {// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
        return (this.page-1)*pageCount;
    }
    
    public Criteria() {
    }
    
    public int getPage() {
        return page;
    }
    //지금 보는 페이지가 뭔지 알려주는놈
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    //확장성을 고려해서 10개 넣어준놈
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
    
}


