package com.zxc.servlet;

import com.zxc.Bean.AccountBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CheckAccount extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        AccountBean account =new AccountBean();
        resp.setContentType("text/html;charset=utf-8");
        String username=req.getParameter("username");
        String psw=req.getParameter("password");
        account.setPassword(psw);
        account.setUsername(username);
        if((username!=null) && (username.equals("admin")) && (psw!=null) && (psw.equals("zxc12345"))){
            System.out.println("登陆成功");
            session.setAttribute("account",account);
            resp.sendRedirect("/Servlet_TbBook?what=queryByPage&page=1");
            return;
        }
        else{
            System.out.println("登录失败");
            resp.sendRedirect("/index.jsp");
            return;
        }
    }
}
