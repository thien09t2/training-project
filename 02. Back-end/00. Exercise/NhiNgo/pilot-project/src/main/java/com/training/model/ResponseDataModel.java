package com.training.model;

public class ResponseDataModel {
	
	private int responseCode;
	private String responseMessg;
	private Object data;
	/**
	 * 
	 */
	public ResponseDataModel() {
		super();
	}
	/**
	 * @param responseCode
	 * @param responseMessg
	 */
	public ResponseDataModel(int responseCode, String responseMessg) {
		super();
		this.responseCode = responseCode;
		this.responseMessg = responseMessg;
	}
	/**
	 * @param responseCode
	 * @param responseMessg
	 * @param data
	 */
	public ResponseDataModel(int responseCode, String responseMessg, Object data) {
		super();
		this.responseCode = responseCode;
		this.responseMessg = responseMessg;
		this.data = data;
	}
	/**
	 * @return the responseCode
	 */
	public int getResponseCode() {
		return responseCode;
	}
	/**
	 * @param responseCode the responseCode to set
	 */
	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}
	/**
	 * @return the responseMessg
	 */
	public String getResponseMessg() {
		return responseMessg;
	}
	/**
	 * @param responseMessg the responseMessg to set
	 */
	public void setResponseMessg(String responseMessg) {
		this.responseMessg = responseMessg;
	}
	/**
	 * @return the data
	 */
	public Object getData() {
		return data;
	}
	/**
	 * @param data the data to set
	 */
	public void setData(Object data) {
		this.data = data;
	}
	
}
