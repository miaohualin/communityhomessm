<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息完善与修改</title>
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
         function checkPhone() {
             var phone = document.getElementById('phone').value;
             if (!(/^1[34578]\d{9}$/.test(phone))) {
                 return false;
             }
             return true;
         }
        function chkEmail(str) {
            return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/) == 0 ? true : false;
        }
        //验证注册规范
        function docheck() {
            if (reg.Rname.value == "") {
                alert("请填写真实姓名");
                return false;
            }

            else if (reg.hobby.value == "") {
                alert("请填写兴趣爱好");
                return false;
            }
            else if(reg.schoolnum.value==""){
                alert("请填写学号");
                return false;
            }
            else if (reg.phone.value == "") {
                alert("请填写手机号码");
                return false;
            }
            else if (!checkPhone(reg.phone.value)) {
                alert("请填写有效的手机号码");
                return false;
            }

            else if(reg.major.value==""){
                alert("请填写专业");
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
                <h3 style="color:#999;font-family:'幼圆'; font-size:30px">个人资料完善与修改</h3>

                <form action="javascript:docheck()" name="reg" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="Rname" id="Rname" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="真实姓名">
                    </div>

                    <div class="input_outer">
                        <span class="university"></span>
                        <input name="hobby" id="hobby" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="兴趣爱好">
                    </div>

                    <div class="input_outer">
                        <span class="introduce"></span>
                        <input name="schoolnum" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="学号">
                    </div>

                    <div class="input_outer">
                        <span class="email"></span>
                        <input name="phone" id="phone" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="手机号码">
                    </div>
                    <div class="input_outer">
                        <span class="type"></span>
                        <input name="major" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="专业">
                    </div>
                    <div class="mb2">

                        <input class="act-but submit" type="button" style="color: #FFFFFF"
                               value="确&nbsp;&nbsp;定" onclick="send(this)">
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
