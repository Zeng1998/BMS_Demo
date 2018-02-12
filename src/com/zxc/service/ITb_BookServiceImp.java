package com.zxc.service;

import com.zxc.Bean.BookBean;
import com.zxc.dao.Tb_Book;
import com.zxc.dao.Tb_BookImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

//与dao层建立链接，必须创建dao层对象
public class ITb_BookServiceImp implements Tb_BookService {
    public Connection conn1 = null;
    public ResultSet rs = null;
    public PreparedStatement ps = null;
    boolean b = false;

    Tb_Book myiTb_Book = new Tb_BookImpl();

    @Override
    public List<BookBean> queryByName(String name) {
        return myiTb_Book.queryByName(name);
    }

    @Override
    public List<BookBean> queryAllData() {
        return myiTb_Book.queryAllData();
    }

    @Override
    public List<BookBean> queryByPage(int p) {
        return myiTb_Book.queryByPage(p);
    }

    @Override
    public boolean insertData(BookBean t) {
        if (t != null) {
            myiTb_Book.insertData(t);
            b = true;
        }
        return b;
    }

    @Override
    public boolean update(BookBean t) {
        if (t != null) {
            myiTb_Book.update(t);
            b = true;
        }
        return b;
    }

    @Override
    public boolean delete(String id) {
        if (id != null) {
            myiTb_Book.delete(id);
            b = true;
        }
        return b;
    }

    @Override
    public BookBean queryDataById(String id) {
        if (id != null) {
            return myiTb_Book.queryDataById(id);
        } else {
            return null;
        }
    }
}
