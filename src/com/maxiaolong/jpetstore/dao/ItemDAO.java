package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.Item;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public interface ItemDAO {
    List<Item> getAll(String productid);
    Double getListprice(String itemid);
    Item getItemByItemId(String itemid);
    List<Item> getItemByName(String name);
    List<Item> getSearchItem(String name);

}
