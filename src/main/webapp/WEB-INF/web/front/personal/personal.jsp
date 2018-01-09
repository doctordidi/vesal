<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人主页</title>
    <meta name="description">
    <meta name="keyword" content="个人中心">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <meta name="lx:category" content="group">
    <meta name="lx:cid" content="c_cejtmtex">
    <meta name="lx:appnm" content="mtpc">
    <meta name="lx:autopv" content="off">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/main_personal.css.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/userexinfo.css">
    <link rel="shortcut icon" href="${baseurl}/public/images/favicon.ico">


    <!-- include main css -->
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/style.css"/>
    <link href="${baseurl}/public/font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'
          media="all"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/animate.css"/>
    <script src="${baseurl}/public/js/jquery.min.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="../public/header.jsp"/>
<div class="page index" data-reactroot="">
    <div class="userexinfo-container">
        <div class="clearfix">
            <div style="float:left" >
                <div class="orders-link-box">
                    <div class="link-group"><p class="title"><a
                            href="#">个人主页</a></p>
                        <p class="title"><a href="#">我的订单</a></p>
                        <ul class="link-ul">
                            <li><a href="#">全部订单</a><i
                                    class="icon-right"></i></li>
                            <li><a href="#">待付款</a><i
                                    class="icon-right"></i></li>
                            <li><a href="#">退款/售后</a><i
                                    class="icon-right"></i></li>
                        </ul>
                    </div>

                    <div class="link-group"><p class="title"><a
                            href="#">个人信息</a>
                    </p>
                        <p class="title">
                            <a href="${baseurl}/page/subscriptions">我的订阅</a>
                        </p>
                        <ul class="link-ul">
                            <li><a href="#">账户设置</a><span
                                    class="num"></span><i class="icon-right"></i></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="userinfo-box">
                <div class="my-page">
                    <div class="user-info-box">
                        <div class="user-info">
                            <div class="head-img">
                                <img src="${baseurl}/public/images/head-img.jpg" alt=""></div>
                            <div class="nick-name"><a><p class="nick-name-txt" id="cName">用户名<i
                                    class="iconfont iconfont_level icon-lable_level_0"></i></p></a>
                                <p class="user-money">我的余额：￥0 ·
                                    <a href="#" target="_blank">个人用户</a>
                                </p></div>
                            <a href="#" target="_blank"
                               class="user-setting">个人信息设置 &gt;</a></div>
                        <div class="userfn-ls">
                            <ul class="userfn-ul clearfix">
                                <li><a href="${baseurl}/page/subscriptions">
                                    <i><img src="${baseurl}/public/images/subscribe.png" style="width: 40px"></i>
                                    <span>我的订阅</span></a>
                                </li>
                                <li><a href="#"><i
                                ><img src="${baseurl}/public/images/daiban.png"
                                      style="width: 40px"></i><span>全部订单</span></a></li>
                                <li><a href="#"><i
                                ><img src="${baseurl}/public/images/fukuan.png" style="width: 40px"></i><span>待付款</span></a>
                                </li>
                                <li><a href="#"><i
                                ><img src="${baseurl}/public/images/tuikuan.png"
                                      style="width: 40px"></i><span>退款/售后</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../public/footer.jsp"/>
<script>
    $(function () {
        $.post("${baseurl}/CustomLogin/session", function (data) {
            if (!data.haveSession) {
                location.href = "${baseurl}/page/frontLogin";
            } else {
                let cName = data.user.cName;
                $("#cName").html(cName);
            }
        });
    });
</script>
</body>