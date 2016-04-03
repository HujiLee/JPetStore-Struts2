<%@ page import="com.maxiaolong.jpetstore.dao.CategoryDAO" %>
<%@ page import="com.maxiaolong.jpetstore.dao.impl.CategoryDAOJdbcImpl" %>
<%@ page import="java.util.List" %>
<%@ page
        import="com.maxiaolong.jpetstore.domain.Category" %>
<%@ page
        import="com.maxiaolong.jpetstore.domain.User" %><%--<%@ page import="com.maxiaolong.jpetstore.domain.User" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index - JpetStore</title>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <script type="text/javascript" src="jquery-1.7.2.js"></script>
    <%  List<Category> categoryList = (List<Category>) request.getSession().getAttribute("categoryInfo");
        User user = (User) session.getAttribute("userinfo");
        System.out.println(user);
    %>
    <style type="text/css">
        #center-featured {
            margin-top: 120px;
        }

        #index-column {
            width: 100%;
            /*max-width: 1000px;*/
            height: 100%;
            max-height: 800px;
            background-color: white;
        }

        td {
            /*border: solid 5px rgba(119, 31, 31, 0.59);*/
            margin: 1px 2px;
            display: block;
            /*border-radius: 5px;*/
            box-shadow: -5px 0 5px -5px white, /*左边阴影*/ 0 -5px 5px -5px blue, /*顶部阴影*/ 0 5px 5px -5px , /*底部阴影*/ 5px 0 5px -5px black;
        }

        #index-column td {
            width: 20%;
            cursor: pointer;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;


            transition: width 2s, background-color 2s;
            -moz-transition: width 2s, background-color 2s; /* Firefox 4 */
            -webkit-transition: width 2s, background-color 2s; /* Safari 和 Chrome */
            -o-transition: width 2s, background-color 2s; /* Opera */
        }

        #index-column td:hover {
            /*width: 60%;*/
            /*background-color: #2aabd2 !important;*/
        }

        #index-column td a {
            color: white;
            font-size: 172px;
            text-shadow: 0 0 25px white;
            margin-left: 20px;
            text-decoration: none;
            display: inline-block;
            /*z-index: 0;*/

            transition: width 2s, background-color 2s;
            -moz-transition: width 2s, background-color 2s; /* Firefox 4 */
            -webkit-transition: width 2s, background-color 2s; /* Safari 和 Chrome */
            -o-transition: width 2s, background-color 2s; /* Opera */

        }

        #index-column td a span:nth-child(2) {
            /*font-size: 225px;
            position: fixed;
            right: 100%;
            background-color: black;*/
            width: auto;
            /*float: left;*/
            /*display: none;*/
            /*z-index: -5;*/
            /*font-size: 10px;*/
        }

        #index-column td a span:nth-child(1) {
            width: auto;
            /*float: left;*/
        }

    </style>
    <style type="text/css" id="column-color">


        #index-column #Fish {
            background-color: rgba(0, 109, 240, 0.2);
            background-image: url(images/svg/fish-color.svg);
            background-position: 0% 50%;
            background-size: 100% auto;
            background-repeat: no-repeat;
        }

        #index-column #Dogs {
            background-color: rgba(255, 128, 0, 0.2);
            background-image: url(images/svg/dog-color.svg);
            background-position: 0% 50%;
            background-size: 100% auto;
            background-repeat: no-repeat;
        }

        #index-column #Cats {
            background-color: rgba(128, 128, 1920, 0.2);
            background-image: url(images/svg/cat-color.svg);
            background-position: 0% 50%;
            background-size: 100% auto;
            background-repeat: no-repeat;
        }

        #index-column #Reptiles {
            background-color: rgba(0, 170, 43, 0.2);
            background-image: url(images/svg/reptile-color.svg);
            background-position: 0% 50%;
            background-size: 100% auto;
            background-repeat: no-repeat;
        }

        #index-column #Birds {
            background-color: rgba(0255, 0, 128, 0.2);
            background-image: url(images/svg/bird-color.svg);
            background-position: 0% 50%;
            background-size: 100% auto;
            background-repeat: no-repeat;
        }






        #index-column #Fish:hover {
            background-color: rgba(0, 109, 240, 1.0);
            background-image: url(images/svg/fish-white.svg);
        }

        #index-column #Dogs:hover {
            background-color: rgba(255, 128, 0, 1.0);
            background-image: url(images/svg/dog-white.svg);
        }

        #index-column #Cats:hover {
            background-color: rgba(128, 128, 1920, 1.0);
            background-image: url(images/svg/cat-white.svg);
        }

        #index-column #Reptiles:hover {
            background-color: rgba(0, 170, 43, 1.0);
            background-image: url(images/svg/reptile-white.svg);
        }

        #index-column #Birds:hover {
            background-color: rgba(0255, 0, 128, 1.0);
            background-image: url(images/svg/bird-white.svg);
        }
    </style>
    <script comment="define column color">
        var BKCOLORS = {
            'Fish': {
                'R': '0', 'G': '109', 'B': '240'
            },
            'Dogs': {
                'R': '255', 'G': '128', 'B': '0'
            },
            'Cats': {
                'R': '128', 'G': '128', 'B': '192'
            },
            'Reptiles': {
                'R': '0', 'G': '170', 'B': '43'
            },
            'Birds': {
                'R': '255', 'G': '0', 'B': '128'
            }
        }

        function overTd(me) {
            //console.log('over-'+me.id);
            //console.log('over');


            //console.log(sp1[0]);
            //.log(sp2[0]);


            /*
             var contn= $(me).attr('counthide');
             var countCirclr=0;
             while(contn=='0'&&countCirclr<1000)
             {
             if((td.width()-sp1.width())>sp2.width())
             {
             sp2.fadeIn();
             $(me).attr('counthide','1');
             contn=$(me).attr('counthide');

             }
             countCirclr++;

             }
             if(countCirclr>=1000){
             sp2.fadeIn();
             }*/
            //循环太费钱


            //$('#hide-'+me.id).fadeIn();
            // $('#hide-'+me.id).css('font-size','inherit');
            //return;

        }

        /*
         $(function () {
         $('#index-column').find('td').mouseenter(function () {
         console.log(this);
         //counti = $(me).attr('counthide');
         $('#' + this.id).css('width', '40%');
         others = $('#index-column td').not('#' + this.id);
         others.css('width', '15%');

         td = $(this);
         sp1 = $(this).find('span:nth-child(1)');
         sp2 = $(this).find('span:nth-child(2)');
         sp2.fadeIn();
         }
         )
         })*/
        //上面这个绑定好像有失效的时候


        function inTd(me) {
            /*
             counti = $(me).attr('counthide');
             if(counti=='0'){*/
            $('#' + me.id).css('width', '40%');
            others = $('#index-column td').not('#' + me.id);
            others.css('width', '15%');

            /*td = $(me);
             sp1 = $(me).find('span:nth-child(1)');
             sp2 = $(me).find('span:nth-child(2)');
             sp2.fadeIn();
             $(me).attr('counthide','1');
             }
             else{
             return;
             }*/


        }
        function clickTd(me) {
            //console.log('clock-'+me.id);
            //$('#'+me.id).children()[0].click();//必须确保里面只有一个<a> 否则失效= =
            $('#' + me.id).find('a')[0].click();
        }
        function outTd(me) {
            /*
             counti = $(me).attr('counthide');
             if(counti=='1') {*/
            $('#index-column td').css('width', '');
            $('#hide-' + me.id).css('display', 'none');
            /*$(me).attr('counthide', '0');
             }*/
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
                    <a href="orders_makeOrder?purchase=-1&orders.itemid="></a>
                </li>

                <li id="user-icon"></li>
            </ul>
        </form>

    </div>
</div>
<div id="center-featured" class="text-center">
    <div class="w" style="width:100%;min-width: 940px;">
        <table id="index-column">
            <tbody>
            <tr>
                <% for (int i = 0; i < categoryList.size(); i++) {%>
                <td style="/*width: 20%;*/"
                    onclick="/*console.log('clock-'+this.id);$('#'+this.id).children()[0].click();*/clickTd(this); "
                    onmouseover="inTd(this);"
                    onmouseout="outTd(this);" id="<%=categoryList.get(i).getName()%>" counthide="0">
                    <div>
                        <a href="product_getProductByCatId?product.catid=<%=categoryList.get(i).getCatid().trim()%>"
                           name="<%=categoryList.get(i).getName()%>">
                            <%--
                            <span><font><%=categoryList.get(i).getName().charAt(0)%></font><span
                                    id="hide-<%=categoryList.get(i).getName()%>"><%=categoryList.get(i).getName().substring(1)%></span></span>--%>


                        </a>

                    </div>

                </td>

                <% }%>
            </tr>
            </tbody>
        </table>

    </div>
</div>
<div id="copyright">
    <p>
        Copyright©2016 Jpet-store.Inc
    </p>
</div>
</body>
</html>
