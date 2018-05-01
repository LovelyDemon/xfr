package com.change;

import com.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UadminDao implements UadminService {

    private JdbcUtils jdbcUtils;

    public UadminDao() {
        jdbcUtils = new JdbcUtils();
    }


    @Override
    public List<Map<String, Object>> listUadmin(String uname, int start, int end) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Object> params = new ArrayList<Object>();
        try {
            jdbcUtils.getConnection();
            String sql = "select * from user where 1=1 and utype='user' and uname like ? limit ? ,?";
            if (uname.equals("")) {
                sql = "select * from user  where 1=1 and utype='user' limit ? ,? ";
                params.add(start);
                params.add(end);

            } else {
                params.add("%" + uname + "%");
                params.add(start);
                params.add(end);
            }

            list = jdbcUtils.findMoreResult(sql, params);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            jdbcUtils.releaseConn();
        }
        return list;
    }

    //查询总记录数
    @Override
    public int getItemCount(String uname) {
        int count = 0;
        Map<String, Object> map = null;
        List<Object> params = null;
        try {
            jdbcUtils.getConnection();
            String sql = "select count(*) totalCount from user where 1=1 and utype='user' and uname like ?";
            if (uname.equals("")) {
                sql = "select count(*) totalCount from user where 1=1 and utype='user'";

            } else {
                params = new ArrayList<Object>();
                params.add("%" + uname + "%");
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
    public boolean delUadmin(String[] ids) {
        boolean flag = false;
        try {
            jdbcUtils.getConnection();
            if (ids != null) {
                String[] sql = new String[ids.length];
                for (int i = 0; i < ids.length; i++) {
                    sql[i] = "delete from user where id = '" + ids[i] + "'";
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
    public Map<String, Object> viewUadmin(String uid) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        try {
            jdbcUtils.getConnection();
            List<Object> params = new ArrayList<Object>();
            params.add(uid);
            String sql = "select * from user where id = ?";
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