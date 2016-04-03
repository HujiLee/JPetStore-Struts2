package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.Product;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/7.
 */
public interface ProductDAO {

    List<Product> getAll(String catid);

}
