package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.LogDAO;
import com.maxiaolong.jpetstore.domain.Log;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class LogDAOJdbcImpl extends DAO<Log> implements LogDAO {
    @Override
    public void saveLog(Log log) {
        String sql="insert into log(userid,date,time,dowhat)" +
                "values(?,?,?,?)";
        update(sql,log.getUerid(),log.getDate(),log.getTime(),log.getDowhat());
    }
}
