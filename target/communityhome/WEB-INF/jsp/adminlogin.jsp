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
        <form action="checkadmin" method="post">
            <table>
                <tr>
                    <div class="input">
                        <span class="username"></span>
                        <input type="text" class="text" name="username" placeholder="  username"
                               autocomplete="off"/>
                    </div>
                </tr>
                <tr>
                    <div class="input">
                        <span class="password"></span>
                        <input type="password" class="text" name="password" placeholder="  password"/>
                    </div>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                         <input type="submit"  value="Log In" style="width:130px;height:30px"/>
                        <!-- class="button"-->
                    </td>
                </tr>
            </table>
        </form>
    </div>
</center>
</body>
</html>