package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.ItemDAO;
import com.maxiaolong.jpetstore.dao.OrdersDAO;
import com.maxiaolong.jpetstore.domain.Orders;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class OrdersDAOJdbcImpl extends DAO<Orders> implements OrdersDAO {

    @Override
    public void saveOrUpdate(Orders orders) {
        String sql = "select * from orders where ordersid=? and itemid=? and status=?";
        //有此item的订单且没付款,update
        if (get(sql, orders.getOrdersid(), orders.getItemid(),0) != null) {
            String updateSql = "update orders set quatity=? , totalprice=? where ordersid=? and itemid=?";
            update(updateSql, orders.getQuatity(), orders.getTotalprice(), orders.getOrdersid(), orders.getItemid());
        }
        //没有此item的订单,insert into
       else{
            String updateSql2= "insert into orders (ordersid,itemid,quatity,totalprice,status) values(?,?,?,?,?)";
            update(updateSql2, orders.getOrdersid(), orders.getItemid(), orders.getQuatity(), orders.getTotalprice(),orders.getStatus());
        }
    }

    @Override
    public void delete(String ordersid,String itemid ) {
        String sql = "delete  from orders where ordersid=? and itemid=? and status=?";
        update(sql, ordersid,itemid,0);
    }

    @Override
    public int getStatus(Orders orders) {
        String sql = "select status from orders where ordersid=? and itemid=?";
        return getForValue(sql, orders.getOrdersid(), orders.getItemid());
    }

    @Override
    public List<Orders> getAllOders(String ordersid) {
        String sql = "select * from orders where ordersid=? and status =0";
        return getForList(sql,ordersid);
    }

    @Override
    public Double getTotalValue(String ordersid) {
        String sql="select sum(totalprice) from orders where ordersid=? and status=0";
        return getForValue(sql,ordersid);
    }

    @Override
    public void pay(String ordersid) {
        String sql="update orders set status=1 where ordersid=? and status=0";
        update(sql,ordersid);
    }

    public void purchase(Orders orders){
        String sql = "update orders set set quatity=? , totalprice=?,status=? where ordersid=? and itemid=?";
        update(sql,orders.getQuatity(),orders.getTotalprice(),1,orders.getOrdersid(),orders.getItemid());
    }
}
