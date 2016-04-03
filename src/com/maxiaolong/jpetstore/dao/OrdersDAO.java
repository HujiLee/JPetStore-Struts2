package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.Orders;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public interface OrdersDAO {
    void saveOrUpdate(Orders orders);
    void delete(String ordersid,String itemid ) ;
    int getStatus(Orders orders );
    List<Orders> getAllOders(String ordersid);
    Double getTotalValue(String ordersid);
    void pay(String ordersid);
}
