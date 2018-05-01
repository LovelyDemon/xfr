package com.util;

import my.jianjie;
import my.news_add;
import my.personal;
import my.pro_add;
import my.rec_add;
import my.scenic_add;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DBUtil {
    boolean bInited = false;

    //加载驱动
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


    public String loginSuccess(String userName, String password, String utypeInDB) {
        boolean returnValue = false;
        String sql = "SELECT * FROM user";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String userNameInDB = rs.getString("uname");
                String passwordInDB = rs.getString("upass");
                System.out.print(utypeInDB);
                System.out.print("dbu");
                if (userNameInDB.equals(userName) &&
                        passwordInDB.equals(password)) {
                    returnValue = true;
                    utypeInDB = rs.getString("utype");
                    break;
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return utypeInDB;

    }


    public boolean ifadmin(String userName) {   //判断用户身份
        System.out.println(" ola!");
        boolean returnValue = false;

        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM user");
            while (rss.next()) {
                System.out.println(" hi!");
                String utypeInDB = rss.getString("utype");
                String userNameInDB = rss.getString("uname");
                System.out.print(userNameInDB);
                System.out.print(userName);
                if (userNameInDB.equals(userName) && utypeInDB.equals("admin")) {

                    returnValue = true;
                    break;
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return returnValue;

    }

    public boolean ifhas(String userName, String rupass, String ruphone, String rumail) {  //判断用户是否已经存在
        boolean returnValue = true;
        Connection conne = null;
        Statement stmtt = null;
        Statement stmtt2 = null;
        ResultSet rss = null;
        ResultSet rss2 = null;

        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM user");

            String rutype = "user";
            int rid = 0;
            while (rss.next()) {
                String utypeInDB = rss.getString("utype");
                rid = rss.getInt("id");
                String userNameInDB = rss.getString("uname");
                System.out.print(userNameInDB);
                System.out.print(userName);
                if (userNameInDB.equals(userName) && utypeInDB.equals("user")) {

                    returnValue = false;
                }
            }
            if (returnValue) {
                ++rid;
                rss2 = stmtt2.executeQuery("SELECT * FROM user");
                int result = stmtt2.executeUpdate("insert into user values (" + rid + ",'" + rutype + "','" + userName + "','" + rupass + "','" + ruphone + "','" + rumail + "')");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return returnValue;

    }


    public boolean injianjie(jianjie a) {  //修改简介
        System.out.println(" haha!");

        Connection conne = null;
        Statement stmtt = null;
        boolean b = false;
        String jieshao = a.getJieshao();//取得用户名
        String wenhua = a.getWenhua();//取得密码

        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(" heihei!");


            if (jieshao != "" && wenhua != "") {
                b = true;
                int result = stmtt.executeUpdate("UPDATE jianjie SET jieshao='" + jieshao + "',wenhua='" + wenhua + "' where jid='1'");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;

    }


    public void tiqujie(jianjie a) {  //提取介绍到增加简介
        System.out.println(" ola!");
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM jianjie");
            while (rss.next()) {
                System.out.println(" hi!");
                a.setJieshao(rss.getString("jieshao"));
                a.setWenhua(rss.getString("wenhua"));


            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    public void tiqunews(news_add a, int i) {  //提取新闻到主页
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {

            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM news where neid='" + i + "'");
            while (rss.next()) {
                System.out.println(" hi!");
                a.setnesavetime(rss.getString("nesavetime"));
                a.setnename(rss.getString("nename"));
                a.setnename(rss.getString("nename"));
                a.setnezy(rss.getString("nezy"));

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public void tiqupro(pro_add a, String i) {  //提取新闻到主页
        System.out.println(" ola!");
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM product where prid='" + i + "'");
            while (rss.next()) {
                a.setprname(rss.getString("prname"));
                a.setprprice(rss.getString("prprice"));
                a.setprpic(rss.getString("prpic"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public void tiquscenic(scenic_add a, String i) {  //提取新闻到主页
        System.out.println(" ola!");
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM scenic where scid='" + i + "'");
            while (rss.next()) {
                a.setscname(rss.getString("scname"));
                a.setsctj(rss.getString("sctj"));
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public String adnews(news_add a) {  //添加新闻

        System.out.println(" haha!");

        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        String b = null;
        String nename = a.getnename();//取得用户名
        String neactor = a.getneactor();//取得密码
        String nezy = a.getnezy();
        String nenr = a.getnenr();
        String nepic = a.getnepic();
        System.out.println(" lll!" + nename);
        int neid = 1;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(" heihei!");
            rss = stmtt.executeQuery("SELECT * FROM news");
            while (rss.next()) {
                System.out.println(" hi!");
                neid = rss.getInt("neid");
                if (nename.equals(rss.getString("nename"))) {
                    System.out.println("ok");
                    b = "c";
                    if (nename != null && neactor != null && nezy != null && nenr != null && nepic != null) {
                        Date now = new Date();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd ");//可以方便地修改日期格式
                        String hehe = dateFormat.format(now);
                        int result = stmtt.executeUpdate("UPDATE news SET nename='" + nename + "',neactor='" + neactor + "',nezy='" + nezy + "',nenr='" + nenr + "',nepic='" + nepic + "',nesavetime='" + hehe + "' where neid=" + neid + "");
                        b = "b";

                        return b;

                    }

                }
            }
            ++neid;

            if (nename != "" && neactor != "" && nezy != "" && nenr != "" && nepic != "") {
                // b="a";
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                String hehe = dateFormat.format(now);
                int result = stmtt.executeUpdate("insert into news values (" + neid + ",'" + nename + "','" + neactor + "','" + nezy + "','" + nenr + "','" + nepic + "','" + hehe + "')");
                b = "a";
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;

    }

    public boolean cuser(personal a) {  //修改个人信息
        Connection conne = null;
        Statement stmtt = null;
        boolean b = false;
        String cuname = a.getcuname();//取得用户名
        String cupass = a.getcupass();//取得密码
        String cuphone = a.getcuphone();
        String cumail = a.getcumail();
        System.out.println(cupass);
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(cuname);


            if (cuname != "" && cupass != "") {
                int result = stmtt.executeUpdate("UPDATE user SET upass='" + cupass + "',uphone='" + cuphone + "',umail='" + cumail + "' where uname='" + cuname + "'");
                b = true;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public void tipersonal(personal a, String sename, String setype) {  //提取个人信息
        System.out.println(" tiperson!");
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM user where uname='" + sename + "' and utype='" + setype + "'");

            System.out.println(" hi!");
            while (rss.next()) {
                System.out.println(" hi!");
                a.setcuname(rss.getString("uname"));
                a.setcupass(rss.getString("upass"));
                a.setcuphone(rss.getString("uphone"));
                a.setcumail(rss.getString("umail"));
                System.out.print(a.cuname);


            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String adscenic(scenic_add a) {  //添加景点

        System.out.println(" haha!");

        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        String b = null;
        String scname = a.getscname();//取得用户名
        String sclocal = a.getsclocal();//取得密码
        String scprice = a.getscprice();
        String scjs = a.getscjs();
        String sctj = a.getsctj();
        String scpic1 = a.getscpic1();
        String scpic2 = a.getscpic2();
        String scpic3 = a.getscpic3();
        String scpic4 = a.getscpic4();

        int scid = 0;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(" jieshao!");
            rss = stmtt.executeQuery("SELECT * FROM scenic");
            while (rss.next()) {
                System.out.println(" WWWWW!");
                scid = rss.getInt("scid");
                if (scname.equals(rss.getString("scname"))) {
                    System.out.println("ok");
                    b = "c";
                    if (scname != "" && sclocal != "" && scprice != "" && scjs != "" && sctj != "") {

                        int result = stmtt.executeUpdate("UPDATE scenic SET scname='" + scname + "',sclocal='" + sclocal + "',scprice='" + scprice + "',scjs='" + scjs + "',sctj='" + sctj + "',scpic1='" + scpic1 + "',scpic2='" + scpic2 + "',scpic3='" + scpic3 + "',scpic4='" + scpic4 + "' where scid=" + scid + "");
                        b = "b";

                        return b;

                    }

                }
            }
            ++scid;

            if (scname != "" && sclocal != "" && scprice != "" && scjs != "" && sctj != "") {
                b = "a";
                int result = stmtt.executeUpdate("insert into scenic values (" + scid + ",'" + scname + "','" + sclocal + "','" + scprice + "','" + scjs + "','" + sctj + "','" + scpic1 + "','" + scpic2 + "','" + scpic3 + "','" + scpic4 + "')");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public String adpro(pro_add a) {  //添加产品
        String b = null;
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;


        String prname = a.getprname();//取得用户名
        String prprice = a.getprprice();//取得密码
        String prjs = a.getprjs();
        String prpic = a.getprpic();
        int prid = 0;


        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(" product!");
            rss = stmtt.executeQuery("SELECT * FROM product");
            while (rss.next()) {
                prid = rss.getInt("prid");
                System.out.println("start");
                System.out.println(prname);
                System.out.println(rss.getString("prname"));
                System.out.println("reset");
                if (prname.equals(rss.getString("prname"))) {
                    System.out.println("ok");
                    b = "c";
                    if (prname != "" && prprice != "" && prjs != "" && prpic != "") {

                        int result = stmtt.executeUpdate("UPDATE product SET prname='" + prname + "',prprice='" + prprice + "',prjs='" + prjs + "',prpic='" + prpic + "' where prid=" + prid + "");
                        b = "b";

                        return b;

                    }

                }
            }
            ++prid;

            if (prname != "" && prprice != "" && prjs != "" && prpic != "") {

                int result = stmtt.executeUpdate("insert into product values (" + prid + ",'" + prname + "','" + prprice + "','" + prjs + "','" + prpic + "')");
                b = "a";

            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }

    public String adrec(rec_add a) {  //添加推荐路线

        System.out.println(" haha!");
        String b = null;
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;

        String rename = a.getrename();//取得用户名
        String reactor = a.getreactor();//取得密码
        String renr = a.getrenr();
        String rezy = a.getrezy();
        String repic = a.getrepic();
        int reid = 0;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            System.out.println(" recommend!");
            rss = stmtt.executeQuery("SELECT * FROM recommend");
            while (rss.next()) {

                reid = rss.getInt("reid");
                if (rename.equals(rss.getString("rename"))) {
                    System.out.println("ok");
                    b = "c";
                    if (rename != "" && renr != "" && rezy != "" && reactor != "" && repic != "") {
                        Date now = new Date();
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                        String hehe = dateFormat.format(now);
                        int result = stmtt.executeUpdate("UPDATE recommend SET `rename`='" + rename + "',renr='" + renr + "',rezy='" + rezy + "',reactor='" + reactor + "',repic='" + repic + "',redate='" + hehe + "' where reid=" + reid + "");
                        b = "b";

                        return b;

                    }

                }
            }
            ++reid;

            System.out.println(" r0000rrr!");

            if (rename != "" && renr != "" && reactor != "" && repic != "") {
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                String hehe = dateFormat.format(now);
                int result = stmtt.executeUpdate("insert into recommend values (" + reid + ",'" + rename + "','" + reactor + "','" + rezy + "','" + renr + "','" + repic + "','" + hehe + "','0')");
                b = "a";
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return b;
    }


    public String ifuser(String userName, String lxmail, String lxsub, String lxnr) {   //判断用户身份
        System.out.println(" ola!");
        String returnValue = "a";
        int rid = 1;
        String utypeInDB = "";
        String userNameInDB = "";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        Statement stmtt2 = null;
        ResultSet rss2 = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();

            rss2 = stmtt2.executeQuery("SELECT * FROM lxwm");
            while (rss2.next()) {
                System.out.println(" hi!");

                rid = rss2.getInt("lxid");
            }
            rss = stmtt.executeQuery("SELECT * FROM user");
            while (rss.next()) {
                System.out.println(" hi!");
                utypeInDB = rss.getString("utype");
                userNameInDB = rss.getString("uname");

                System.out.print(userNameInDB);
                System.out.print(userName);

                if (userNameInDB.equals(userName)) {
                    ++rid;
                    System.out.print("!!!!!");
                    Date now = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式


                    String hehe = dateFormat.format(now);
                    System.out.println(hehe);
                    rss2 = stmtt2.executeQuery("SELECT * FROM lxwm");
                    if (lxmail != "" && lxsub != "" && lxnr != "") {

                        int result = stmtt2.executeUpdate("insert into lxwm values (" + rid + ",'" + userName + "','" + lxmail + "','" + lxsub + "','" + lxnr + "','" + hehe + "','未回复')");
                        returnValue = "b";
                        return returnValue;
                    } else {
                        returnValue = "c";
                        return returnValue;
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return returnValue;

    }

    public String adorder(String hoid, String honame, String ordkind, String ordphone, String orddate, String ordlong, String ordbz, String orduname) {   //判断用户身份

        String returnValue = "a";
        int ordid = 1;
        String utypeInDB = "";
        String userNameInDB = "";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        Statement stmtt2 = null;
        ResultSet rss2 = null;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();
            System.out.println(" adorder_getordid!");
            rss2 = stmtt2.executeQuery("SELECT * FROM hotelord");
            while (rss2.next()) {
                System.out.println(" adorder_getordid!");

                ordid = rss2.getInt("ordid");
            }
            System.out.print(ordid);
            rss = stmtt.executeQuery("SELECT * FROM user");
            while (rss.next()) {
                System.out.println(" hi!");
                userNameInDB = rss.getString("uname");
                System.out.print(userNameInDB);
                System.out.print(orduname);

                if (userNameInDB.equals(orduname)) {
                    ++ordid;
                    System.out.print("!!!!!");
                    Date now = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式


                    String hehe = dateFormat.format(now);
                    System.out.println(hehe);
                    rss2 = stmtt2.executeQuery("SELECT * FROM hotelord");
                    if (orduname != "" && ordphone != "" && orddate != "" && ordlong != "") {

                        int result = stmtt2.executeUpdate("insert into hotelord values (" + ordid + ",'" + hoid + "','" + honame + "','" + ordkind + "','" + orduname + "','" + ordphone + "','" + orddate + "','" + ordlong + "','" + ordbz + "','等待确认','" + hehe + "')");
                        returnValue = "b";
                        return returnValue;
                    } else {
                        returnValue = "c";
                        return returnValue;
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return returnValue;

    }


    public boolean huifu(String lxname, String sub, String huinr, String idd) {  //回复
        boolean a = false;
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        Statement stmtt2 = null;
        ResultSet rss2 = null;
        Statement stmtt3 = null;
        ResultSet rss3 = null;
        int huiid = 1;
        try {
            conne = getConnection();
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();
            stmtt3 = conne.createStatement();
            System.out.println(" huifu!");
            rss = stmtt.executeQuery("SELECT * FROM huifu");
            while (rss.next()) {
                huiid = rss.getInt("huiid");

            }
            if (huinr != "") {
                ++huiid;
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                String hehe = dateFormat.format(now);
                rss2 = stmtt2.executeQuery("SELECT * FROM huifu");
                int result = stmtt2.executeUpdate("insert into huifu values (" + huiid + "," + idd + ",'" + lxname + "','" + sub + "','" + huinr + "','" + hehe + "')");
                rss3 = stmtt3.executeQuery("SELECT * FROM lxwm");
                int result2 = stmtt3.executeUpdate("UPDATE lxwm SET lxhf='已回复' where lxid=" + idd + "");

                a = true;
                return a;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public boolean addCompanion(String title, String startDate, String endDate, String location,
                                Integer maleNum, Integer femaleNum, String phone, String detail) {
        boolean response = false;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            statement = connection.createStatement();
            int result = statement.executeUpdate(
                    "INSERT INTO companion ( title, start_date, end_date, location, male_num, female_num, phone, detail )" +
                            "VALUES ( '" + title + "', '" + startDate + "', '" + endDate + "', '" + location + "', "
                            + maleNum + ", " + femaleNum + ", '" + phone + "', '" + detail + "' )");
            if (result == 1) {
                response = true;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return response;
    }


}
