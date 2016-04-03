package com.maxiaolong.jpetstore.domain;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class Item {
    private String itemid;
    private String productid;
    private String name;
    private String descn;
    private double listprice;
    private String image;

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid;
    }

    public String getDescn() {
        return descn;
    }

    public void setDescn(String descn) {
        this.descn = descn;
    }

    public double getListprice() {
        return listprice;
    }

    public void setListprice(double listprice) {
        this.listprice = listprice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Item() {
    }

    public Item(String itemid, String productid, String name, String descn, double listprice, String image) {
        this.itemid = itemid;
        this.productid = productid;
        this.name = name;
        this.descn = descn;
        this.listprice = listprice;
        this.image = image;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemid='" + itemid + '\'' +
                ", productid='" + productid + '\'' +
                ", name='" + name + '\'' +
                ", descn='" + descn + '\'' +
                ", listprice=" + listprice +
                ", image='" + image + '\'' +
                '}';
    }
}
