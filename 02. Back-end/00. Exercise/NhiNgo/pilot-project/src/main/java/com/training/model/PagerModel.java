package com.training.model;

import java.util.ArrayList;
import java.util.List;

/**
 * @author DELL
 *
 */
public class PagerModel {

    public static final int DISABLE_PAGING_FLAG = 0;
    public static final int NUM_OF_MAX_DISPLAY_PAGES = 3;

    private int totalPages;
    private int currtPage;
    private int nextPage;
    private int prvsPage;
    private int firstPage = 1;
    private int lastPage;
    private List<Integer> pgNumList;

    /**
     * @param totalPages
     * @param currtPage
     */
    public PagerModel(int currtPage, int totalPages) {

        this.totalPages = totalPages;
        this.currtPage = currtPage;

        if (currtPage == this.firstPage) {

            this.prvsPage = DISABLE_PAGING_FLAG;
            this.firstPage = DISABLE_PAGING_FLAG;
        } else {
            this.prvsPage = currtPage - 1;
        }

        if (currtPage == totalPages) {
            this.lastPage = DISABLE_PAGING_FLAG;
            this.nextPage = DISABLE_PAGING_FLAG;
        } else if (totalPages > 0) {
            this.lastPage = totalPages;
            this.nextPage = currtPage + 1;
        }

        this.pgNumList = getPgNumList(currtPage, totalPages, NUM_OF_MAX_DISPLAY_PAGES);
    }

    /**
     * Get List Page Number
     *
     * @param currtPage
     * @param totalPages
     * @param maxDispPageNum
     * @return List of Page Number
     */
    private static List<Integer> getPgNumList(int currtPage, int totalPages, int maxDispPageNum) {

        List<Integer> pgNumList = new ArrayList<Integer>();

        int pgMin, pgMax;
        pgMin = currtPage - (maxDispPageNum - 1) / 2;
        pgMax = currtPage + (maxDispPageNum - 1) / 2;

        if (pgMin <= 0) {
            pgMin = 1;
            pgMax = maxDispPageNum;
        }

        if (pgMax > totalPages) {
            pgMax = totalPages;
            pgMin = totalPages - maxDispPageNum + 1;
        }

        for (int i = pgMin; i <= pgMax; i ++) {
            if (i > 0) {
                pgNumList.add(i);
            }
        }

        return pgNumList;
    }

    /**
     * @return the totalPages
     */
    public int getTotalPages() {
        return totalPages;
    }

    /**
     * @param totalPages the totalPages to set
     */
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    /**
     * @return the currtPage
     */
    public int getCurrtPage() {
        return currtPage;
    }

    /**
     * @param currtPage the currtPage to set
     */
    public void setCurrtPage(int currtPage) {
        this.currtPage = currtPage;
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
     * @return the prvsPage
     */
    public int getPrvsPage() {
        return prvsPage;
    }

    /**
     * @param prvsPage the prvsPage to set
     */
    public void setPrvsPage(int prvsPage) {
        this.prvsPage = prvsPage;
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
     * @return the pgNumList
     */
    public List<Integer> getPgNumList() {
        return pgNumList;
    }

    /**
     * @param pgNumList the pgNumList to set
     */
    public void setPgNumList(List<Integer> pgNumList) {
        this.pgNumList = pgNumList;
    }

}
