<%@ page import="com.maxiaolong.jpetstore.domain.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="com.maxiaolong.jpetstore.dao.ItemDAO" %><%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/8
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart - JpetStore</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <script scr="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <%
        List<Orders> cart = (List<Orders>) request.getAttribute("cart");
        double listprice = 0;
        double totalValue = 0;
    %>

    <%--<script src="jquery-1.7.2.js"></script>--%>
    <script type="text/javascript">

        function change(itemid, quatity, totalprice, listprice) {
            var quatityEl = document.getElementById(quatity);
            var totalPriceEl = document.getElementById(totalprice);
            totalPriceEl.value = parseFloat(quatityEl.value) * listprice;
            $.get("reviseOrder?orders.itemid=" + itemid + "&orders.quatity=" + quatityEl.value +
                    "&orders.totalprice=" + totalPriceEl.value, null, function (data, status, xObj) {
                $("#totalValue").html(data.totalValue);
            });
        }

        function pay() {
            $.get('orders_purchase?', null, function (data, status, xObj) {
                alert('支付成功！');
            });
        }

    </script>
    <style type="text/css">
        table#cart-table {
            margin: 0 auto;
            width: 100%;
        }

        table#cart-table tr > * {
            border-style: dashed;
            padding: 2px 2px 5px 15px;
            border-bottom-width: 1px;
            border-top-width: 1px;
            border-left-color: transparent;
            border-right-color: transparent;
        }

        p#cart-title {
            border-bottom: 5px solid #B68444;
        }

        p#cart-title span {
        / / margin-left: 45 px;
            font-size: 30px;
        }

        .cart-center-pad {
            padding: 0 45px;
        }
        div#pay{
            display: flex;
            flex-direction: row;
            border-top: 5px solid #B68444;
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
    <p id="cart-title" class="cart-center-pad">
        <span>
            Cart
        </span>
    </p>
    <div class="cart-center-pad">
        <table id="cart-table">
            <theadN>
            <tr>
                <th>Item ID</th>
                <%--<th>Item name</th>--%>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Remove</th>
            </tr>
            </theadN>
            <tbody>
            <% for (Orders orders
                    : cart
                    ) {
            %>
            <tr id="<%=orders.getItemid()%>">
                <td><%=orders.getItemid()%>
                </td>
                <%listprice = orders.getTotalprice() / orders.getQuatity();%>
                <td><input id="<%=orders.getItemid()%>quatity" type="number" value="<%=orders.getQuatity()%>"
                           oninput="change('<%=orders.getItemid()%>','<%=orders.getItemid()%>quatity','<%=orders.getItemid()%>totalPrice',<%=listprice%>)">
                </td>
                <td><input id="<%=orders.getItemid()%>totalPrice" type="number" value="<%=orders.getTotalprice()%>"
                           disabled="disabled"></td>
                <td><span><a href="orders_deleteOrder?orders.itemid=<%=orders.getItemid()%>">Remove</a></span></td>
            </tr>
            <%}%>
            </tbody>


        </table>
    </div>

    <br>
    <div id="pay" class="cart-center-pad" >
        <div style="    flex-grow: 1;" style="visibility: hidden;">

        </div>
        <div style="">
            <span id="totalValue"><%=(Double) request.getAttribute("totalValue")%></span>
            <%--<input type="button" />--%>
            <button value="付款" onclick="pay()">Check Out</button>
            <a id="index" href="index.jsp"></a>
        </div>
    </div>






</div>


</body>
</html>
