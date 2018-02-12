package com.zxc.util;

import java.sql.*;


//建立与mysql的连接
//数据层
public class UnitMysql {
    public static final String URL="jdbc:mysql://localhost:3306/BMS_demo?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    public static final String NAME="root";
    public static final String PASSWORD="zxc12345";
    public static final String DRIVER="com.mysql.jdbc.Driver";

    static{
        try{
            Class.forName(DRIVER);
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        try{
            System.out.println("连接成功");
            return DriverManager.getConnection(URL,NAME,PASSWORD);
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    public static void Close(ResultSet rs, PreparedStatement ps, Connection conn){
        if(rs!=null){
            try{
                rs.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try{
                ps.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try{
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}
