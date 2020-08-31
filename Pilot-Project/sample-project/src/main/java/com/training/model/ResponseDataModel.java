package com.training.model;

public class ResponseDataModel {
	
	//trả về mã lỗi
	private int responseCode;
	//trả về tin nhắn lỗi
	private String responseMsg;
	//trả về đối tượng - vì k biết kiểu dữ liệu nên khai báo là kiểu object
	private Object data;

	public ResponseDataModel() {
	}

	public ResponseDataModel(int responseCode, String responseMsg) {
		this.responseCode = responseCode;
		this.responseMsg = responseMsg;
	}

	public ResponseDataModel(int responseCode, String responseMsg, Object data) {
		this.responseCode = responseCode;
		this.responseMsg = responseMsg;
		this.data = data;
	}
	public int getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}

	public String getResponseMsg() {
		return responseMsg;
	}

	public void setResponseMsg(String responseMsg) {
		this.responseMsg = responseMsg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
}