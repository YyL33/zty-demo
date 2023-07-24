package com.demo.ztydemo.dao.entity;

import java.util.List;

public class PageInfo {
    int currentPage;//当前页
    int pageSize;//页行数

    int sumCounts;//总条数

    int sumPage;//总页数

    private List<User> dataList;

    public List<User> getDataList() {
        return dataList;
    }

    public void setDataList(List<User> dataList) {
        this.dataList = dataList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSumCounts() {
        return sumCounts;
    }

    public void setSumCounts(int sumCounts) {
        this.sumCounts = sumCounts;
    }

    public int getSumPage() {
        return sumPage;
    }

    public void setSumPage(int sumPage) {
        this.sumPage = sumPage;
    }
}
