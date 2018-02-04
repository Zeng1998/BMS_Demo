package com.zxc.domain;

import java.util.List;

public class Page {
    private int page;
    private int pagesize;
    private int indexpage=1;
    private int endpage;
    private int count;
    private int pagenumber;
    private List<Object> list;

    public void setPage(int page) {
        this.page = page;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public void setIndexpage(int indexpage) {
        this.indexpage = indexpage;
    }

    public void setEndpage(int endpage) {
        this.endpage = endpage;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setPagenumber(int pagenumber) {
        this.pagenumber = pagenumber;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public int getPage() {
        return page;
    }

    public int getPagesize() {
        return pagesize;
    }

    public int getIndexpage() {
        return indexpage;
    }

    public int getEndpage() {
        return endpage;
    }

    public int getCount() {
        return count;
    }

    public int getPagenumber() {
        return pagenumber;
    }

    public List<Object> getList() {
        return list;
    }
}
