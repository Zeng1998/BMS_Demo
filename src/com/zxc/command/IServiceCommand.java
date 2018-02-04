package com.zxc.command;

import java.util.List;

public interface IServiceCommand<T> {
    //查询所有的数据
    public List<T> queryAllData();
    //新增数据
    public boolean insertData(T t);
    //修改数据
    public boolean update(T t);
    //删除数据
    public boolean delete(String id);
    //查询一条数据通过ID
    public T queryDataById(String id);
    //查询该页数据
    public List<T> queryByPage(int p);
}
