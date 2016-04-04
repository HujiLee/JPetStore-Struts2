<%@ page import="java.util.List" %>
<%@ page import="com.maxiaolong.jpetstore.domain.Product" %>
<%@ page import="com.maxiaolong.jpetstore.domain.Category" %><%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/7
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Product - JpetStore</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <%
        List<Category> categoryList = (List<Category>) request.getSession().getAttribute("categoryInfo");
        List<Product> productList = (List<Product>) request.getAttribute("product");%>
    <script src="jquery-1.7.2.js"></script>
    <script>
        function getItem(productid) {
            $.post("getItemByProductId" ,{"product.productid": productid}, function (data) {
                $("#iteminf").empty();
                $('#iteminf')[0].appendChild(document.createElement('hr'));
                for (var i = 0; i < data.length; i++) {
                    var hrefStr = "product_getItemByItemId?item.itemid=" + data[i].itemid;
                    var itemid = data[i].itemid;
                    var desc = data[i].descn;
                    var imgLink = data[i].image;
                    var name = data[i].name;
                    var productid = data[i].productid;
                    var price =  data[i].listprice;

                    theA = document.createElement('a');
                    theA.innerHTML="<div productid itemid> <img><desc><p class=\"name\"></p><div></div></desc><price></price></div>";
                    theA.setAttribute('href',hrefStr);
                    $(theA).find('div[itemid]').attr('productid',productid);
                    $(theA).find('div[itemid]').attr('itemid',itemid);
                    $(theA).find('img').attr('src',imgLink);
                    $(theA).find('p')[0].innerHTML=name;
                    $(theA).find('desc').find('div')[0].innerHTML=desc;
                    $(theA).find('price')[0].innerHTML="$"+price;
                    $('#iteminf')[0].appendChild(theA);
                    $('#iteminf')[0].appendChild(document.createElement('hr'));

                    //alert(descn);
                    //var str = "<a >" + itemid + "</a>";
                    //$("#iteminf").append(str + "<br>");
                    //$("#iteminf > a:nth-of-type(" + (i + 1) + ")").attr("href", hrefStr);
                }
            });
        }
    </script>
    <style type="text/css">
        /*table {
            border-color: #005e21;
            text-align: center;
        }*/
    </style>
    <style type="text/css">
        #shopping-nav {
            height: 60px;
            width: 100%;
            display: inline-flex;
            flex-direction: row;
            position: absolute;
            left: 0;
        }

        #shopping-nav>div {
            display: flex;
            width: 990px;
            background-color: #B68444;
        }
        #shopping-nav>div>a{
            flex-grow: 1;
            text-decoration: none;
            display: block;
        }

        #shopping-nav a>div {
            background-color: rgb(182, 132, 68);
            color:white;
            text-align: center;
            padding-top: 10px;
            font-size: 30px;
            cursor: pointer;
            height: 100%;
        }
        #shopping-nav div:hover{
            background-color: wheat;
            color: #B68444;

        }
        #shopping-nav div[focus]{
            text-shadow: 0 0 7px #B68D86;
            background-color: wheat;
            color: #B68444;
            transition:  all 2s;
            -moz-transition:  all 2s; /* Firefox 4 */
            -webkit-transition:  all 2s; /* Safari 和 Chrome */
            -o-transition:  all 2s; /* Opera */

        }
        #shopping-nav div a{
            color:white;
        }
        #shopping-nav>p{
            flex-grow: 1;
            background-color: #B68444;
            margin: 0;
        }

        #shopping-nav div:nth-child(even) {
           /* background-color: rgba(19, 117, 139, 0.45);*/
        }

        .flex-row {
            display: inline-flex;
            flex-direction: row;
            width: 100%;
            background-color: white;
            //padding-left: 10px;
            margin-top: 60px;
        }

        #product-name {
            display: inline-flex;
            flex-direction: column;
            width: 200px;
            margin: 8px 0;
            border-top-color: #B68444;
            border-top-style: solid;
            border-top-width: 0px;
            background-image: linear-gradient(210deg ,#B68444 0%,transparent 87%,rgba(195, 40, 40, 0) 100%);        }
        #product-name a{
            text-decoration: none;
            display: block;
            //border-left: maroon groove 2px;
            transition:  background-color 1s;
            -moz-transition:  background-color 1s; /* Firefox 4 */
            -webkit-transition:  background-color 1s; /* Safari 和 Chrome */
            -o-transition:  background-color 1s; /* Opera */
        }
        #product-name a:nth-child(odd){
            background-color: rgba(255, 255, 255, 0.1);
        }
        #product-name a:nth-child(even){
            background-color: rgba(255, 255, 255, 0.2);
        }
        #product-name a:hover{
            //box-shadow: -5px 0px 6px 0.1px #B68;
            background-color: rgba(255, 255, 255, 0.51);
        }
        #product-name a[focus]{
            /*border-left-color: #B68444;
            border-left-width: thick;
            border-left-style: solid;*/
            background-color: white;
            box-shadow: -5px 0px 6px 0.1px #B68444;
        }
        #product-name a[focus] p{
            color: maroon;
            background-color: transparent;
        }

        #product-name div#shadow{
            //min-height: 50%;
            min-height: calc(50% + 140px );
            //background-image: linear-gradient(45deg ,transparent 0%,transparent 49%,#FF0080 50%,#FF0080 50%,transparent 25%);
        }
        #product-name p{
            margin: 0;
            height: 100px;
            font-size: 25px;
            text-align: left;
            padding: 35px 15px;
            color: #ffffff;
            font-weight: 700;
            text-shadow: 1px 1px 2px black;
        }
        #iteminf{
            flex-grow: 1;
            display: flex;
            flex-grow: 1;
            flex-direction: column;
            margin: 8px 0;
            padding-left: 10px;
        }
        #iteminf>a{
            display: block;
            height: 150px;
            width: 100%;
            text-decoration: none;
            margin: 5px 0px;
            padding: 0px 2px;
        }
        #iteminf>hr{
            border: 0;
            border-top: 1px solid rgba(182, 132, 68, 0.33);
            width: 100%;
            margin-top: 0;
            margin-bottom: 0;
        }
        #iteminf>a:hover{
            text-decoration: none;
            background-color: wheat;
        }
        div[productid][itemid]{
            width:100%;
            flex-direction: row;
            height: 100%;
            display: inline-flex;
        }
        div[productid][itemid]>img{
            width:150px;
        }
        /*div[productid][itemid]>p.name,*/div[productid][itemid]>desc,div[productid][itemid]>price{
            display: block;
        }
        /*div[productid][itemid]>p,*/div[productid][itemid]>price{
            //flex-grow: 1;
            width: 200px;
        }
        /*div[productid][itemid]>p{
            text-align: center;
            //padding-top: 59px;
            font-size: 15px;
            line-height: 140px;

        }*/
        div[productid][itemid]>price{
            font-size: 47px;
            line-height: 140px;
            color: #B6446D;

        }
        div[productid][itemid]>desc{
            flex-grow: 2;
            padding-top: 10px;
            font-style: italic;
            color: #6CC0ED;
            text-shadow: 1px 1px 0.5px rgba(0, 0, 0, 0.39);
            padding-left: 10px;
        }
        desc > p{
            font-style: normal;
            height: 30%;
            font-size: 25px;
            color: #B6446D;

        }
        div[itemid]>desc{
            border-right-color: rgba(182, 132, 68, 0.33);
            border-right-style: dotted;
            border-right-width: 1px;
        }



    </style>
    <script>
        function focusThisA(me){
            $('#product-name a').not(me).removeAttr('focus');
            $(me).attr('focus','on');
        }

    </script>
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
                    <a href="orders_makeOrder?purchase=1"></a>
                </li>

                <li id="user-icon"></li>
            </ul>
        </form>
    </div>
