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
    <title>Cart</title>
    <%
        List<Orders> cart = (List<Orders>) request.getAttribute("cart");
        double listprice = 0;
        double totalValue = 0;
    %>
    <style type="text/css">
        table {
            border-color: #005e21;
            text-align: center;
        }
    </style>
    <script src="jquery-1.7.2.js"></script>
    <script type="text/javascript">

        function change(itemid, quatity, totalprice, listprice) {
            var quatityEl = document.getElementById(quatity);
            var totalPriceEl = document.getElementById(totalprice);
            totalPriceEl.value = parseFloat(quatityEl.value) * listprice;
            $.get("reviseOrder?orders.itemid=" + itemid + "&orders.quatity=" + quatityEl.value +
                    "&orders.totalprice=" + totalPriceEl.value,null, function (data, status, xObj) {
                $("#totalValue").html(data.totalValue);
            });
        }

        function pay(){
                $.get('orders_purchase?',null,function(data, status, xObj) {
                    alert('支付成功！');
                });
        }

    </script>

</head>
<body>
<table border="1">
    <tr>
        <td>Item ID</td>
        <td>Quatity</td>
        <td>Total Price</td>
        <td>Remove</td>
    </tr>
    <% for (Orders orders
            : cart
            ) {
    %>
    <tr id="<%=orders.getItemid()%>">
        <td><%=orders.getItemid()%>
        </td>
        <%listprice = orders.getTotalprice() / orders.getQuatity();%>
        <td><input id="<%=orders.getItemid()%>quatity" type="number" value="<%=orders.getQuatity()%>"
                   onblur="change('<%=orders.getItemid()%>','<%=orders.getItemid()%>quatity','<%=orders.getItemid()%>totalPrice',<%=listprice%>)">
        </td>
        <td><input id="<%=orders.getItemid()%>totalPrice" type="number" value="<%=orders.getTotalprice()%>"
                   disabled="disabled"></td>
        <td><span><a href="orders_deleteOrder?orders.itemid=<%=orders.getItemid()%>">Remove</a></span></td>
    </tr>
    <%}%>
</table>

<br/>
<span id="totalValue"><%=(Double) request.getAttribute("totalValue")%></span>
    <input type="button" value="付款" onclick="pay()" />
    <a  id="index" href="index.jsp"></a>
</body>
</html>
