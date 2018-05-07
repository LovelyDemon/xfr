package com.change;

import com.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ScenicDao implements ScenicService {

    private JdbcUtils jdbcUtils;

    public ScenicDao() {
        jdbcUtils = new JdbcUtils();
    }

    @Override
    public List<Map<String, Object>> listScenic(String scname, int start, int end) {
        // TODO Auto-generated method stub
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Object> params = new ArrayList<Object>();
        try {
            jdbcUtils.getConnection();
            String sql = "select * from scenic where 1=1 and scname like ? limit ? ,?";
            if (scname.equals("")) {
                sql = "select * from scenic limit ? ,?";
                params.add(start);
                params.add(end);

            } else {
                params.add("%" + scname + "%");
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
    public int getCount(String scname) {
        int count = 0;
        List<Object> params = null;
        try {
            jdbcUtils.getConnection();
            String sql = "select count(*) totalCount from scenic where 1=1 and scname like ?";
            if (scname.equals("")) {
                sql = "select count(*) totalCount from scenic";

            } else {
                params = new ArrayList<>();
                params.add("%" + scname + "%");
            }
            Map<String, Object> map = jdbcUtils.findSimpleResult(sql, params);
            count = Integer.parseInt(map.get("totalCount").toString());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            jdbcUtils.releaseConn();
        }
        return count;
    }

    @Override
    public boolean delScenic(String[] ids) {
        boolean flag = false;
        try {
            jdbcUtils.getConnection();
            if (ids != null) {
                String[] sql = new String[ids.length];
                for (int i = 0; i < ids.length; i++) {
                    sql[i] = "delete from scenic where scid = '" + ids[i] + "'";
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
    public Map<String, Object> viewScenic(String scid) {
        // TODO Auto-generated method stub
        Map<String, Object> map = null;
        try {
            jdbcUtils.getConnection();
            List<Object> params = new ArrayList<Object>();
            params.add(scid);
            String sql = "select * from scenic where scid = ?";
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