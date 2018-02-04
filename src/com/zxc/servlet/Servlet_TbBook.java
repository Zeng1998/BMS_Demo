package com.zxc.servlet;

import com.zxc.service.ITb_BookService;
import com.zxc.service.imp.ITb_BookServiceImpI;
import com.zxc.domain.Tb_Book;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class Servlet_TbBook extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ITb_BookService myITb_BookService = new ITb_BookServiceImpI();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String type = req.getParameter("what");
        if ("Insert".equals(type)) {
            Insert(req, resp);
        } else if ("update".equals(type)) {
            update(req, resp);
        } else if ("queryById".equals(type)) {
            queryById(req, resp);
        } else if ("delete".equals(type)) {
            delete(req, resp);
        } else if ("queryAll".equals(type)) {
            queryAll(req, resp);
        } else if("queryByPage".equals(type)){
            queryByPage(req,resp);
        }
    }

    public void Insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //jsp中传递过来的参数

        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String pub_time = req.getParameter("pub_time");
        String type = req.getParameter("type");
        String id = req.getParameter("id");

        Tb_Book user = new Tb_Book();
        user.setName(name);
        user.setAuthor(author);
        user.setPub_time(pub_time);
        user.setType(type);
        user.setId(id);

        String message = null;
        //调用服务来添加
        if (myITb_BookService.insertData(user)) {
            queryAll(req, resp);
        } else {
            message = "新增失败";
            req.setAttribute("msg", message);
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String pub_time = req.getParameter("pub_time");
        String type = req.getParameter("type");
        String id = req.getParameter("id");
        //System.out.println("修改："+type);
        Tb_Book user = new Tb_Book();
        user.setName(name);
        user.setAuthor(author);
        user.setPub_time(pub_time);
        user.setType(type);
        user.setId(id);
        //  问题在这里
        boolean b = myITb_BookService.update(user);
        if (b) {
            queryAll(req, resp);
        } else {
            req.setAttribute("msg", "修改失败");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    public void queryById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Tb_Book book=null;
        String id=req.getParameter("id");
        book=myITb_BookService.queryDataById(id);
        System.out.println("查询成功");
        req.setAttribute("book",book);
        req.getRequestDispatcher("/jsp/update.jsp").forward(req,resp);
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id= req.getParameter("id");
        System.out.println(id);
        boolean  message=myITb_BookService.delete(id);
        if (message) {
            queryAll(req, resp);
        }
        else {

            req.setAttribute("msg", "删除失败!!");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    public void queryAll(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        List<Tb_Book> list=myITb_BookService.queryAllData();
        req.setAttribute("booklist",list);
        req.getRequestDispatcher("/jsp/indexList.jsp").forward(req, resp);
    }
    public void queryByPage(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        System.out.println("调用这个方法了");
        List<Tb_Book> list=myITb_BookService.queryByPage(Integer.parseInt(req.getParameter("page")));
        req.setAttribute("booklist",list);
        req.getRequestDispatcher("/jsp/indexList.jsp").forward(req,resp);
    }
}