package com.maxiaolong.jpetstore.action;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class VRAction extends ActionSupport implements SessionAware,ServletResponseAware {

    private Map<String,Object> session;
    private HttpServletResponse httpServletResponse;
    private String chknumber;
    private Map<String,String> result;

    public Map<String, String> getResult() {
        return result;
    }

    public void setResult(Map<String, String> result) {
        this.result = result;
    }

    public String getChknumber() {
        return chknumber;
    }

    public void setChknumber(String chknumber) {
        this.chknumber = chknumber;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.httpServletResponse=httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
      this.session=map;
    }

    public Color getColor() {
        int red=(int)(Math.random()*1000%256);
        int green=(int)(Math.random()*1000%256);
        int blue=(int)(Math.random()*1000%256);
        return new Color(red,green,blue);
    }

    public String img() throws Exception{
        int width = 120;
        int height = 30;

        //创建一张内存中的缓存图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        ///背景色
        //通过graphics绘制图像
        Graphics graphics = bufferedImage.getGraphics();
        //设置颜色
        graphics.setColor(Color.yellow);
        //填充
        graphics.fillRect(0, 0, width, height);

        ///画边框
        graphics.setColor(Color.blue);
        graphics.drawRect(0, 0, width - 1, height - 1);

        //写字母
        String content = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcedfghijklmnopqrstuvwxyz1234567890";
        Random random = new Random();
        //设置字体颜色
        graphics.setColor(Color.red);


        String vrStr="";  //null和空字符串有很大的区别
        //设置字体及大小
        graphics.setFont(new Font("宋体", Font.BOLD, 20));
        int x = 20;
        int y = 20;
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(content.length());
            char letter = content.charAt(index);
            vrStr+=letter;
            graphics.drawString(letter + " ", x, y);
            x = x + 20;
        }

        session.put("vrCode",vrStr);

        //绘制干扰线
        int x1;
        int x2;
        int y1;
        int y2;
        graphics.setColor(Color.LIGHT_GRAY);
        for (int i = 0; i < 10; i++) {
            x1 = random.nextInt(width);
            x2 = random.nextInt(width);
            y1 = random.nextInt(height);
            y2 = random.nextInt(height);
            graphics.drawLine(x1, y1, x2, y2);
        }

        //将图片输出到浏览器
        //将内存的图片通过浏览器输出流输出成jpg图片
        ImageIO.write(bufferedImage, "jpg", httpServletResponse.getOutputStream());
        return null;
    }

    public String vr() throws Exception {
        result=new HashMap<String, String>();
        if (((String)session.get("vrCode")).toLowerCase().equals(chknumber.toLowerCase())) {
            result.put("flag","yes");
        } else {
            result.put("flag","no");
        }
        return SUCCESS;
    }


}
