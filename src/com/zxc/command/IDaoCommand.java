package com.zxc.command;

import com.zxc.domain.Tb_Book;

import java.util.List;

//接口
public interface IDaoCommand<T> {
    //查询所有数据
    public List<T> queryAllData();
    //新增数据
    public int insertData(T t);
    //修改数据
    public int update(T t);
    //删除
    public int delete(String id);
    //通过id查询数据
    public T queryDataById(String id);
    //通过页数查询数据
    public List<Tb_Book> queryByPage(int p);
}
