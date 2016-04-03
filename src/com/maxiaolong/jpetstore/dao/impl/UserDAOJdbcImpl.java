package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.UserDAO;
import com.maxiaolong.jpetstore.domain.User;

import java.util.List;

/**
 * Created by maxiaolong on 2016/3/5.
 */
public class UserDAOJdbcImpl extends DAO<User> implements UserDAO {

    @Override
    public void save(User user) {
        String sql = "insert into user(userid,password,phone,email,firstname,lastname,address,zip)" +
                "values(?,?,?,?,?,?,?,?)";
        update(sql, user.getUserid(), user.getPassword(), user.getPhone(), user.getEmail(), user.getFirstname(), user.getLastname(), user.getAddress(),  user.getZip());
    }

    @Override
    public User get(String username, String password) {
        String sql = "select * from user where userid=? and password =?";
        return get(sql, username, password);
    }

    @Override
    public List<User> getAll() {
        String sql = "select * from user";
        return getForList(sql);
    }
}
