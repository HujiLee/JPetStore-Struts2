<%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/5
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Sign In - JpetStore</title>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="otherCSS/common-pages.css">
    <style type="text/css">
        body {
            text-align: center;
        }
    </style>

    <style type="text/css">


        #petbg {
            height: 100%;
            max-height: 475px;
            background-color: white;
            box-shadow: 0 0 27px 5px black;
            /*margin-top: 200px;*/

        }

        .login-form {
            opacity: 0.05;
            float: right;
            top: 20%;
            height: 50%;
            position: relative;
            /*background-color: rgba(180, 180, 180, 0.86);*/
            background-color: rgba(182, 132, 68, 0.43);
            padding: 20px 1%;
            min-height: 300px;
            right: 40px;
            border-radius: 10px;
            box-shadow: 0 0 13px 2px black;
            text-shadow: 1px 1px 2px white;

            transition: opacity 2s;
            -moz-transition: opacity 2s; /* Firefox 4 */
            -webkit-transition: opacity 2s; /* Safari 和 Chrome */
            -o-transition: opacity 2s; /* Opera */
        }

        .login-form tr {
            display: block;
            margin: 5px auto;

        }

        .login-form td {
            min-width: 80px;
        }

        .login-form tr td:first-of-type {
            width: 160px;
            color: white;
            text-shadow: 0 0 4px black;
        }

        .login-form a {
            color: #A3D4FF;
            text-decoration: none;
            text-shadow: 0 0 4px black;
        }

        #bg {
            position: relative;
            height: 475px;
            background-image: url('images/huji/log-in01.png');
        }

        #loginWarning {
            color: red;
            font-size: 2pt;
            opacity: 0.0;
        }

        form[action] {
            /*width: 50%;*/
            position: relative;
            /*right: -73px;*/
        }


    </style>
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <script src="jQuery/jquery.md5.js"></script>
    <script src="jQuery/jquery.sha1.js"></script>
    <script type="text/javascript">
        function verification() {
            var vrStr = $("#vr").val().toString();
            $.post("vr", {chknumber:vrStr}, function (data, status, xObj) {  //val()函数返回的是Jquery对象，
                // 他会根据具体的场景改变类型，但是这儿要用头String强制转换
                if (data.flag== "yes") {
                    $("#submit")[0].removeAttribute("disabled");
                } else {
                    //验证码输入错误
                }

            },"json");
        }
        function updateVR() {
            vrImg = $("#vrImg")[0];
            var time=new Date().getTime();
            vrImg.setAttribute('src', 'picture?abc='+time);
        }

    </script>

</head>
<body onclick="//showLogin();" onload="//updateVR();" style="
    height: 1000px;
">
<div class="header">
    <div class="w" style="
    width: 850px;
">
    </div>
</div>
<div id="nav-top" style="visibility: hidden;">
    <div class="w" style="width:1000px;">
        <nav class="nav">
        </nav>
    </div>
</div>
<div id="petbg" style="/*background: */;">
    <div class="w">
        <div id="bg">
            <div class="login-form">
                <form action="user_login" method="post" style="">
                    <table cellspacing="0" class="t_table" style="">
                        <tbody>
                        <tr>
                            <td><s:text name="username"></s:text></td>
                            <td><input name="user.userid" type="text" class="fixedWidthInput" placeholder="邮箱/用户名">
                            </td>
                        </tr>
                        <tr>
                            <td><s:text name="password"></s:text></td>
                            <td><input name="user.password" type="password" class="fixedWidthInput" .icgo></td>
                        </tr>
                        <tr>
                            <td><s:text name="vrcode"></s:text></td>
                            <td style="width: 200px;text-align: center;"><img src="picture" id="vrImg"
                                                                              style="width: 100%;cursor: pointer;"
                                                                              onclick="updateVR();"/></td>
                        </tr>
                        <tr>
                            <td><s:text name="input"></s:text></td>
                            <td style=""><input id="vr" class="fixedWidthInput" type="text" onblur="verification()"
                                                onkeydown="//if(event.keyCode==13){verification();}" oninput="verification();"></td>
                        </tr>
                        <tr>
                            <td><a href="userRegister.jsp"><s:text name="register"></s:text></a></td>
                            <td><input id="submit" type="submit"  value="<s:text name='signin'/>" disabled="disabled"
                                       class="fixedWidthInput"></td>
                        </tr>
                        </tbody>
                    </table>
                    <br>
                    <br>

                </form>
                <p id="loginWarning" class="warningMsg">
                    <!-- 用于显示登陆时的错误信息 -->
                    Warning!
                </p>

            </div>
            <script>
                function showLogin() {
                    form = $('div.login-form')[0];
                    form.style.opacity = '1.0';
                }
                showLogin();
            </script>
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
