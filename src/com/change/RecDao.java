package com.change;

import com.util.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class RecDao implements RecService {

    private JdbcUtils jdbcUtils;

    public RecDao() {
        // TODO Auto-generated constructor stub
        jdbcUtils = new JdbcUtils();
    }


    @Override
    public List<Map<String, Object>> listRec(String rename, int start, int end) {
        // TODO Auto-generated method stub
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Object> params = new ArrayList<Object>();
        try {
            jdbcUtils.getConnection();
            System.out.print("rename:" + rename);
            String sql = "select * from recommend where 1=1 and `rename` like ? order by reid desc limit ? ,?";
            if (rename.equals("")) {
                sql = "select * from recommend order by reid desc limit ? ,?";
                params.add(start);
                params.add(end);

            } else {
                params.add("%" + rename + "%");
                params.add(start);
                params.add(end);
            }

            list = jdbcUtils.findMoreResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {


            jdbcUtils.releaseConn();

        }


        return list;
    }

    @Override
    public List<Map<String, Object>> listpl_ht(String rename, int start, int end) {
        // TODO Auto-generated method stub
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Object> params = new ArrayList<Object>();
        try {
            jdbcUtils.getConnection();
            String sql = "select * from repl where 1=1 and rename like ? order by replid desc limit ? ,?";
            if (rename.equals("")) {
                sql = "select * from repl order by replid desc limit ? ,?";
                params.add(start);
                params.add(end);

            } else {
                params.add("%" + rename + "%");
                params.add(start);
                params.add(end);
            }

            list = jdbcUtils.findMoreResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {


            jdbcUtils.releaseConn();

        }

        return list;
    }

    @Override
    public List<Map<String, Object>> listpl(String reid, int start, int end) {
        // TODO Auto-generated method stub
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Object> params = new ArrayList<Object>();
        try {
            jdbcUtils.getConnection();
            System.out.print("kkk" + reid);
            String sql = "select * from repl where 1=1 and reid='" + reid + "' limit ? ,?";
            params.add(start);
            params.add(end);


            list = jdbcUtils.findMoreResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {


            jdbcUtils.releaseConn();

        }


        return list;
    }


    //查询总记录数
    @Override
    public int getItemCount(String rename) {
        // TODO Auto-generated method stub
        int count = 0;
        Map<String, Object> map = null;
        List<Object> params = null;
        try {
            jdbcUtils.getConnection();
            String sql = "select count(*) totalCount from recommend where `rename` like ?";
            if (rename.equals("")) {
                sql = "select count(*) totalCount from recommend";

            } else {
                params = new ArrayList<Object>();
                params.add("%" + rename + "%");
            }
            map = jdbcUtils.findSimpleResult(sql, params);
            count = Integer.parseInt(map.get("totalCount").toString());

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return count;
    }

    @Override
    public int getplItemCount(String rename) {
        // TODO Auto-generated method stub
        int count = 0;
        Map<String, Object> map = null;
        List<Object> params = null;
        try {
            jdbcUtils.getConnection();
            String sql = "select count(*) totalCount from repl where 1=1 and rename like ?";
            if (rename.equals("")) {
                sql = "select count(*) totalCount from repl";

            } else {
                params = new ArrayList<Object>();
                params.add("%" + rename + "%");
            }
            map = jdbcUtils.findSimpleResult(sql, params);
            count = Integer.parseInt(map.get("totalCount").toString());

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return count;
    }

    public int getplCount(String replid) {
        // TODO Auto-generated method stub
        int count = 0;
        Map<String, Object> map = null;
        List<Object> params = null;
        System.out.println(replid);

        try {

            jdbcUtils.getConnection();
            String sql = "select count(*) totalCount from repl where 1=1 and reid='" + replid + "'";
            if (replid.equals("")) {
                sql = "select count(*) totalCount from repl where 1=1 ";

            } else {
                params = new ArrayList<Object>();
                params.add("%" + replid + "%");
            }
            map = jdbcUtils.findSimpleResult(sql, params);
            count = Integer.parseInt(map.get("totalCount").toString());

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return count;
    }

    @Override
    public boolean delRec(String[] ids) {
        boolean flag = false;
        try {
            jdbcUtils.getConnection();
            if (ids != null) {
                String[] sql = new String[ids.length];
                String[] sql2 = new String[ids.length];
                String[] sql3 = new String[ids.length];
                for (int i = 0; i < ids.length; i++) {
                    sql[i] = "delete from recommend where reid = '" + ids[i] + "'";
                    System.out.println(sql[i]);
                }
                for (int j = 0; j < ids.length; j++) {
                    sql2[j] = "delete from repl where reid = '" + ids[j] + "'";
                    System.out.println(sql2[j]);
                }
                for (int k = 0; k < ids.length; k++) {
                    sql3[k] = "delete from favourite where reid = '" + ids[k] + "'";
                    System.out.println(sql3[k]);
                }
                jdbcUtils.deleteByBatch(sql2);
                jdbcUtils.deleteByBatch(sql3);
                flag = jdbcUtils.deleteByBatch(sql);
            }


        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }

        return flag;
    }

    @Override
    public boolean delpl(String[] ids) {
        boolean flag = false;
        try {
            jdbcUtils.getConnection();
            if (ids != null) {
                String[] sql = new String[ids.length];
                for (int i = 0; i < ids.length; i++) {
                    sql[i] = "delete from repl where replid = '" + ids[i] + "'";
                    System.out.println(sql[i]);
                }
                flag = jdbcUtils.deleteByBatch(sql);
            }


        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }

        return flag;
    }

    @Override
    public String addpl(String reid, String rename, String replnr, String userName) {
        System.out.println(" ola!");
        String returnValue = "a";

        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        Statement stmtt2 = null;
        ResultSet rss2 = null;

        int plid = 1;
        try {
            conne = jdbcUtils.getConnection();
            ;
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();

            rss = stmtt.executeQuery("SELECT * FROM user");
            while (rss.next()) {
                System.out.println(" hi!");
                String utypeInDB = rss.getString("utype");
                String userNameInDB = rss.getString("uname");
                int rid = rss.getInt("id");
                System.out.print(userNameInDB);
                System.out.print(userName);
                if (userNameInDB.equals(userName)) {

                    System.out.print("!!!!!");
                    Date now = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                    rss2 = stmtt2.executeQuery("SELECT * FROM repl");
                    while (rss2.next()) {
                        System.out.println(" hi!");
                        plid = rss2.getInt("replid");
                    }
                    ++plid;
                    String hehe = dateFormat.format(now);
                    System.out.println(hehe);
                    if (replnr != "") {
                        int result = stmtt2.executeUpdate("insert into repl values (" + plid + ",'" + reid + "','" + rename + "','" + userName + "','" + replnr + "','" + hehe + "')");
                        returnValue = "b";
                        return returnValue;
                    } else {
                        returnValue = "c";
                        return returnValue;
                    }
                }
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }

        return returnValue;
    }


    @Override
    public void like(String reid) {
        String returnValue = "a";

        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        try {
            conne = jdbcUtils.getConnection();
            ;
            stmtt = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM recommend");
            int result = stmtt.executeUpdate("UPDATE recommend SET relike=relike+1 where reid=" + reid + "");
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }

    }

    @Override
    public String fav(String reid, String rename, String userName) {

        String returnValue = "a";
        Connection conne = null;
        Statement stmtt = null;
        ResultSet rss = null;
        Statement stmtt2 = null;
        ResultSet rss2 = null;
        int favid = 1;
        try {
            conne = jdbcUtils.getConnection();
            ;
            stmtt = conne.createStatement();
            stmtt2 = conne.createStatement();
            rss = stmtt.executeQuery("SELECT * FROM favourite");
            while (rss.next()) {
                String Uname = rss.getString("uname");
                String Rename = rss.getString("rename");
                int rid = rss.getInt("favid");
                if (Uname.equals(userName) && Rename.equals(rename)) {
                    returnValue = "b";
                    return returnValue;
                }
            }
            if (userName != null) {
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
                rss2 = stmtt2.executeQuery("SELECT * FROM favourite");
                while (rss2.next()) {
                    favid = rss2.getInt("favid");
                }
                ++favid;
                String date = dateFormat.format(now);
                int result = stmtt2.executeUpdate("insert into favourite values (" + favid + ",'" + reid + "','" + userName + "','" + rename + "','" + date + "')");
                returnValue = "a";
                return returnValue;
            } else {
                returnValue = "c";
                return returnValue;
            }


        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }

        return returnValue;
    }


    @Override
    public Map<String, Object> viewRec(String reid) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        try {
            jdbcUtils.getConnection();
            List<Object> params = new ArrayList<Object>();
            params.add(reid);
            String sql = "select * from recommend where reid = ?";
            map = jdbcUtils.findSimpleResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return map;
    }

    @Override
    public Map<String, Object> viewpl_ht(String replid) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        try {
            jdbcUtils.getConnection();
            List<Object> params = new ArrayList<Object>();
            params.add(replid);
            String sql = "select * from repl where replid = ?";
            map = jdbcUtils.findSimpleResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return map;
    }

    @Override
    public Map<String, Object> viewpl(String reid) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        try {
            jdbcUtils.getConnection();
            List<Object> params = new ArrayList<Object>();
            params.add(reid);
            String sql = "select * from repl where reid = ?";
            map = jdbcUtils.findSimpleResult(sql, params);

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }


        return map;
    }

}