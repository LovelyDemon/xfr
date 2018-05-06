package com.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCompanionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String location = request.getParameter("location");
        String limitNumStr = request.getParameter("limitNum");
        Integer limitNum = null;
        if (null != limitNumStr && !"".equals(limitNumStr)) {
            limitNum = Integer.parseInt(limitNumStr);
        }
        String phone = request.getParameter("phone");
        String detail = request.getParameter("getDetail");

        DBUtil db = new DBUtil();
        boolean success = db.addCompanion(title, startDate, endDate, location, limitNum, phone, detail);
        if (success) {
            String script = "<script> alert('添加成功');location.href='index.jsp'</script>";
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println(script);
        } else {
            String script = "<script> alert('添加失败');location.href='addCompanion.jsp'</script>";
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println(script);
        }
    }
}
