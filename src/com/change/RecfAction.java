package com.change;

import com.util.DividePage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

public class RecfAction extends HttpServlet {
    boolean bInited = false;
    private RecService service;

    /**
     * Constructor of the object.
     */
    public RecfAction() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }

    /**
     * The doPost method of the servlet. <br>
     * <p>
     * This method is called when a form has its tag value method equals to post.
     *
     * @param request  the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException      if an error occurred
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String action_flag = request.getParameter("action_flag");
        //if (action_flag.equals("add")) {
        //	addProduct(request,response);
        //}else
        if (action_flag.equals("search")) {
            listRec(request, response);
        } else if (action_flag.equals("del")) {
            System.out.print("dell!");

            delRec(request, response);
        } else if (action_flag.equals("view")) {
            viewRec(request, response);
        } else if (action_flag.equals("add")) {
            addpl(request, response);
        } else if (action_flag.equals("list")) {
            listpl(request, response);
        } else if (action_flag.equals("like")) {
            like(request, response);
        } else if (action_flag.equals("like1")) {
            like1(request, response);
        } else if (action_flag.equals("fav")) {
            fav(request, response);
        } else if (action_flag.equals("fav1")) {
            fav1(request, response);
        }


        out.flush();
        out.close();
    }

    public void initJDBC() throws ClassNotFoundException {
        //加载MYSQL JDBC驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        bInited = true;
        System.out.println("Success loading Mysql Driver!");
    }

    public Connection getConnection() throws ClassNotFoundException,
            SQLException {
        if (!bInited) {
            initJDBC();
        }
        //连接URL为 jdbc:mysql//服务器地址/数据库名
        //后面的2个参数分别是登陆用户名和密码
        Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/zhly", "root", "838943723");
        return conn;
    }


    private void viewRec(HttpServletRequest request,
                         HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reid = request.getParameter("reid");
        request.getSession().setAttribute("reiiid", reid);
        Map<String, Object> map = service.viewRec(reid);
        request.setAttribute("recMap", map);
        try {
            request.getRequestDispatcher("/recommend_single.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    private void addpl(HttpServletRequest request,
                       HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reiid = request.getParameter("reid");
        String replnr = request.getParameter("replnr");
        System.out.println("aaa" + replnr);
        String uname = (String) request.getSession().getAttribute("userName");
        System.out.println("flag:");
        String rename = "";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;

        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM recommend where reid='" + reiid + "'");
            while (rss.next()) {
                rename = rss.getString("rename");
            }

            String flag = service.addpl(reiid, rename, replnr, uname);
            if (flag == "b") {
                String script = "<script> alert('发表评论成功！');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
            if (flag == "c") {
                String script = "<script> alert('评论失败，评论内容不能为空！');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            } else {
                String script = "<script> alert('发表评论失败，请先登录！ ');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 批量删除产品
     *
     * @param request
     * @param response
     */
    private void delRec(HttpServletRequest request,
                        HttpServletResponse response) {
        // TODO Auto-generated method stub

        System.out.println("进入del");
        //获得复选框的值
        String[] ids = request.getParameterValues("ids");
        for (int i = 0; i < ids.length; i++) {
            System.out.println("ids[" + i + "]=" + ids[i]);
        }
        boolean flag = service.delRec(ids);
        System.out.println("删除flag:" + flag);
        if (flag) {
            try {

                request.getRequestDispatcher("/admin/rec_main.jsp").forward(request, response);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    private void listRec(HttpServletRequest request,
                         HttpServletResponse response) {
        // TODO Auto-generated method stub
        String recName = request.getParameter("rename");
        String pageNum = request.getParameter("pageNum");
        System.out.println("参数 pageNum :" + pageNum);
        if (recName == null) {
            recName = "";
        }

        int totalRecord = service.getItemCount(recName); //获取总的记录数
        int currentPage = 1;
        DividePage dividePage = new DividePage(5, totalRecord);//默认第一页开始
        if (pageNum != null) {

            currentPage = Integer.parseInt(pageNum);
            dividePage.setCurrentPage(currentPage);
        }

        //记录从第几行开始
        int start = dividePage.fromIndex();
        //显示几条记录
        int end = dividePage.toIndex();

        System.out.println("currentPageNum :" + dividePage.getCurrentPage() + ", start = " + start + ", end = " + end);

        List<Map<String, Object>> list = null;
        try {
            list = service.listRec(recName, start, end);
            request.setAttribute("listRec", list);
            request.setAttribute("dividePage", dividePage);
            request.setAttribute("recName", recName);
            request.getRequestDispatcher("/recommend.jsp").forward(request, response);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

    }

    private void listpl(HttpServletRequest request,
                        HttpServletResponse response) {
        // TODO Auto-generated method stub
        System.out.println("参数 plllll");
        String reid = request.getParameter("reid");


        request.getSession().setAttribute("reiiid", reid);
        Map<String, Object> map = service.viewRec(reid);
        request.setAttribute("recMap", map);

        String pageNum = request.getParameter("pageNum");
        System.out.println("参数 pageNum :" + pageNum);
        if (reid == null) {
            reid = "";
        }

        int totalRecord = service.getplCount(""); //获取总的记录数
        int currentPage = 1;
        DividePage dividePage = new DividePage(10, totalRecord);//默认第一页开始
        if (pageNum != null) {

            currentPage = Integer.parseInt(pageNum);
            dividePage.setCurrentPage(currentPage);
        }

        //记录从第几行开始
        int start = dividePage.fromIndex();
        //显示几条记录
        int end = dividePage.toIndex();

        System.out.println("currentPageNum :" + dividePage.getCurrentPage() + ", start = " + start + ", end = " + end);

        List<Map<String, Object>> list = null;
        try {
            list = service.listpl(reid, start, end);
            request.setAttribute("listpl", list);
            request.setAttribute("dividePage", dividePage);
            request.setAttribute("reid", reid);
            request.getRequestDispatcher("/recommend_single.jsp").forward(request, response);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

    }

    private void like(HttpServletRequest request,
                      HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reiid = request.getParameter("reid");
        System.out.print("fjdkfg" + reiid);
        service.like(reiid);
        try {

            request.getRequestDispatcher("RecfAction?action_flag=view&reid=" + reiid + "").forward(request, response);
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void like1(HttpServletRequest request,
                       HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reiid = request.getParameter("reid");
        service.like(reiid);
        try {

            request.getRequestDispatcher("/recommend.jsp").forward(request, response);
        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void fav(HttpServletRequest request,
                     HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reiid = request.getParameter("reid");

        String uname = (String) request.getSession().getAttribute("userName");
        System.out.println("flag:");
        String rename = "";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;

        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM recommend where reid='" + reiid + "'");
            while (rss.next()) {
                rename = rss.getString("rename");
            }

            String flag = service.fav(reiid, rename, uname);
            if (flag == "b") {
                String script = "<script> alert('您已经收藏过该文章！可在后台查看！');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
            if (flag == "c") {
                String script = "<script> alert('收藏失败！登陆后才能收藏页面！');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            } else {
                String script = "<script> alert('收藏成功！可在后台查看');location.href='RecfAction?action_flag=view&reid=" + reiid + "'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void fav1(HttpServletRequest request,
                      HttpServletResponse response) {
        // TODO Auto-generated method stub
        String reiid = request.getParameter("reid");

        String uname = (String) request.getSession().getAttribute("userName");
        String rename = "";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;

        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM recommend where reid='" + reiid + "'");
            while (rss.next()) {
                rename = rss.getString("rename");
                System.out.println(" 成功!" + rename);
            }

            String flag = service.fav(reiid, rename, uname);
            if (flag == "b") {
                String script = "<script> alert('您已经收藏过该文章！可在后台查看！');location.href='/recommend.jsp'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
            if (flag == "c") {
                String script = "<script> alert('收藏失败！登陆后才能收藏页面！');location.href='/recommend.jsp'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            } else {
                String script = "<script> alert('收藏成功！可在后台查看');location.href='/recommend.jsp'</script>";
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().println(script);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
        // Put your code here
        service = new RecDao();
    }

}