package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.ProductDAO;
import com.maxiaolong.jpetstore.domain.Product;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public class ProductDAOJdbcImpl extends DAO<Product> implements ProductDAO {
    @Override
    public List<Product> getAll(String catid) {
        String sql="select * from product where catid=?";
        return getForList(sql,catid);
    }
}
