package com.hipo.account_book.dto;

public class JSONResult {
	private String result; //success -> 통신 성공, fail -> 통신 실패
	private String message;
	private Object data;
	private JSONResult(){
		
	}
	private JSONResult(String result, String message, Object data){// 두번째 데이터 받는곳 
		this.result = result;
		this.message = message;
		this.data = data;
	}
	public static JSONResult success(Object data){//처음 데이터 받는곳
		return new JSONResult("success", null, data);
	}
	public static JSONResult fail(String message){
		return new JSONResult("fail", message, null);
	}
	public String getResult() {
		return result;
	}
	public String getMessage() {
		return message;
	}
	public Object getData() {
		return data;
	}
}
