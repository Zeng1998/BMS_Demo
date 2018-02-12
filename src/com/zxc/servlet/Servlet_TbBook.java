package com.zxc.servlet;

import com.zxc.Bean.BookBean;
import com.zxc.service.Tb_BookService;
import com.zxc.service.ITb_BookServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import static java.net.URLDecoder.decode;

public class Servlet_TbBook extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Tb_BookService myITb_BookService = new ITb_BookServiceImp();

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
        } else if("showUpdateDetail".equals(type)){
            showUpdateDetail(req,resp);
        } else if("showDeleteDetail".equals(type)){
            showDeleteDetail(req,resp);
        } else if("queryByName".equals(type)){
            queryByName(req,resp);
        }
    }

    public void Insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String pub_time = req.getParameter("pub_time");
        String type = req.getParameter("type");
        String id = req.getParameter("id");

        BookBean user = new BookBean();
        user.setName(name);
        user.setAuthor(author);
        user.setPub_time(pub_time);
        user.setType(type);
        user.setId(id);

        String message = null;
        if (myITb_BookService.insertData(user)) {
            queryAll(req, resp);
        } else {
            message = "新增失败";
            req.setAttribute("msg", message);
            req.getRequestDispatcher("/indexList.jsp").forward(req, resp);
        }
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String pub_time = req.getParameter("pub_time");
        String type = req.getParameter("type");
        String id = req.getParameter("id");
        BookBean user = new BookBean();
        user.setName(name);
        user.setAuthor(author);
        user.setPub_time(pub_time);
        user.setType(type);
        user.setId(id);
        int page=Integer.parseInt(req.getParameter("p"));
        boolean b = myITb_BookService.update(user);
        if (b) {
            req.setAttribute("page",page);
            req.getRequestDispatcher("/Servlet_TbBook?what=queryByPage&page="+page).forward(req, resp);
        } else {
            req.setAttribute("msg", "修改失败");
            req.getRequestDispatcher("/indexList.jsp").forward(req, resp);
        }
    }

    public void queryById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BookBean bookBean =null;
        String id=req.getParameter("id");
        bookBean =myITb_BookService.queryDataById(id);
        System.out.println("查询成功");
        req.setAttribute("bookBean", bookBean);
        req.getRequestDispatcher("/jsp/update.jsp").forward(req,resp);
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id= req.getParameter("id");
        int page=Integer.parseInt(req.getParameter("p"));
        boolean  message=myITb_BookService.delete(id);
        if (message) {
            req.setAttribute("page",page);
            req.getRequestDispatcher("/Servlet_TbBook?what=queryByPage&page="+page).forward(req, resp);
        }
        else {
            req.setAttribute("msg", "删除失败!!");
            req.getRequestDispatcher("/indexList.jsp").forward(req, resp);
        }
    }

    public void showUpdateDetail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        BookBean bookBean =null;
        String id=req.getParameter("id");
        bookBean =myITb_BookService.queryDataById(id);
        req.setAttribute("bookBean", bookBean);
        req.getRequestDispatcher("/jsp/update.jsp").forward(req,resp);
    }

    public void showDeleteDetail(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{
        BookBean bookBean =null;
        String id=req.getParameter("id");
        bookBean =myITb_BookService.queryDataById(id);
        req.setAttribute("bookBean", bookBean);
        req.getRequestDispatcher("/jsp/delete.jsp").forward(req,resp);
    }

    public void queryAll(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        List<BookBean> list=myITb_BookService.queryAllData();
        req.setAttribute("booklist",list);
        req.getRequestDispatcher("/jsp/indexList.jsp").forward(req, resp);
    }
    public void queryByPage(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        List<BookBean> list=myITb_BookService.queryByPage(Integer.parseInt(req.getParameter("page")));
        req.setAttribute("booklist",list);
        req.getRequestDispatcher("/jsp/indexList.jsp").forward(req,resp);
    }

    public void queryByName(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        //待完善。。添加搜索出的条数，并分页
        String name=req.getParameter("name");
        //System.out.println("解码前："+name);
        //String name=decode(req.getParameter("name"),"utf-8");
        //System.out.println("解码后："+name);
        List<BookBean> list=myITb_BookService.queryByName(name);
        req.setAttribute("booklist",list);
        req.getRequestDispatcher("/jsp/searchList.jsp").forward(req,resp);
    }
}