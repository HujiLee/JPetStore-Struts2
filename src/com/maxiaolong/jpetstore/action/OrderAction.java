package com.maxiaolong.jpetstore.action;

import com.maxiaolong.jpetstore.dao.ItemDAO;
import com.maxiaolong.jpetstore.dao.OrdersDAO;
import com.maxiaolong.jpetstore.dao.impl.ItemDAOJdbcImpl;
import com.maxiaolong.jpetstore.dao.impl.OrdersDAOJdbcImpl;
import com.maxiaolong.jpetstore.domain.Orders;
import com.maxiaolong.jpetstore.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class OrderAction extends ActionSupport {

    private OrdersDAO ordersDAO;
    private ItemDAO itemDAO;
    private Orders orders;
    private String purchase;
    private Map<String,String> totalValue;

    public Map<String, String> getTotalValue() {
        return totalValue;
    }

    public void setTotalValue(Map<String, String> totalValue) {
        this.totalValue = totalValue;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public String getPurchase() {
        return purchase;
    }

    public void setPurchase(String purchase) {
        this.purchase = purchase;
    }

    public OrderAction() {
        ordersDAO = new OrdersDAOJdbcImpl();
        itemDAO=new ItemDAOJdbcImpl();
    }

    public String makeOrder() throws Exception {

        String ordersid = ((User) ActionContext.getContext().getSession().get("userinfo")).getUserid();
        Double listPrice = new Double(0);
        if(!orders.getItemid().equals("")){
            listPrice = itemDAO.getListprice(orders.getItemid());
            Orders myorders = new Orders(ordersid, orders.getItemid(), orders.getQuatity(), listPrice*orders.getQuatity(), 0);
            ordersDAO.saveOrUpdate(myorders);
        }

        if(purchase.equals("1")){   //具体购买某物品
            Double totalValue = ordersDAO.getTotalValue(ordersid);
            ((Map)ActionContext.getContext().get("request")).put("totalValue", totalValue);
            ((Map)ActionContext.getContext().get("request")).put("cart", ordersDAO.getAllOders(ordersid));

            String dowhat="选择购买itemid="+orders.getItemid()+"数量="+orders.getQuatity()+"总价="+listPrice*orders.getQuatity();
            ActionContext.getContext().getSession().put("dowhat",dowhat);
            return "cart_success";
        }

        if (purchase.equals("0")) { //j将某物品添加到购物车
            String dowhat="将itemid="+orders.getItemid()+"数量="+orders.getQuatity()+"总价="+listPrice*orders.getQuatity()+"加入购物车";
            ActionContext.getContext().getSession().put("dowhat",dowhat);
            return "index_success";
        }

        if(purchase.equals("-1")){ //直接进入购物车
            Double totalValue = ordersDAO.getTotalValue(ordersid);
            ((Map)ActionContext.getContext().get("request")).put("totalValue", totalValue);
            ((Map)ActionContext.getContext().get("request")).put("cart", ordersDAO.getAllOders(ordersid));
            String dowhat="查看购物车";
            ActionContext.getContext().getSession().put("dowhat",dowhat);
            return "cart_success";
        }

        return null;
    }


    public String reviseOrder() throws Exception{
        String ordersid = ((User)ActionContext.getContext().getSession().get("userinfo")).getUserid();
        Orders myorders = new Orders(ordersid, orders.getItemid(), orders.getQuatity(), orders.getTotalprice(), 0);
        ordersDAO.saveOrUpdate(myorders);
        Double totalPrice = ordersDAO.getTotalValue(ordersid);
        totalValue=new HashMap<String, String>();
        totalValue.put("totalValue",totalPrice.toString());
        String dowhat="修改itemid="+orders.getItemid()+"的数量="+orders.getQuatity();
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "success";
    }

    public String deleteOrder() throws Exception{
        String ordersid = ((User)ActionContext.getContext().getSession().get("userinfo")).getUserid();
        ordersDAO.delete(ordersid, orders.getItemid());
        double totalValue=0.0;
        if(ordersDAO.getTotalValue(ordersid)!=null){
        totalValue = ordersDAO.getTotalValue(ordersid);}

        ((Map)ActionContext.getContext().get("request")).put("totalValue", totalValue);
        ((Map)ActionContext.getContext().get("request")).put("cart", ordersDAO.getAllOders(ordersid));
        String dowhat="删除itemid="+orders.getItemid()+"的订单";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "cart_success";
    }

    public String purchase() throws Exception{
        String ordersid = ((User)ActionContext.getContext().getSession().get("userinfo")).getUserid();
        Double totalPrice = ordersDAO.getTotalValue(ordersid);
        ordersDAO.pay(ordersid);
        String dowhat="完成订单,支付"+totalPrice;
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return null;
    }


}
