package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.ItemDAO;
import com.maxiaolong.jpetstore.domain.Item;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class ItemDAOJdbcImpl extends DAO<Item> implements ItemDAO {
    @Override
    public List<Item> getAll(String productid) {
        String sql="select * from item where productid=?";
        return getForList(sql,productid);
    }

    @Override
    public Double getListprice(String itemid) {
        String sql="select listprice from item where itemid=?";
        return getForValue(sql,itemid);
    }

    @Override
    public Item getItemByItemId(String itemid) {
        String sql="select * from item where itemid=?";
        return get(sql,itemid);
    }

    @Override
    public List<Item> getItemByName(String name) {
        String sql="select * from item where name like?";
        name=("%"+name+"%").trim();
        return getForList(sql,name);
    }

    @Override
    public List<Item> getSearchItem(String itemName) {
        String sql="select name from item where name like ? ";
        itemName=("%"+itemName+"%").trim();
        System.out.print(itemName);
        return getForList(sql,itemName);
    }



}
