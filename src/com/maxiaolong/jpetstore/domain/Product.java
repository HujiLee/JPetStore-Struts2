package com.maxiaolong.jpetstore.domain;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class Product {

    private  String productid;
    private String catid;
    private  String name;
    private String descn;

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getCatid() {
        return catid;
    }

    public void setCatid(String catid) {
        this.catid = catid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescn() {
        return descn;
    }

    public void setDescn(String descn) {
        this.descn = descn;
    }

    public Product() {
    }

    public Product(String productid, String name, String catid, String descn) {
        this.productid = productid;
        this.name = name;
        this.catid = catid;
        this.descn = descn;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productid='" + productid + '\'' +
                ", catid='" + catid + '\'' +
                ", name='" + name + '\'' +
                ", descn='" + descn + '\'' +
                '}';
    }
}
