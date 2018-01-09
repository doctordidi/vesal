<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人主页</title>
    <meta name="description">
    <meta name="keyword" content="个人中心">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/main_personal.css.css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/userexinfo.css">
    <link rel="stylesheet" href="${baseurl}/public/css/show_list.css">
    <link rel="stylesheet" href="${baseurl}/public/css/show_style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/jquery.mmenu.all.css"/>
    <link href="${baseurl}/public/font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'
          media="all"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/slick.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <script src="${baseurl}/public/js/jquery.min.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="../../public/header.jsp"/>
<div class="g-bd-list" id="j-freemarkerRender" style="">
    <div class="g-row">
        <div style="float:left;margin-top: 20px;">
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
        <!--商品展示区域-->
        <div id="j-goodsAreaWrap">
            <div class="m-goodsArea">
                <div class="m-sortbar">
                    <div class="category">
                        <div class="h2" style="text-align: center">我的订阅</div>
                    </div>
                </div>
                <div class="m-content">
                    <ul class="m-itemList f-margin-top-25" id="model">

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../public/footer.jsp"/>
<script type="text/javascript" src="${baseurl}/public/js/front_Layui.js"></script>
<script>
    $(function () {
        $.post("${baseurl}/CustomLogin/session", function (data) {
            if (!data.haveSession) {
                location.href = "${baseurl}/page/frontLogin";
            }
        });
    });

    $.post("${baseurl}/CustomLogin/personal", function (data) {
        let subscribe = data.customs;
        let _html = "";
        for (let i = 0; i < subscribe.length; i++) {
            let fileLong = subscribe[i].m_thumbnail;
            let file = ("${baseurl}/file/" + fileLong);
            let m_dynamic = subscribe[i].m_dynamic;
            let dynamic = ("${baseurl}/file/" + m_dynamic);
            _html += `<li class="item">
                            <div class="m-product j-product ">
                                <div class="hd">
                                    <a href="#" title="` + subscribe[i].m_name + `" target="_blank">
                                        <img src="` + file + `" alt="` + subscribe[i].m_name + `" class="img"
                                        onmouseover= "this.src='` + dynamic + `'" onmouseout="this.src='` + file + `'" ></a>
                                </div>
                                <div class="bd">
                                    <div class="prdtTags">
                                    <span class=" itemTag attribute" style="cursor:pointer">已订阅</span>
                                     <div class="itemTag ">最新</div>
                                     <span style="display: none">` + subscribe[i].m_id + `</span>
                                    </div>
                                    <h4 class="name">
                                        <a href="#" title="肝" target="_blank"><span>` + subscribe[i].m_name + `</span>
                                        </a>
                                    </h4>
                                    <p class="price">
                                        <!--<span style="color: gray">原价:¥<span></span>20</span>-->
                                        <span>  价格：¥</span><span>` + subscribe[i].m_price + `</span>
                                    </p>
                                    <div>
                                        <hr>
                                        <p class="desc">简介：<span>` + subscribe[i].m_introduce + `</span></p>
                                    </div>
                                </div>
                            </div>
                        </li>`;
        }
        $("#model").html(_html);
        $(".itemTag").click(function () {
            let hasclazz = $(this).hasClass("new");
            let thiz = $(this);
            let modelId = $(this).siblings('span').text();


            //判断是否有session
            $.post("${baseurl}/CustomLogin/session", function (data) {
                if (data.haveSession) {
                    let sWhether = 0;
                    let customId = data.user.cId;
                    if (hasclazz) {
                        thiz.text("已订阅").addClass("attribute").removeClass("new");
                        sWhether = 1;
                        layer.msg("订阅成功", {
                            time: 2000
                        });
                    } else {
                        thiz.text("+订阅").addClass("new").removeClass("attribute");
                        sWhether = 2;
                        layer.msg("取消订阅", {
                            time: 2000
                        });
                    }
                    $.post("${baseurl}/CustomLogin/Subscribe", {
                        sWhether: sWhether,
                        customId: customId,
                        modelId: modelId
                    }, function (data) {
                        location.reload();
                    });
                } else {
                    location.href = "${baseurl}/page/frontLogin";
                }
            });
        });
    });
</script>
</body>