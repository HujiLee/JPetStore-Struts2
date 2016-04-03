<%@ page import="com.maxiaolong.jpetstore.domain.Item" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/23
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>singleItem</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <%
        //        Item item= (Item) request.getAttribute("item");
        List<Item> itemList = (List<Item>) request.getAttribute("item");
    %>
    <!--<script src="jquery-1.7.2.js"></script>-->
    <script>
        function getItemInf(data) {
            alert(data);
            $.get("getItemInf.action?itemid=" + data.toString() + "&quatity=1", null, function (data) {
                alert(data);
            });
        }

        function addOrPurchase(itemid, quatity, addtocart, purchase) {
            var quatityEl = document.getElementById(quatity);
            var addtocartEl = document.getElementById(addtocart);
            var purchaseEl = document.getElementById(purchase);

            var addtocartElHref="orders_makeOrder?purchase=0&orders.quatity="+quatityEl.value+"&orders.itemid="+itemid.toString();
            var purchaseElHref="orders_makeOrder?purchase=1&orders.quatity="+quatityEl.value+"&orders.itemid="+itemid.toString();


            addtocartEl.setAttribute("href", addtocartElHref);
            purchaseEl.setAttribute("href", purchaseElHref);
        }

    </script>
    <style type="text/css">
        div[itemid][productid]{
            display: flex;
            width: 98%;
            margin: 0 auto;
            padding: 5px 10px;
           // background-color: beige;

        }
        div.w>hr{
            border-top: 1px solid #B68444;
        }
        div[itemid][productid]:hover{
            outline-color: rgba(255, 0, 0, 0.35);
            outline-offset: 5px;
            outline-style: dotted;
            outline-width: 2px;
            background-color: rgba(255, 0, 0, 0.05);
        }
        .photo—box{
            width: 200px;
            height: 200px;
        }
        .photo—box>img{
            width: 100%;
            height: 100%;
        }
        div.photo—box+h2{
            flex-grow: 1;
            font-style: italic;
            font-size: 17px;
            margin-left: 20px;
            text-shadow: 1px 1px 0.5px rgba(0, 0, 0, 0.39);
        }
        div.photo—box+h2 hr{
            border: 0;
            border-top: 1px solid rgba(182, 132, 68, 0.35);
            width: 80%;
            margin-top: 20px;
            margin-bottom: 5px;
            margin-left: 0%;
            box-shadow: 0 0 7px 0px rgb(182, 132, 68);
        }
        div.photo—box+h2 span{
            font-style: normal;
            font-size: 25px;
            color: #B6446D;
            font-weight: bold;
        }
        div.buy-it{
            width: 300px;
            display: block;
            font-size: 40px;
            color: #E42F4F;
        }
        div.buy-it input{

            width: 200px;
            font-size: 20px;
            width: 200px;
            box-shadow: 1px 1px 2px 1px #ADA59B inset;
            background-color: rgba(243, 229, 211, 0.3);
        }
        div.buy-it>p{
            font-size: 20px;
            color:rgb(138, 104, 66);
        }
        div.buy-it a>button{
            font-size: 25px;
            width: 200px;
            display: block;
        }
        div.buy-it a:hover{
            text-decoration: none;
        }

    </style>
</head>
<body>
<div class="header">
    <script src="OtherJs/header.js"></script>
    <div class="w" style="
    width: 850px;
">
        <form action="product_getItemBySearchName" method="post">
            <ul class="block-ul" style="
    margin: 50px 50px;
">
                <li><input id="search-input" name="item.name" type="text" autocomplete="off"
                           oninput="console.log('input');get_search_keywords();"
                           onblur="console.log('blur');hideKeyword();"
                           onfocus="showKeyword();">
                    <ul id="select-keyword" hide="yes">

                    </ul>


                </li>

                <li id="search-icon"><input type="submit" value=" " id="search-submit" style="    background-color: rgba(0,0,0,0);
    box-shadow: none;opacity: 0;"></li>
                <li id="cart-icon" onclick="$(this).find('a')[0].click();">
                    <a href="orders_makeOrder?purchase=-1&orders.itemid="></a>
                </li>

                <li id="user-icon"></li>
            </ul>
        </form>
    </div>
</div>
<div class="w" style="margin-top: 120px;">
    <hr style="margin-top: 10px;visibility: hidden;">
    <%for (Item item : itemList) {%>
    <div itemid="<%=item.getItemid()%>" productid="<%=item.getProductid()%>">

        <div class="photo—box">
            <img src="<%=item.getImage()%>" onerror="">
        </div>
        <h2>
            <span>
                <%=item.getName()%>
            </span>
            <hr>
            <%=item.getDescn()%>
        </h2>
        <div class="buy-it">
            $<%=item.getListprice()%><br>
            <P>
                Qty:<br><input id="<%=item.getItemid()%>+quatity" type="number" min="0"
                               value="1" onblur="addOrPurchase
                    ('<%=item.getItemid()%>','<%=item.getItemid()%>+quatity','<%=item.getItemid()%>+addToCart','<%=item.getItemid()%>+purchase')">
            </P>
            <%--<img id="<%=item.getItemid()%>+img" src="images\banner_birds.gif"><br>--%>
            <a id="<%=item.getItemid()%>+addToCart"
               href="orders_makeOrder?purchase=0&orders.quatity=1&orders.itemid=<%=item.getItemid()%>"><button
                    style="">AddToCart!</button></a>

            <%--<button id="<%=item.getItemid()%>+purchase"
               href="makeOrder.done?purchase=1&quatity=1&itemid=<%=item.getItemid()%>"><span
                    style="">Purchase</span></button>--%>
        </div>


    </div>
    <hr>
    <%--<img id="<%=item.getItemid()%>+img" src="images\banner_birds.gif" onmouseover="--%>
    <%--getItemInf('<%=item.getItemid()%>')"><br>--%>

    <%--<a id="<%=item.getItemid()%>+addToCart" href="makeOrder.done?purchase=0&quatity=5&itemid=<%=item.getItemid()%>" ><span--%>
    <%--style="background-color: #005e21">Purchase</span></a>--%>
    <%--<a id="<%=item.getItemid()%>+purchase" href="makeOrder.done?purchase=1&quatity=5&itemid=<%=item.getItemid()%>" ><span--%>
    <%--style="background-color: #005e21"  >Purchase</span></a><hr>--%>


    <%}%>
</div>
<div id="copyright">
    <p>
        Copyright©2016 Jpet-store.Inc
    </p>
</div>
</body>
</html>
