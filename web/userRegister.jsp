<%--
  Created by IntelliJ IDEA.
  User: maxiaolong
  Date: 2016/3/5
  Time: 22:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script type="text/javascript">

       function checkName(){
            var name= $("#name").val();

            if(name.length==0){
                $('#user_msg')[0].innerHTML='Username can not be empty!!'
            }
            else if(name.includes(' ')){
                $('#user_msg')[0].innerHTML='Username should never include space!!'
            }
            else{
                $.post("checkName",{"user.userid":name},function(data){
                    if(data.flag=="used"){
                        //alert("this name is used");
                        $('#user_msg')[0].innerHTML='This name is being used!!'
                    }else{
                        //alert("this name is available");
                        $('#user_msg')[0].innerHTML='Available username.√'
                    }
                },"json");
            }

        }


        function chkPhone() {
            var phone = document.getElementById("phone").value;
            if (phone == "") {
                document.getElementById("phone_msg").innerHTML = "Phone Number can not be empty!!";
                return;
            }
            if (11 == phone.toString().length)
                document.getElementById("phone_msg").innerHTML = "Correct.√";
            else
                document.getElementById("phone_msg").innerHTML="Wrong phone number!Only phone number with 8 digits accepted!!";

        }

                function checkEmail(){
                    var email= $("#email").val();
                    //alert(email);
                    var pattern =/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
                    /* /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                    /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;*/

                    var checkFlag=pattern.test(email);
                    if(!checkFlag){
                        //alert("email format is wrong");
                        $('#email_msg')[0].innerHTML='Invalid email.Please check it again!!';
                        console.log("Invalid");

                    }else{
                        $.get("checkEmail",{"user.email":email},function(data){
                            if(data.flag=="used"){
                               // alert("this email is used");
                               $('#email_msg')[0].innerHTML='This email address is being used!!';
                                console.log("Used");

                            }
                            else{
                                $('#email_msg')[0].innerHTML='Valid email address.√';
                                console.log('OK');
                            }
                        });
                    }

                }

        function checkPwd(){
            inputs = $('#first-step').find('input[type=password]');
            if(inputs[0].value!=inputs[1].value){
                $('#password_msg')[0].innerHTML='Mismatched passwords!!';

            }
            else{
                $('#password_msg')[0].innerHTML='Matched passwords.√';
            }

        }

    </script>
    <link rel="SHORTCUT ICON" href="images/huji/JpetIcon.ico">
    <link rel="BOOKMARK" href="images/huji/JpetIcon.ico">
    <title>Registration - JpetStore</title>
    <style type="text/css">
        body {
            text-align: center;
        }
        .form-register div{
            width: 650px;
            background-color: bisque;
            margin: auto;
            margin-bottom: 20px;
            padding: 20px;
            box-shadow: 0 0 56px 2px bisque;
            border-radius: 5px;
            display: block;
        }
        .form-register p{
            position: relative;
            text-align: left;
            left: 0;
            float: left;
        }
        .form-register span{
            float: right;
        }
        .form-register span:before{
            content: "-----";
            visibility: hidden;
        }

        .form-register input,.form-register button{
            width: 100%;
            color: #B68444;
            margin-bottom: 10px;
        }
        #first-step{
            display: none;
        }
        #second-step{
            display: none;
        }
        .form-register [id$='step']{
            transition: display 2s;
            -moz-transition: display 2s; /* Firefox 4 */
            -webkit-transition: display 2s; /* Safari 和 Chrome */
            -o-transition: display 2s; /* Opera */

        }
        .form-register [id$='step'] p{
            color: white;
            text-shadow: 0 0 4px black;
        }

        table#names{
            width: 100%;
        }
        /*
        table#names td input{
            width: calc(100% - 8px);
        }*/
    </style>
    <link rel="stylesheet" type="text/css" href="otherCSS/common-pages.css">
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.6-dist/css/bootstrap.min.css">
    <script src="jQuery/jquery-1.9.1.min.js"></script>
    <script src="jQuery/jquery.md5.js"></script>
    <script src="jQuery/jquery.sha1.js"></script>
</head>
<body onload="$('#first-step').fadeIn();">
<div class="header">


</div>

<div id="nav-top" style="visibility: hidden;">
    <div class="w" style="width:1000px;">
        <nav class="nav">
            <li>DOG</li>
            <li>CAT</li>
            <li>BIRD</li>
            <li>FISH</li>
            <li>REPTILE</li>
        </nav>
    </div>
</div>




<form action="user_register" method="post" class="form-register" >
    <div id="first-step">
        <P>Username<span class="warningMsg" id="user_msg"> </span></P>
        <input name="user.userid" type="text" id="name" onblur="checkName();"><br/>
        <P>Password<span class="warningMsg"> </span></P><input name="user.password" type="password" repeat="0"><br/>
        <P>Repeat Password<span class="warningMsg" id="password_msg"> </span></P><input name="password" type="password" repeat="1"><br/>
        <!--<button onclick="$('#first-step').fadeOut();$('#second-step').fadeIn();">Next</button>-->
        <input type="button" value="Next" onclick="$('#first-step').fadeOut();$('#second-step').fadeIn();"><br/>
    </div>
    <div id="second-step">
        <P>Phone Number<span class="warningMsg" id="phone_msg"> </span></P><input name="user.phone" id="phone" type="text" onblur="chkPhone()"><br/>

        <P>E-mail<span class="warningMsg" id="email_msg"> </span></P><input name="user.email" id="email" type="text" onblur="checkEmail()"><br/>

        <table style="width: 100%;" id="names">
            <tbody>
            <tr>
                <td><P>Firstname</P><br><input name="user.firstname" type="text"><br/></td>
                <td style="width: 9px;"></td>
                <td><P>Lastname</P><br><input name="user.lastname" type="text"><br/></td>
            </tr>
            </tbody>
        </table>


        <p>Address</p><input name="user.address" type="text"><br/>
        <P>Zipcode<span class="warningMsg"> </span></P><input name="user.zip" type="text"><br/>

        <input type="submit" value="Creat My Account" style="color: red;"><br/>
    </div>



    <%--city:<input name="city" type="text"><br/>--%>
    <%--country:<select name="country" id="country">--%>
    <%--<option value="1">China</option>--%>
    <%--<option value="2">American</option>--%>
    <%--</select><br/>--%>
    <%--city:<select name="city" id="city">--%>
    <%--</select><r/>--%>
    <%--state:<select name="state" id="state">--%>
    <!--address:
    <select  name="address">
        <optgroup label="China">
            <option value="Hunan">Hunan</option>
            <option value="Hubei">Hubei</option>
        </optgroup>
        <optgroup label="American">
            <option value="dev">dev</option>
            <option value="Qll">Qll</option>
        </optgroup>
    </select>-->
    <br/>

    <%--country:<input name="country" type="text"><br/>--%>


</form>

<div id="copyright">
    <p>
        Copyright©2016 Jpet-store.Inc
    </p>
</div>
</body>
</html>
