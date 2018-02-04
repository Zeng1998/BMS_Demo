package com.zxc.service.imp;

import com.zxc.dao.ITb_Book;
import com.zxc.dao.imp.ITb_BookImpl;
import com.zxc.domain.Tb_Book;
import com.zxc.service.ITb_BookService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

//与dao层建立链接，必须创建dao层对象
public class ITb_BookServiceImpI implements ITb_BookService {
    public Connection conn1=null;
    public ResultSet rs=null;
    public PreparedStatement ps=null;
    boolean b=false;

    ITb_Book myiTb_Book =new ITb_BookImpl();

    @Override
    public List<Tb_Book> queryAllData() {
        return myiTb_Book.queryAllData();
    }

    @Override
    public List<Tb_Book> queryByPage(int p){
        return myiTb_Book.queryByPage(p);
    }

    @Override
    public boolean insertData(Tb_Book t) {
        if(t!=null){
            myiTb_Book.insertData(t);
            b=true;
        }
        return b;
    }

    @Override
    public boolean update(Tb_Book t) {
        if(t!=null){
            myiTb_Book.update(t);
            b=true;
        }
        return b;
    }

    @Override
    public boolean delete(String id) {
        if(id!=null){
            myiTb_Book.delete(id);
            b=true;
        }
        return b;
    }

    @Override
    public Tb_Book queryDataById(String id) {
        if(id!=null){
            return myiTb_Book.queryDataById(id);
        }
        else{
            return null;
        }
    }
}
