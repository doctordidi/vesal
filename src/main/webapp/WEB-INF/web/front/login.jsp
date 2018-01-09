<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/tag.jsp" %>
<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${baseurl}/public/images/favicon.ico">
    <title>维萨里展示网</title>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/login_front.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${baseurl}/public/js/front_Layui.js"></script>

</head>
<body>
<div class="htmleaf-container">
    <div id="logo">
        <a href="${baseurl}/page/index">
            <img id="img" src="${baseurl}/public/images/favicon.ico"/>
            <span id="title">维萨里展示网</span>
        </a>
    </div>
    <div class="wrapper">
        <div class="container">
            <h1 style="color: white;margin-bottom: 20px;">用户登录</h1>
            <form class="form">
                <input type="text" placeholder="用户名/手机号/邮箱" id="username">
                <input type="password" placeholder="密码" id="password">
                <button type="button" id="login-button">登录</button>
            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

<div class="footer navbar-fixed-bottom " style="  background: white;">
    <div class="copy_z">
        <div class="container" style="height: 50px;">
            <div class="left" style=" width: 100%; text-align: center;">
                <span class="co_zi">2017-2018 © Write by Eurasia ThoughtWorks Studio 版权所有</span>
            </div>
        </div>
    </div>
</div>
<script src="${baseurl}/public/js/jquery.min.js"></script>
<script>
    $('#login-button').click(function (event) {
        event.preventDefault();
        $('form').fadeOut(500);
        $('.wrapper').addClass('form-success');
        let username = $("#username").val();
        let password = $("#password").val();
        if (username == "" || password == "") {
            layer.msg("信息不能为空", {
                time: 1000
            }, function () {
                location.reload();
            });
        } else {
            $.post("${baseurl}/CustomLogin/login", {
                cName: username,
                cPassword: password
            }, function (data) {
                if (data.status == 0) {
                    location.href = "${baseurl}/page/index";
                } else {
                    layer.msg(data.msg, {
                        time: 1000
                    }, function () {
                        location.reload();
                    });
                }
            });
        }
    });
</script>

</body>
</html>