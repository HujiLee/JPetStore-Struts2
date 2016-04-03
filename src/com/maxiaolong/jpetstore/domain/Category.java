package com.maxiaolong.jpetstore.domain;

/**
 * Created by maxiaolong on 2016/3/6.
 */
public class Category {

    private String catid;
    private String name;
    private String descn;

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

    public Category() {
    }

    public Category(String catid, String name, String descn) {
        this.catid = catid;
        this.name = name;
        this.descn = descn;
    }

    @Override
    public String toString() {
        return "Category{" +
                "catid='" + catid + '\'' +
                ", name='" + name + '\'' +
                ", descn='" + descn + '\'' +
                '}';
    }
}
