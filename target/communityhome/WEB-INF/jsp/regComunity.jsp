<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册社团</title>
    <c:if test="${requestScope.nameExist==\"yes\" }">
        <script>alert("名字已存在")</script>
    </c:if>
    <c:if test="${requestScope.CreateSuccessful==\"yes\" }">
        <script>
            alert("社团正在审核之中，你可以在个人中心中查看");
            window.open("PersonPage", "_parent");
        </script>
    </c:if>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script>
        function send(o) {
            $.ajax({
//                type: "GET",
//                url: "SendEmail",
                type: "#",
                url: "#",
                data: {
//                    "email": $("#email").val()
                },
                dataType: "json",
                success: function (data) {
                    if (!data) {
//                        alert("邮箱已被注册");
//                        o.value = "请求验证码";
                    } else if (data.toString() == "senderror") {
//                        alert("邮件发送失败，请稍后重试");
//                        o.value = "请求验证码";
                    } else if (data) {
//                        alert("验证码发送成功，请注意查看邮箱");
//                        time(o)
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("发生错误，请联系网站管理员");
                }
            });
        }
        function IsDigit(cCheck) {
            return (('0' <= cCheck) && (cCheck <= '9'));
        }

        function IsAlpha(cCheck) {
            return ((('a' <= cCheck) && (cCheck <= 'z')) || (('A' <= cCheck) && (cCheck <= 'Z')));
        }

        function IsValid() {
            var struserName = reg.name.value;
            for (nIndex = 0; nIndex < struserName.length; nIndex++) {
                cCheck = struserName.charAt(nIndex);
                if (!(IsDigit(cCheck) || IsAlpha(cCheck))) {
                    return false;
                }
            }
            return true;
        }
        function IsUValid() {
            var username = document.getElementById('name').value;
            if (!(username.length<=10&&username.length>=4)) {
                return false;
            }
            return true;
        }
        function IsPValid() {
            var password = document.getElementById('pass').value;
            if (!(/^[a-zA-Z]\w{5,17}$/.test(password))) {
                return false;
            }
            return true;
        }

        function chkEmail(str) {
            return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/) == 0 ? true : false;
        }
        //验证注册规范
        function docheck() {
            if (reg.name.value == "") {
                alert("请填写社团名称");
                return false;
            }

            else if (reg.university.value == "") {
                alert("请填写大学");
                return false;
            }
            else if (reg.email.value == "") {
                alert("请填写邮箱地址");
                return false;
            }
            else if (!chkEmail(reg.email.value)) {
                alert("请填写有效的邮箱地址");
                return false;
            }
            else if(reg.introduce.value==""){
                alert("请填写社团简介");
                return false;
            }
            else if(reg.type.value==""){
                alert("请填写社团类型");
                return false;
            } else {
//                异步提交
                <%--var xmlhttp = new XMLHttpRequest();--%>

                <%--xmlhttp.onreadystatechange=function()--%>
                <%--{--%>
                <%--if (xmlhttp.readyState == 4 && xmlhttp.status == 200)--%>
                <%--{--%>
                <%--if (xmlhttp.responseText == "code error"){--%>
                <%--alert("验证码不正确,请重新输入");--%>
                <%--}else if (xmlhttp.responseText == "user exist"){--%>
                <%--alert("用户名已存在");--%>
                <%--}else if (xmlhttp.responseText == "email exist"){--%>
                <%--alert("该邮箱已被注册");--%>
                <%--}else if (xmlhttp.responseText == "done"){--%>
                <%--window.open("index", "_parent")--%>
                <%--}else{--%>
                <%--alert("服务器出现未知故障");--%>
                <%--}--%>
                <%--}--%>
                <%--}--%>

                <%--var username= document.forms["reg"]["UserName"].value;--%>
                <%--var password = document.forms["reg"]["UserPassword"].value;--%>
                <%--var email = document.forms["reg"]["Email"].value;--%>
                <%--var university = document.forms["reg"]["University"].value;--%>
                <%--var code = document.forms["reg"]["checkCode"].value;--%>
                <%--var emailcode = <%=emailcode%>;--%>

                <%--xmlhttp.open("POST","RegisterServlet",true);--%>
                <%--xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");--%>
                <%--xmlhttp.send("username=" + username + "&password=" + password + "&email=" + email--%>
                <%--+ "&university=" + university + "&code=" + code + "&emailcode=" + emailcode);--%>
            }
        }
    </script>
    <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="css/component.css"/>
    <!--[if IE]>
    <script src="js/html5.js"></script>
    <![endif]-->
    <style>
        .button {
            width: 220px;
            height: 40px;
            background: #06F;
            border-radius: 5px;
            left: 0px;
            right: 0px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="regist_box">
                <h3 style="color:#999;font-family:'幼圆'; font-size:30px">社团注册</h3>

                <form action="javascript:docheck()" name="reg" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="name" id="name" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="社团名称">
                    </div>

                    <div class="input_outer">
                        <span class="university"></span>
                        <input name="university" id="university" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="学校">
                    </div>

                    <div class="input_outer">
                        <span class="email"></span>
                        <input name="email" id="email" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="邮箱">
                    </div>

                    <div class="input_outer">
                        <span class="introduce"></span>
                        <input name="introduce" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="社团简介">
                    </div>
                    <div class="input_outer">
                        <span class="type"></span>
                        <input name="type" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="社团类型">
                    </div>
                    <div class="picture">
                        <input style="margin-top:5px;" id="img" name="img"
                               onchange="previewImage(this,5)" type="file"/>
                        <div id="preview5" style="margin-left:150px; clear:both; padding-top:-15px;">
                            <img src="" alt="" id="imghead5" width="83" height="83" />
                        </div>
                    </div>
                    <div class="mb2">

                        <input class="act-but submit" type="button" style="color: #FFFFFF"
                               value="提&nbsp;&nbsp;交&nbsp;&nbsp;审&nbsp;&nbsp;核" onclick="send(this)">
                        </input>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="js/TweenLite.min.js"></script>
<script src="js/EasePack.min.js"></script>
<script src="js/rAF.js"></script>
<script src="js/demo-1.js"></script>
<div style="text-align:center;">
</div>
</body>
</html>
