package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.CategoryDAO;
import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.domain.Category;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/6.
 */
public class CategoryDAOJdbcImpl extends DAO<Category> implements CategoryDAO{
    @Override

    public List<Category> getAll() {
        String sql="select * from category";
        return getForList(sql);
    }

    @Override
    public Category getCategoer(String catid) {
        String sql="select from category where catid= ?";
        return get(sql,"1");
    }

}
