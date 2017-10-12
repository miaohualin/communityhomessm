<%--
  Created by IntelliJ IDEA.
  User: 黄宇航
  Date: 2017/10/12
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团之家登录</title>
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
            <div class="logo_box">
                <h3 style="color:#999;font-family:'幼圆'; font-size:30px">
                    社团之家欢迎您</h3>
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="logname" id="username" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="请输入用户名">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="logpass" id="password" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请输入密码">
                    </div>
                    <div class="mb2">
                        <!--<a class="act-but submit" href="javascript:;" style="color: #FFFFFF">登&nbsp;&nbsp;录</a>-->
                        <input class="act-but submit" type="submit" style="color: #FFFFFF" id="loginsubmit"
                               value="登&nbsp;&nbsp;&nbsp;&nbsp;录">
                        </input>
                    </div>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="js/TweenLite.min.js"></script>
<script src="js/EasePack.min.js"></script>
<script src="js/rAF.js"></script>
<script src="js/demo-1.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<div style="text-align:center;">
</div>
<script>
    $(document).on("click", "#loginsubmit", function (e) {
        $.ajax({
            data: "username=" + $("#username").val() + "&password=" + $("#password").val(),
            type: "post",
            url: "/checklogin",
            dataType: "json",
            error: function (data) {
                alert("出现异常，请稍后重试");
            },
            success: function (response) {
                if (response == "error") {
                    alert("出现异常，请稍后重试");
                    return false;
                } else if (response == "nouser") {
                    alert("用户名或密码错误");
                    return false;
                } else {
                    window.location.href = '/';
                    return true;
                }
            }
        })
    });
</script>
</body>
</html>