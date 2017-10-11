<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>社团之家注册</title>
    <link rel="stylesheet" type="text/css" href="css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="css/component.css"/>
    <!--[if IE]>

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
                <h3 style="color:#999;font-family:'幼圆'; font-size:30px">欢迎加入社团之家</h3>

                <form action="javascript:docheck()" name="reg" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="name" id="name" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="请输入用户名" autocomplete="off">
                    </div>

                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="pass" id="pass" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请输入密码" autocomplete="off">
                    </div>

                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="repass" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请确认密码" autocomplete="off">
                    </div>
                    <div class="input_outer">
                        <span class="university"></span>
                        <input name="university" id="university" class="text" style="color: #FFFFFF !important"
                               type="text"
                               placeholder="请输入学校" autocomplete="off">
                    </div>
                    <div class="input_outer">
                        <span class="email"></span>
                        <input name="email" id="email" class="text" style="color: #FFFFFF !important" type="text"
                               placeholder="请输入邮箱" autocomplete="off">
                    </div>

                    <div class="input_outer">
                        <span class="checkcode"></span>
                        <input name="checkcode" id="checkcode" class="text" style="color: #FFFFFF !important"
                               type="text"
                               placeholder="请输入验证码" autocomplete="off">
                    </div>
                    <div class="mb2">
                        <button type="button" class="act-but submit" id="sendemail" style="color: #FFFFFF">获&nbsp;&nbsp;取&nbsp;&nbsp;验&nbsp;&nbsp;证&nbsp;&nbsp;码</button>

                        <!--<input class="act-but submit" type="button" style="color: #FFFFFF" id="sendemail"
                               value="获&nbsp;&nbsp;取&nbsp;&nbsp;验&nbsp;&nbsp;证&nbsp;&nbsp;码">
                        </input>-->
                    </div>

                    <div class="mb2">
                        <!--<a class="act-but submit" href="javascript:;" style="color: #FFFFFF">登&nbsp;&nbsp;录</a>-->
                        <input class="act-but submit" type="submit" style="color: #FFFFFF" id="register"
                               value="注&nbsp;&nbsp;&nbsp;&nbsp;册">
                        </input>
                        <!--<a class="act-but submit" href="javascript:;" style="color: #FFFFFF">登&nbsp;&nbsp;录</a>-->
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
<script src="js/html5.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
    var wait = 60;
    var $sendeamil = $("#sendemail");

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
        if (!(username.length <= 10 && username.length >= 4)) {
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
            alert("请填写用户名");
            return false;
        }
        else if (!(IsValid() && IsUValid())) {
            alert("用户名请使用4-10位字母和数字");
            return false;
        }
        else if (reg.pass.value == "") {
            alert("请填写密码");
            return false;
        }
        else if (!IsPValid()) {
            alert("请填入以字母开头的6-18位密码");
            return false;
        }
        else if (reg.pass.value != reg.repass.value) {
            alert("两次密码不一致");
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

        return true;
    }

    function time() {
        if (wait == 0) {
            $sendeamil.removeAttr("disabled");
            $sendeamil.text("获  取  验  证  码");
            wait = 60;
        } else {
            $sendeamil.text("获  取  验  证  码(" + wait-- + ")");
            setTimeout(function () {
                time()
            }, 1000);
        }
    }

    function checkregister() {
        $.ajax({
            data: "username=" + $("#name").val() + "&password=" + $("#pass").val()
            + "&email=" + $("#email").val() + "&university=" + $("#university").val()
            + "&usercode=" + $("#checkcode").val(),
            type: "post",
            url: "/checkregister",
            dataType: "json",
            error: function (data) {
                alert("出现异常，请稍后重试");
            },
            success: function (response) {
                if (response == "pageerror" || response == "nocodeerror") {
                    alert("请求错误，请稍候重试");
                    return false;
                } else if (response == "codeerror") {
                    alert("验证码错误");
                    return false;
                } else if (response == "exist") {
                    alert("该用户名已被注册");
                    return false;
                } else {
                    alert("注册成功");
                    window.location.href = '/login';
                    return true;
                }
            }
        });
    }

    function sendemail() {
        $.ajax({
            data: "email=" + $("#email").val(),
            type: "post",
            url: "/sendemail",
            dataType: "json",
            error: function (data) {
                alert("出现异常，请稍后重试");
            },
            success: function (response) {
                if (response == "error") {
                    alert("发送验证码失败，请稍后重试");
                    return false;
                } else if (response == "exist") {
                    $alert("该邮箱已被注册");
                    return false;
                } else {
                    $sendeamil.attr("disabled", true);
                    alert("发送成功，请登录邮箱查看验证码");
                    time();

                    return true;
                }
            }
        });
    }

    $(document).on("click", "#sendemail", function (e) {
        if (docheck()) {
        sendemail();
        }
    });

    $(document).on("click", "#register", function (e) {
        if (docheck()) {
            if (reg.checkcode.value == "") {
                alert("请输入验证码");
                return false;
            }else{
                checkregister();
            }
        }
    });
</script>
<div style="text-align:center;">
</div>
</body>
</html>
