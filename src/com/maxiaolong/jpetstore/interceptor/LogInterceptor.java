package com.maxiaolong.jpetstore.interceptor;

import com.maxiaolong.jpetstore.dao.LogDAO;
import com.maxiaolong.jpetstore.dao.impl.LogDAOJdbcImpl;
import com.maxiaolong.jpetstore.domain.Log;
import com.maxiaolong.jpetstore.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class LogInterceptor implements Interceptor {

    private LogDAO logDAO;
    @Override
    public void destroy() {

    }

    @Override
    public void init() {
        logDAO=new LogDAOJdbcImpl();
    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        String actionName=actionInvocation.getInvocationContext().getName();
        String result=actionInvocation.invoke();
        String userid=((User) ActionContext.getContext().getSession().get("userinfo")).getUserid();
        String dowhat= (String) ActionContext.getContext().getSession().get("dowhat");
        if(dowhat!=null) {
            Log log = new Log(userid, dowhat);
            logDAO.saveLog(log);
        }
        return null;
    }
}
