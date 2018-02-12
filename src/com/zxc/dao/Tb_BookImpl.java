package com.zxc.dao;

import com.zxc.Bean.BookBean;
import com.zxc.util.UnitMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//实现类
//数据访问层
public class Tb_BookImpl implements Tb_Book {
    public Connection conn1=null;
    public ResultSet rs=null;
    public PreparedStatement ps=null;

    @Override
    public List<BookBean> queryByName(String name) {
        conn1=UnitMysql.getConnection();
        List<BookBean> list=new ArrayList<>();
        try{
            String sqlSelect="select * from Book where name like '%"+name+"%'";
            ps=conn1.prepareStatement(sqlSelect);
            rs=ps.executeQuery();
            BookBean user=null;
            while(rs.next()){
                user=new BookBean();
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setAuthor(rs.getString("author"));
                user.setPub_time(rs.getString("pub_time"));
                user.setType(rs.getString("type"));
                list.add(user);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            UnitMysql.Close(rs,ps,conn1);
        }
        return list;
    }

    @Override
    public int getPageCount() {
        conn1=UnitMysql.getConnection();
        int c=0;
        try{
            String sqlSelect="select count(*) from Book";
            ps=conn1.prepareStatement(sqlSelect);
            rs=ps.executeQuery();
            while(rs.next()){         //就算一行数据也要加这个判断
                c=rs.getInt(1);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            System.out.println(c);
            UnitMysql.Close(rs,ps,conn1);
        }
        if(c%20==0){
            return (c/20);
        }
        else{
            return (c/20)+1;
        }
    }

    @Override
    public List<BookBean> queryAllData() {
        conn1 = UnitMysql.getConnection();//链接数据库
        List<BookBean> list=new ArrayList<>();
        try{
            String sqlSelect="select * from Book";
            ps=conn1.prepareStatement(sqlSelect);   //执行sql语句
            rs=ps.executeQuery();
            BookBean user=null;
            while(rs.next()){
                user=new BookBean();  //创建一个对象,并添加数据
                user.setId(rs.getString("id"));
                user.setName(rs.getString("name"));
                user.setAuthor(rs.getString("author"));
                user.setPub_time(rs.getString("pub_time"));
                user.setType(rs.getString("type"));
                list.add(user);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            UnitMysql.Close(rs,ps,conn1);
        }
        return list;
    }

    @Override
    public List<BookBean> queryByPage(int p){
        conn1 = UnitMysql.getConnection();
        List<BookBean> list=new ArrayList<>();
        try{
            String sqlSelect="select * from Book limit "+ Integer.toString(20*(p-1))+","+Integer.toString(20);
            ps=conn1.prepareStatement(sqlSelect);
            rs=ps.executeQuery();
            BookBean bookBean =null;
            while(rs.next()) {
                bookBean = new BookBean();
                bookBean.setId(rs.getString("id"));
                bookBean.setName(rs.getString("name"));
                bookBean.setAuthor(rs.getString("author"));
                bookBean.setPub_time(rs.getString("pub_time"));
                bookBean.setType(rs.getString("type"));
                list.add(bookBean);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            UnitMysql.Close(rs,ps,conn1);
        }
        return list;
    }


    @Override
    public int insertData(BookBean t) {
        conn1 = UnitMysql.getConnection();
        int i=0;
        try{
            String sqlInsert="insert into Book(name,author,pub_time,type,id) values(?,?,?,?,?)";
            ps=conn1.prepareStatement(sqlInsert,
                    PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1,t.getName());
            ps.setString(2,t.getAuthor());
            ps.setString(3,t.getPub_time());
            ps.setString(4,t.getType());
            ps.setString(5,t.getId());
            ps.executeUpdate();
            rs=ps.getGeneratedKeys();
            if(rs.next()){
                i=rs.getInt(1);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            UnitMysql.Close(rs,ps,conn1);
        }
        return i;
    }

    @Override
    public int update(BookBean t) {
        conn1 = UnitMysql.getConnection();
        int i = 0;
        try {
            String sqlUpdate = "update Book set name=?, author=? ,pub_time=? ,type=? where id=?";
            ps = conn1.prepareStatement(sqlUpdate);
            ps.setString(1, t.getName());
            ps.setString(2, t.getAuthor());
            ps.setString(3, t.getPub_time());
            ps.setString(4, t.getType());
            ps.setString(5, t.getId());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            UnitMysql.Close(null, ps, conn1);
        }
        return i;
    }

    @Override
    public int delete(String id) {
        conn1 = UnitMysql.getConnection();
        int i = 0;
        try {
            String sqlDelete = "delete from Book where id=?";
            ps = conn1.prepareStatement(sqlDelete);
            ps.setString(1, id);
            i = ps.executeUpdate();
            if (i == 1) {
                return i;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            UnitMysql.Close(null, ps, conn1);
        }
        return i;
    }

    @Override
    public BookBean queryDataById(String id) {
        conn1 = UnitMysql.getConnection();
        String sql = "select * from Book where id=?";
        BookBean bookBean = null;
        try {
                ps = conn1.prepareStatement(sql);
                ps.setString(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    //System.out.println(rs.getString("name"));
                    bookBean = new BookBean();
                    bookBean.setId(rs.getString("id"));
                    bookBean.setName(rs.getString("name"));
                    bookBean.setAuthor(rs.getString("author"));
                    bookBean.setPub_time(rs.getString("pub_time"));
                    bookBean.setType(rs.getString("type"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
            UnitMysql.Close(null, ps, conn1);
        }
        return bookBean;
    }
}
