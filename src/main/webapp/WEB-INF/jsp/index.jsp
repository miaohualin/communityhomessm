<%--
  Created by IntelliJ IDEA.
  User: 黄宇航
  Date: 2017/10/12
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>新しい社團の家</title>
    <link rel="stylesheet" href="css/bootstrap-theme.css" />
    <link rel="stylesheet" href="css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <script type="text/javascript" src="js/bootstrap.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="js/npm.js" ></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css" />
</head>
<body style="background-color: #D3D1CE;">
<div class="page" style="background-image:url(img/timg.gif);">
    <div class="navbar navbar-default" role="navigation" style="border: none;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#" style="color: #2AABD2;">社团の家</a>
            </div>
            <div>
                <ul class="nav navbar-nav" id="list">
                    <li class="actives"><a href="#">社团</a></li>
                    <li><a href="#">活动</a></li>
                    <li><a href="#">兼职</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            校内
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu" id="dropdownlist">
                            <li><a href="#">XXXX</a></li>
                            <li><a href="#">XXXX</a></li>
                            <li><a href="#">XXXX</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <form class="navbar-form navbar-left" role="search" id="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索从这里开始……">
                </div>
                <button type="submit" class="btn btn-info">提交</button>
            </form>
        </div>
    </div>

    <div class="container">
        <img src="img/logo.png" style="height:80px">
        <span><a href="#">科技竞赛</a></span>
        <span><a href="#">学长辅学</a></span>
        <span><a href="#">社团招新</a></span>
        <span><a href="#">社团联合</a></span>
        <span class="dz"><a target="_blank" onclick="javascrtpt:window.location.href='${indexurl}'">${indexmsg} </a></span>
    </div>
    <div class="detail">
        <h1>新しい社團の家</h1>
        <h3>版权所有：东北大学软件学院百亿项目组 技术支持：CSDN</h3>
        <br />
        <a href="#" class="btn btn-info" data-toggle="modal" data-target="#myModal">Read More</a>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modalh4">Orgnization Zone</h4>
                        <img src="img/s5.jpg" alt="XX" class="img-responsive">
                        <h5 class="modalh5">NEU-CSDN</h5>
                        <p style="color: #000000;">CSDN_全球最大中文IT社区，为IT专业技术人员提供最全面的信息传播和服务平台
                            提供包含媒体平台、顾问咨询的完整营销解决方案广告服务(平面广告/网络广告)精准定位IT专业人员，以专业的视角报道专业内容、传播专业知识，是IT企业进行市场宣传的最佳专业合作伙伴。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br /><br /><br /><br />
<div class="row" style="width: 90%; ">
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/csdn.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <h3>CSDN社团</h3>
                <p>全球最大中文IT社区，为IT专业技术人员提供最全面的信息传播和服务平台</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">
                        进入社团
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/csdn.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <h3>缩略图标签</h3>
                <p>全球最大中文IT社区，为IT专业技术人员提供最全面的信息传播和服务平台</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">
                        进入社团
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/csdn.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <h3>缩略图标签</h3>
                <p>全球最大中文IT社区，为IT专业技术人员提供最全面的信息传播和服务平台</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">
                        进入社团
                    </a>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-6 col-md-3">
        <div class="thumbnail">
            <img src="img/csdn.jpg"
                 alt="通用的占位符缩略图">
            <div class="caption">
                <h3>缩略图标签</h3>
                <p>全球最大中文IT社区，为IT专业技术人员提供最全面的信息传播和服务平台</p>
                <p>
                    <a href="#" class="btn btn-primary" role="button">
                        进入社团
                    </a>
                </p>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <!--<div class="footer_logo"><img src="img/codeispoetry.png">-->
    <!--网页尾部，五个链接仿别的网站，计划书中没有，听取大家意见，进行调整-->
    <div class="top">
        <a href="#" target=_blank>网站地图</a> |
        <a href="#" target=_blank>网站申明</a> |
        <a href="#" target=_blank>联系我们</a> |
        <a href="#" target=_blank>使用帮助</a> |
        <a href="#" target=_blank>主编邮箱</a>
    </div>
    <div class="middle">
        主办：东北大学软件学院&nbsp;&nbsp;&nbsp;&nbsp;
        承办：百亿项目组
    </div>
    <div class="foot">
        邮箱：394691285@qq.com　辽ICP备064068804　辽公网安备 71898202708132号
    </div>
    <img src="img/codeispoetry.png">
</div>


</body>
</html>
