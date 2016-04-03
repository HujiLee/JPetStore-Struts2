package com.maxiaolong.jpetstore.db;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Created by maxiaolong on 2016/3/5.
 */
public class JdbcUtils {

    private static DataSource dataSource = null;

    static {
        dataSource = new ComboPooledDataSource("mvcapp" );
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    public static void releaseConnection(Connection connection) {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
