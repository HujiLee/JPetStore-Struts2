package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.Category;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/6.
 */
public interface CategoryDAO {
       List<Category> getAll();

       Category getCategoer(String catid);
}
