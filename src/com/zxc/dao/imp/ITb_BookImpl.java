package com.zxc.dao.imp;

import com.zxc.dao.ITb_Book;
import com.zxc.domain.Tb_Book;
import com.zxc.unit.UnitMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//实现类
//数据访问层
public class ITb_BookImpl implements ITb_Book{
    public Connection conn1=null;
    public ResultSet rs=null;
    public PreparedStatement ps=null;

    //查询所有数据 重写实现接口方法

    @Override
    public List<Tb_Book> queryAllData() {
        conn1 = UnitMysql.getConnection();//链接数据库
        List<Tb_Book> list=new ArrayList<>();
        try{
            String sqlSelect="select * from Book";
            ps=conn1.prepareStatement(sqlSelect);   //执行sql语句
            rs=ps.executeQuery();
            Tb_Book user=null;
            while(rs.next()){
                user=new Tb_Book();  //创建一个对象,并添加数据
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
    public List<Tb_Book> queryByPage(int p){
        conn1 = UnitMysql.getConnection();//链接数据库
        List<Tb_Book> list=new ArrayList<>();
        try{
            String sqlSelect="select * from Book limit "+ Integer.toString(10*(p-1))+","+Integer.toString(10);
            //System.out.println(sqlSelect);
            ps=conn1.prepareStatement(sqlSelect);   //执行sql语句
            rs=ps.executeQuery();
            Tb_Book user=null;
            while(rs.next()){
                user=new Tb_Book();  //创建一个对象,并添加数据
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
    public int insertData(Tb_Book t) {
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
    public int update(Tb_Book t) {
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
            System.out.println("最底层改："+t.getType());
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
    public Tb_Book queryDataById(String id) {
        conn1 = UnitMysql.getConnection();
        String sql = "select * from Book where id=?";
        Tb_Book book = null;
        try {
                ps = conn1.prepareStatement(sql);
                ps.setString(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    //System.out.println(rs.getString("name"));
                    book = new Tb_Book();
                    book.setId(rs.getString("id"));
                    book.setName(rs.getString("name"));
                    book.setAuthor(rs.getString("author"));
                    book.setPub_time(rs.getString("pub_time"));
                    book.setType(rs.getString("type"));
                    System.out.println(book.getName()+"pk");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
            UnitMysql.Close(null, ps, conn1);
        }
        return book;
    }
}
