package com.zxc.command;

import java.util.List;

public interface ServiceCommand<T> {
    //查询所有的数据
    public abstract List<T> queryAllData();
    //新增数据
    public abstract boolean insertData(T t);
    //修改数据
    public abstract boolean update(T t);
    //删除数据
    public abstract boolean delete(String id);
    //查询一条数据通过ID
    public abstract T queryDataById(String id);
    //查询该页数据
    public abstract List<T> queryByPage(int p);
    //通过关键字查询数据
    public abstract List<T> queryByName(String name);
}
