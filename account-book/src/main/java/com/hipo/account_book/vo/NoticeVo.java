package com.hipo.account_book.vo;

public class NoticeVo {
	int noticeId;
	int qnaId;
	String noticeContent;
	String qnaContent;
	String noticeTitle;
	String qnaTitle;
	String noticeDay;
	String qnaDay;
	int noticeHit;
	int qnaHit;
	
	@Override
	public String toString() {
		return "NpticeVo [noticeContent=" + noticeContent + ", qnaContent=" + qnaContent + ", noticeTitle=" + noticeTitle + ", qnaTitle=" + qnaTitle + ", noticeDay=" + noticeDay + ", qnaDay=" + qnaDay +", noticeHit=" + noticeHit +", qnaHit=" + qnaHit +"]";
	}
	
	
	
	public int getNoticeId() {
		return noticeId;
	}



	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}



	public int getQnaId() {
		return qnaId;
	}



	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}



	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getNoticeDay() {
		return noticeDay;
	}

	public void setNoticeDay(String noticeDay) {
		this.noticeDay = noticeDay;
	}

	public String getQnaDay() {
		return qnaDay;
	}

	public void setQnaDay(String qnaDay) {
		this.qnaDay = qnaDay;
	}

	public int getNoticeHit() {
		return noticeHit;
	}

	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}

	public int getQnaHit() {
		return qnaHit;
	}

	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}
	
	
}
