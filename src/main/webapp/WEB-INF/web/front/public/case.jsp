<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../public/tag.jsp" %>
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
    <link href="${baseurl}/public/font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' media="all"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/animate.css"/>
    <script src="${baseurl}/public/js/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/r29/html5.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div>
    <jsp:include page="../public/header.jsp"/>
    <div class="crumbs">
        <div class="centerBlock">您当前的位置：<a href="${baseurl}/front/home/index.jsp">首页 </a> > <span>系统3D</span></div>
    </div>
    <div class="comon_top">
        <div class="top_title">
            <div class="hh1">系统3D</div>
            <div class="hh2">3D显示人体系统结构，包括骨骼、肌肉、脏器、循环、神经等结构</div>
            <div class="hh3">
            </div>
        </div>
        <%--<div class="top_nav">--%>
        <%--<a href=""><span>色 系</span></a><a href=""><span>风 格</span></a><a href="" class="active"><span>分 类</span></a>--%>
        <%--</div>--%>
        <div class="top_nav_er clearfix">
            <ul>
                <li><a >系统3D</a><li>
                <li><a href="">全部</a></li>
                <li><a href="">分类</a></li>
                <li><a href="">分类</a></li>
            </ul>
        </div>
    </div>
    <div class="case_nei">
        <ul class="clearfix">
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/鼻骨.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/BiGu.gif">
                </div>
                <div class="product_name">
                    <span class="h4">鼻骨</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/大腿后肌群.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/DaTuiHouJiQun.gif">
                </div>
                <div class="product_name">
                    <span class="h4">大腿后肌群</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/腹直肌和腹直肌鞘.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/FuZhiJiHeFuZhiJiQiao.gif">
                </div>
                <div class="product_name">
                    <span class="h4">腹直肌和腹直肌鞘</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/肩肌群.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/JianJIQun.gif">
                </div>
                <div class="product_name">
                    <span class="h4">肩肌群</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/咀嚼肌.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/JuJueJi.gif">
                </div>
                <div class="product_name">
                    <span class="h4">咀嚼肌</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/颅骨整体.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/LuGu.gif">
                </div>
                <div class="product_name">
                    <span class="h4">颅骨整体</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/前臂后肌群.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/QianBiHouJiQun.gif">
                </div>
                <div class="product_name">
                    <span class="h4">前臂后肌群</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>
            <li>
                <div class="pic">
                    <a href="#">
                        <img src="${baseurl}/public/organ/小腿肌.png" alt=""/>
                        <i></i>
                    </a>
                </div>
                <div class="txt">
                    <img src="${baseurl}/public/gif/XiaoTuiJi.gif">
                </div>
                <div class="product_name">
                    <span class="h4">小腿肌</span><br><span class="h5"></span><span class="h5">订阅量：333</span>
                </div>
                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default">价格:20元</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-warning">
                            <span class="glyphicon glyphicon-star-empty" aria-hidden="true">已订阅</span>
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-danger">购买</button>
                    </div>
                </div>
            </li>


        </ul>
        <section class="pageing">
            <a href="">«</a>
            <a href="">‹</a>
            <a href="javascript:;" class="active">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">6</a>
            <a href="">7</a>
            <a href="">8</a>
            <a href="">9</a>
            <a href="">10</a>
            <a href="">›</a>
            <a href="">»</a>
        </section>

    </div>
    <jsp:include page="../public/footer.jsp"/>

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
    });
</script>
<script src="${baseurl}/public/js/public.js" type="text/javascript" charset="utf-8"></script>
<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->

</body>
</html>
