package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.User;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/5.
 */
public interface UserDAO {

    void save(User user); //注册

    User get(String username,String password); //登陆得到User的全部信息

    List<User> getAll();

}
