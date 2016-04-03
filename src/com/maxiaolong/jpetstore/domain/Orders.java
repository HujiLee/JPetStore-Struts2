package com.maxiaolong.jpetstore.domain;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class Orders {
    private String ordersid;
    private String itemid;
    private int quatity;
    private double totalprice;
    private int status;

    public String getOrdersid() {
        return ordersid;
    }

    public void setOrdersid(String ordersid) {
        this.ordersid = ordersid;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public int getQuatity() {
        return quatity;
    }

    public void setQuatity(int quatity) {
        this.quatity = quatity;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Orders() {
    }

    public Orders( String ordersid,String itemid, int quatity, double totalprice, int status) {
        this.itemid = itemid;
        this.quatity = quatity;
        this.totalprice = totalprice;
        this.status = status;
        this.ordersid = ordersid;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "ordersid='" + ordersid + '\'' +
                ", itemid='" + itemid + '\'' +
                ", quatity=" + quatity +
                ", totalprice=" + totalprice +
                ", status=" + status +
                '}';
    }
}