</div>
<div class="w" style="margin-top: 120px;">
    <nav id="shopping-nav">
        <p></p>
        <div style="display: flex;
    width: 990px;">
        <% for (int i = 0; i < categoryList.size(); i++) {%>
        <a href="product_getProductByCatId?product.catid=<%=categoryList.get(i).getCatid().trim()%>">
        <div name="<%=categoryList.get(i).getName()%>" onclick="//$(this).find('a').click();" cateid = "<%=i+1%>">
            <%=categoryList.get(i).getName()%>
        </div>

        </a>
        <% }%></div>
        <p></p>
        <script comment="focus">
            thisLoc = window.location.href;
            console.log(thisLoc);
            //thisLoc.lastIndexOf("catid=");
            cate_id = thisLoc.substr(thisLoc.lastIndexOf('catid=')+('catid=').length);
            console.log(cate_id);
            $('#shopping-nav div[cateid='+cate_id+']').attr('focus','on');

        </script>
    </nav>
    <div class="flex-row">
        <div id="product-name">

            <%
                for (Product product :
                        productList) {%>
            <a onclick="getItem('<%=product.getProductid()%>');focusThisA(this);">
                <p style="background-color: transparent">
                    <%=product.getName()%>
                </p>
            </a>

            <%
                }%>
            <script>
                //$('#product-name>a:first-of-type').attr('focus','on');
                $('#product-name>a:first-of-type').click();

            </script>
            <div id="shadow">

            </div>
        </div>
        <div id="iteminf">
            <a>
                <div productid itemid>
                    <img>
                    <p class="name">

                    </p>
                    <desc>

                    </desc>
                    <price>

                    </price>
                </div>
            </a>

        </div>

    </div>




</div>
<div id="copyright">
    <p>
        Copyright©2016 Jpet-store.Inc
    </p>
</div>
</body>
</html>
