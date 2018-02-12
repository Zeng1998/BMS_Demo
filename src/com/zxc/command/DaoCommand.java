package com.zxc.command;

import com.zxc.Bean.BookBean;

import java.util.List;

public interface DaoCommand<T> {
    //查询所有数据
    public abstract List<T> queryAllData();
    //新增数据
    public abstract int insertData(T t);
    //修改数据
    public abstract int update(T t);
    //删除
    public abstract int delete(String id);
    //通过id查询数据
    public abstract T queryDataById(String id);
    //通过页数查询数据
    public abstract List<BookBean> queryByPage(int p);
    //查询总数据数
    public abstract int getPageCount();
    //通过关键字查询
    public abstract List<BookBean> queryByName(String name);
}
