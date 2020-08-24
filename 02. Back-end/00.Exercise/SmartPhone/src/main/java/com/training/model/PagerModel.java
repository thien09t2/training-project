package com.training.model;

import java.util.ArrayList;
import java.util.List;

//tran nay dung de hien thi ra list phan trang

public class PagerModel {
	// vo hieu hoa phan trang
	public static final int DISABLE_PAGING_FLAG = 0;
	public static final int NUM_OF_MAX_DISPLAY_PAGE = 5;
	// trang hien tai
	private int currentPage;
	// tong so trang
	private int totalPage;
	// trang tiep theo
	private int nextPage;
	// trang truoc
	private int previousPage;
	// trang dau tien
	private int firstPage = 1;
	// trang cuoi
	private int lastPage;
	// danh sach so trang
	private List<Integer> pageNumberList;
	// tu 2 tham so dau vao lay duoc cac bien o ben tren
	public PagerModel(int currentPage, int totalPage) {

		this.currentPage = currentPage;
		this.totalPage = totalPage;

		if (currentPage == this.firstPage) {
			this.previousPage = DISABLE_PAGING_FLAG;
			this.firstPage = DISABLE_PAGING_FLAG;
		} else {
			this.previousPage = currentPage - 1;
		}

		if (currentPage == totalPage) {
			this.lastPage = DISABLE_PAGING_FLAG;
			this.nextPage = DISABLE_PAGING_FLAG;
		} else if (totalPage > 0) {
			this.lastPage = totalPage;
			this.nextPage = currentPage + 1;
		}

		this.pageNumberList = getPageNumberList(currentPage, totalPage, NUM_OF_MAX_DISPLAY_PAGE);
	}

	/**
	 * Get List Page Number
	 * 
	 * @param currentPage
	 * @param totalPage
	 * @param maxPageDisplay
	 * @return List Page Number
	 */
	private static List<Integer> getPageNumberList(int currentPage, int totalPage, int maxPageDisplay) {

		List<Integer> pageNumberList = new ArrayList<Integer>();

		int pageMin, pageMax;
		pageMin = currentPage - (maxPageDisplay - 1) / 2;
		pageMax = currentPage + (maxPageDisplay - 1) / 2;

		if (pageMin <= 0) {
			pageMin = 1;
			pageMax = maxPageDisplay;
		}

		if (pageMax > totalPage) {
			pageMax = totalPage;
			pageMin = totalPage - maxPageDisplay + 1;
		}

		for (int i = pageMin; i <= pageMax; i++) {
			if (i > 0) {
				pageNumberList.add(i);
			}
		}

		return pageNumberList;
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the nextPage
	 */
	public int getNextPage() {
		return nextPage;
	}

	/**
	 * @param nextPage the nextPage to set
	 */
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	/**
	 * @return the previousPage
	 */
	public int getPreviousPage() {
		return previousPage;
	}

	/**
	 * @param previousPage the previousPage to set
	 */
	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	/**
	 * @return the firstPage
	 */
	public int getFirstPage() {
		return firstPage;
	}

	/**
	 * @param firstPage the firstPage to set
	 */
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	/**
	 * @return the lastPage
	 */
	public int getLastPage() {
		return lastPage;
	}

	/**
	 * @param lastPage the lastPage to set
	 */
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	/**
	 * @return the pageNumberList
	 */
	public List<Integer> getPageNumberList() {
		return pageNumberList;
	}

	/**
	 * @param pageNumberList the pageNumberList to set
	 */
	public void setPageNumberList(List<Integer> pageNumberList) {
		this.pageNumberList = pageNumberList;
	}
}