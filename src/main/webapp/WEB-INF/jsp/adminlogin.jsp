<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<canvas id="canvas" width="100" height="100"></canvas>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/53148/perlin.js"></script>

<script src="js/index.js"></script>
<center>
    <div class="login">
        <h3>请登录账号</h3>
        <form>
            <table>
                <tr>
                    <div class="input">
                        <span class="username"></span>
                        <input type="text" class="text" name="username" id="username" placeholder="  username"
                               autocomplete="off"/>
                    </div>
                </tr>
                <tr>
                    <div class="input">
                        <span class="password"></span>
                        <input type="password" class="text" name="password" id="password" placeholder="  password"/>
                    </div>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                         <input type="submit"  value="Log In" style="width:130px;height:30px" id="login"/>
                        <!-- class="button"-->
                    </td>
                </tr>
            </table>
        </form>
    </div>
</center>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
    $(document).on("click", "#login", function (e) {
        $.ajax({
            data: "username=" + $("#username").val() + "&password=" + $("#password").val(),
            type: "post",
            url: "/checkadmin",
            dataType: "json",
            error: function (data) {
                alert("出现异常，请稍后重试");
            },
            success: function (response) {
                if (response == "error") {
                    alert("用户名或密码错误");
                    return false;
                } else {
                    window.location.href = '/admin';
                    return true;
                }
            }
        });
    });
</script>
</body>
</html>