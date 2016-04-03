package com.maxiaolong.jpetstore.action;

import com.maxiaolong.jpetstore.dao.CategoryDAO;
import com.maxiaolong.jpetstore.dao.UserDAO;
import com.maxiaolong.jpetstore.dao.impl.CategoryDAOJdbcImpl;
import com.maxiaolong.jpetstore.dao.impl.UserDAOJdbcImpl;
import com.maxiaolong.jpetstore.domain.Category;
import com.maxiaolong.jpetstore.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.json.annotations.JSON;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class UserAction extends ActionSupport {
    private User user;
    private UserDAO userDAO;
    private CategoryDAO categoryDAO;
//    private LogDAO logDAO;
    private Map<String,String> map;

    public UserAction() {
        this.userDAO = new UserDAOJdbcImpl();
        this.categoryDAO=new CategoryDAOJdbcImpl();
//        this.logDAO=new LogDAOJdbcImpl();
    }
    @JSON(serialize=false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

    public String login() throws Exception{
        User myuser=null;
        if ((myuser = userDAO.get(user.getUserid(),user.getPassword())) != null) {
            List<Category> categoryList=categoryDAO.getAll();
            ActionContext.getContext().getSession().put("userinfo",myuser);
            ActionContext.getContext().getSession().put("categoryInfo",categoryList);
            String dowhat="登陆";
            ActionContext.getContext().getSession().put("dowhat",dowhat);
            return "index";
        }
        return null;
    }


    public String register() throws Exception{
        userDAO.save(user);
        List<Category> categoryList=categoryDAO.getAll();
        ActionContext.getContext().getSession().put("userinfo",user);
        ActionContext.getContext().getSession().put("categoryInfo",categoryList);
        String dowhat="注册";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "index";
    }

    public String checkName() throws Exception{
        List<User> userList=userDAO.getAll();
        map=new HashMap<String, String>();
        for (User user:userList){
            if(user.getUserid().equals(this.user.getUserid())){
                map.put("flag","used");
                return "used";
            }
        }
        map.put("flag","unused");
        return "unused";
    }

    public String checkEmail() throws Exception{
        List<User> userList=userDAO.getAll();
        map=new HashMap<String, String>();
        for (User user:userList){
            if(user.getEmail().equals(this.user.getEmail())){
                map.put("flag","used");
                return "used";
            }
        }
        map.put("flag","unused");
        return "unused";
    }


}

