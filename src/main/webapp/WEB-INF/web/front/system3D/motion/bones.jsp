<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>维萨里产品展示网</title>
    <meta name="keywords" content="维萨里产品展示网">
    <meta name="description" content="维萨里产品展示网">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
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
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/r29/html5.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .glyphicon {
            height: 20px;
        }

        .cs {
            color: rgb(240, 173, 78);;
        }
    </style>
</head>
<body>

<div>
    <jsp:include page="../../public/header.jsp"/>

    <div class="comon_top">
        <div class="top_title">
            <div class="hh1">骨学</div>
            <div class="hh2">骨学是研究人体骨（bone）的解剖的科学，与关节学、肌学共同构成了运动系统系统解剖学。</div>
            <div class="hh3">
            </div>
        </div>
        <div class="top_nav_er clearfix">
            <ul>
                <li><a>系统3D</a>
                <li>
                <li><a href="">全部</a></li>
                <li><a href="">分类</a></li>
                <li><a href="">分类</a></li>
            </ul>
        </div>
    </div>
    <div class="case_nei">
        <ul class="clearfix" id="model">
        </ul>
        <%--<section class="pageing">--%>
            <%--<a href="">«</a>--%>
            <%--<a href="">‹</a>--%>
            <%--<a href="javascript:;" class="active">1</a>--%>
            <%--<a href="">2</a>--%>
            <%--<a href="">3</a>--%>
            <%--<a href="">4</a>--%>
            <%--<a href="">5</a>--%>
            <%--<a href="">6</a>--%>
            <%--<a href="">7</a>--%>
            <%--<a href="">8</a>--%>
            <%--<a href="">9</a>--%>
            <%--<a href="">10</a>--%>
            <%--<a href="">›</a>--%>
            <%--<a href="">»</a>--%>
        <%--</section>--%>

    </div>
    <jsp:include page="../../public/footer.jsp"/>

</div>

<!--Include Js-->
<script src="http://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<!--移动端导航-->
<script src="${baseurl}/public/js/jquery.mmenu.all.min.js" type="text/javascript" charset="utf-8"></script>
<!--slick-->
<script src="${baseurl}/public/js/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${baseurl}/public/js/wow.js" type="text/javascript" charset="utf-8"></script>

<!--placeholder-->
<script src="${baseurl}/public/js/jquery.placeholder.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
        let value = ("${param.id}".split(".jsp")[0]).split("-");
        $.post("${baseurl}/systemDisplay/systemInfo", {
            oneLevel: value[0],
            secondLevel: value[1],
            threeLevel: value[2]
        }, function (data) {
            let subscribe = data.info;
            let _html = "";

            for (let i = 0; i < subscribe.length; i++) {
                let fileLong = subscribe[i].m_thumbnail;
                let file = "/file" + fileLong;
                let m_dynamic = subscribe[i].m_dynamic;
                let dynamic = "/file" + m_dynamic;
                console.log(file)
                _html += `   <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}` + file + `" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}` + dynamic + `">
                </div>
                <div class="product_name">
                    <span class="h4">` + subscribe[i].m_name + `</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:` + subscribe[i].m_price + `元</button>
                    </div>
                    <div class="subscribe btn-group" role="group">
                        <span style="display: none">` + subscribe[i].m_id + `</span>`;

                if (subscribe[i].s_whether == 1) {
                    _html += `<input type="button" class="btn btn-warning aaa"  value="已订阅" />`;
                } else {
                    _html += `<input type="button" class="btn btn-default aaa"  value="订阅" />`;
                }
                _html += `</div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>`;
            }
            $("#model").html(_html);
            $(".subscribe input").click(function () {
                let hasclazz = $(this).hasClass("btn-default");
                let thiz = $(this);
                let modelId = $(this).siblings('span').text();

                //判断是否有session
                $.post("${baseurl}/CustomLogin/session", function (data) {
                    if (data.haveSession) {
                        let sWhether = 0;
                        let customId = data.user.cId;
                        if (hasclazz) {
                            thiz.val("已订阅").addClass("btn-warning").removeClass("btn-default");
                            sWhether = 1;
                        } else {
                            thiz.val("订阅").addClass("btn-default").removeClass("btn-warning");
                            sWhether = 2;
                        }
                        $.post("${baseurl}/CustomLogin/Subscribe", {
                            sWhether: sWhether,
                            customId: customId,
                            modelId: modelId
                        }, function (data) {

                        });
                    } else {
                        location.href = "${baseurl}/page/frontLogin";
                    }
                });
            });
        });
    });
</script>
<script src="${baseurl}/public/js/public.js" type="text/javascript" charset="utf-8"></script>
<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
</body>
</html>
