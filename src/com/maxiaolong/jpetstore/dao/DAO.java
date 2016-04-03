package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.db.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
//import org.apache.tomcat.util.net.SSLHostConfig;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by maxiaolong on 2016/3/5.
 */

//采取dbutils解决方案
public class DAO<T> {

    private Class<T> clazz;
    private QueryRunner queryRunner=new QueryRunner();

    public DAO() {
        Type superClass=getClass().getGenericSuperclass();  //子类class得到泛型class
        if(superClass instanceof ParameterizedType){
            ParameterizedType parameterizedType=(ParameterizedType)superClass;
            Type[] args= parameterizedType.getActualTypeArguments();
            if(args!=null||args.length>0){
                clazz=(Class<T>) args[0];  //反射的视频
            }
        }
    }

    //封装save、insert、delete方法
    public void update(String sql,Object ...args){
        Connection connection=null;
        try {
            connection=JdbcUtils.getConnection();
            queryRunner.update(connection,sql,args);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.releaseConnection(connection);
        }

    }

    //返回T
    public T get(String sql,Object ...args){
        Connection connection=null;
        try {
            connection=JdbcUtils.getConnection();
            return queryRunner.query(connection,sql,new BeanHandler<T>(clazz),args);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.releaseConnection(connection);
        }
        return null;
    }

   //返回T对应的List
    public List<T> getForList(String sql,Object ...args){
        Connection connection=null;
        try {
            connection=JdbcUtils.getConnection();
            return  queryRunner.query(connection,sql,new BeanListHandler<T>(clazz),args);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.releaseConnection(connection);
        }
        return null;
    }

    //返回某一个值
    public <E> E getForValue(String sql,Object ...args){
        Connection connection=null;
        try {
            connection=JdbcUtils.getConnection();
            return (E) queryRunner.query(connection,sql,new ScalarHandler(),args);
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            JdbcUtils.releaseConnection(connection);
        }
        return null;
    }

}
