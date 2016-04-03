package com.maxiaolong.jpetstore.action;

import com.maxiaolong.jpetstore.dao.ItemDAO;
import com.maxiaolong.jpetstore.dao.ProductDAO;
import com.maxiaolong.jpetstore.dao.impl.ItemDAOJdbcImpl;
import com.maxiaolong.jpetstore.dao.impl.ProductDAOJdbcImpl;
import com.maxiaolong.jpetstore.domain.Item;
import com.maxiaolong.jpetstore.domain.Product;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class ProductAction  extends ActionSupport {

    private Product product;
    private Item item;
    private List<Item> itemList;
    private ProductDAO productDAO;
    private ItemDAO itemDAO;

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public ProductAction() {
        productDAO=new ProductDAOJdbcImpl();
        itemDAO=new ItemDAOJdbcImpl();
    }

    public String getProductByCatId() throws  Exception{
        List<Product> productList = productDAO.getAll(product.getCatid());
        ((Map) ActionContext.getContext().get("request")).put("product",productList);
        String dowhat="搜索categorytid="+product.getCatid()+"的product";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "catid_success";
    }

    public String getItemByProductId() throws Exception{
        itemList = itemDAO.getAll(product.getProductid());
        String dowhat="搜索productid="+product.getProductid()+"的item";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "success";
    }

    public String getItemByItemId() throws Exception{
        Item myitem=itemDAO.getItemByItemId(item.getItemid());
        List<Item> itemList=new ArrayList<Item>();
        itemList.add(myitem);
        ((Map)ActionContext.getContext().get("request")).put("item",itemList);
        String dowhat="搜索itemtid="+item.getItemid()+"的item的详细信息";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "itemid_success";
    }

    public String getItemBySearchName() throws Exception{
        List <Item> myitemList=itemDAO.getItemByName(item.getName());
        ((Map)ActionContext.getContext().get("request")).put("item",myitemList);
        String dowhat="搜索输入的内容="+item.getName()+"的item的详细信息";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "itemid_success";
    }

    public String searchItem() throws Exception{
        itemList= itemDAO.getSearchItem(item.getName());
        return "success";
    }
    //searchItem修改成传的是json数组
}
