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
    <link href="${baseurl}/public/font-awesome-4.5.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'
          media="all"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/animate.css"/>
    <script src="${baseurl}/public/js/jquery.min.js"></script>
    <!--[if lt IE 9]>
    <script src="http://apps.bdimg.com/libs/html5shiv/r29/html5.min.js"></script>
    <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div>
    <!--header-->
    <jsp:include page="../public/header.jsp"/>
    <div class="comon_top">
        <div class="top_title">
            <div class="hh1">关于我们</div>
            <div class="hh2">励志于通过现代化的数字技术（AR/VR/MR）促进数字解剖在中国的普遍应用</div>
            <div class="hh3">公司使命：运用现代信息技术支持医学教育领域的“数组化革命”，打造中国数字化医学教育第一品牌</div>
        </div>
        <div class="top_nav">
            <a href="about_fuwu.html" class="active"><span>公司简介</span></a>
        </div>
    </div>
    <%--<div class="about_con">--%>
        <%--<div class="ahout_1">西安维萨里数字科技有限责任公司</div>--%>
        <%--<p>--%>
            <%--西安维萨里数字科技有限责任公司。西安维萨里数字科技有限责任公司位于西安市长安区韦曲街办兴龙花园5幢312室交--%>
            <%--通便利。西安维萨里数字科技有限责任公司本着“客户第一，诚信至上”的原则，欢迎国内外企业/公司/机构与--%>
            <%--本单位建立长期的合作关系。热诚欢迎各界朋友前来参观、考察、洽谈业务。--%>
        <%--</p>--%>
        <%--<p>--%>
            <%--地址：西安市长安区韦曲街办兴龙花园5幢312室<br>--%>
            <%--联系：任志宏<br>--%>
            <%--电话：029-82693955<br>--%>
        <%--</p>--%>
    <%--</div>--%>
    <div class="about_img">
        <img style="height: auto;width: 1000px;margin-top: 0px;margin-bottom: 0px;"
             src="${baseurl}/public/images/about2.png" alt="" class="vcenter"/>
    </div>
    <div class="about_img">
        <img style="height: auto;width: 1000px;margin-top: 0px;margin-bottom: 0px;"
             src="${baseurl}/public/images/about1.png" alt="" class="vcenter"/>
    </div>
    <div class="about_img">
        <img style="height: auto;width: 1000px;margin-top: 0px;margin-bottom: 0px;"
             src="${baseurl}/public/images/about3.png" alt="" class="vcenter"/>
    </div>

    <%--底部--%>
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
<script src="${baseurl}/public/js/../../public.js" type="text/javascript" charset="utf-8"></script>
<!--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->

</body>
</html>
