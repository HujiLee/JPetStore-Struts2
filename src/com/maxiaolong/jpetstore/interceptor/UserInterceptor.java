package com.maxiaolong.jpetstore.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class UserInterceptor implements Interceptor {
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        if(ActionContext.getContext().getSession().get("userinfo")==null) {
            System.out.println("nouser");
            return "nouser";
        }
        else{
            actionInvocation.invoke();
            System.out.println("haveuser");
            return null;
        }
    }
}