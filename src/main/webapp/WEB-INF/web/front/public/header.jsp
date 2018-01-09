<%@ page import="com.thoughtWorks.entity.Custom" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../public/tag.jsp" %>
<style type="text/css">
    #menuli li a {
        color: black;
        text-decoration: none;
        margin: 0px;
        padding-top: 8px;
        display: block; /* 作为一个块 */
    }

    #menuli li a:hover {
        background-color: #0099CC;
        color: white;
    }

    /*#menuli li .clearA a:hover {*/
        /*background-color: white;*/
        /*color: black;*/
    /*}*/
</style>
<header class="header">
    <div class="container clearfix navbar navbar-default navbar-fixed-top" style="background-color: white">
        <div class="logo">
            <a href="${baseurl}/page/index">
                <img src="${baseurl}/public/images/logo.png" alt=""/>
                <span style="margin-left: 5px ;color: #096d96 " class="h4">维萨里产品展示网</span></a>
        </div>
        <div class="nav_right">
            <nav>
                <ul class="clearfix " id="menuli">
                    <li><a href="${baseurl}/page/index">首页</a></li>
                    <span id="menuModel">
                    </span>
                    <li><a href="${baseurl}/page/handDrawing">手绘分享</a></li>
                    <li><a href="#">软件下载</a></li>
                    <li><a href="${baseurl}/page/about">关于我们</a>
                    <li><a style="cursor:hand" onclick="session()">用户中心 </a></li>
                </ul>
            </nav>
            <%
                Custom custom = (Custom) session.getAttribute("custom");
                if (custom == null) { %>
            <div class="cen">
                <a href="${baseurl}/page/frontLogin">
                    <span class="glyphicon glyphicon-user"></span>
                    <span class="h5" style="margin-right: 20px">登录</span>
                </a>
                <a href="${baseurl}/page/register">
                    <span class="glyphicon glyphicon-log-in "></span>
                    <span class="h5" style="margin-right: 20px">注册</span>
                </a>
            </div>
            <%} else {%>
            <div class="cen">
                <a href="${baseurl}/page/personal">
                    <span class="glyphicon glyphicon-user"></span>
                    <span class="h5">您好:</span>
                    <span class="h5" style="margin-right: 20px;"><%=custom.getcName()%></span>
                </a>
                <a style="cursor: pointer" onclick="loginOut()">
                    <span class="glyphicon glyphicon-off"></span>
                    <span class="h5">注销</span>
                </a>
            </div>
            <%}%>
        </div>
        <a href="#" class="phone-nav"><i class="fa fa-list"></i></a>
    </div>
    <div style="width: 100%;height: 83px;"></div>
    <script type="text/javascript">
        function loginOut() {
            $.post("${baseurl}/CustomLogin/loginOut", function (data) {
                location.reload();
            });
        }

        function session() {
            $.post("${baseurl}/CustomLogin/session", function (data) {
                if (data.haveSession) {
                    location.href = "${baseurl}/page/personal";
                } else {
                    location.href = "${baseurl}/page/frontLogin";
                }
            });
        }
    //拼接菜单
        $(function () {
            $.post("${baseurl}/systemDisplay/modelMenuClassify", function (data) {
                let _html = "";
                let AClassify = data.AClassify;
                let model = "";
                //拼接一级菜单
                for(let i = 0; i<AClassify.length;i++){
                    let modelA = model;
                    model +=AClassify[i].a_id;
                    let BClassify = AClassify[i].BClassify;
                    _html += `<li><a>`+AClassify[i].a_name+`</a><ul class="miniui">`;
                    //拼接二级菜单
                    for(let j = 0; j<BClassify.length;j++){
                        let modelB = model;
                        model +="-"+BClassify[j].b_id;
                        let modelHref = "${baseurl}//page/bone?model="+model;
                        _html += `<li  class="clearA"><a href="`+modelHref+`">`+BClassify[j].b_name+`</a></li>`;
                        model = modelB;
                    }
                       _html +=`</ul></li>`;
                    model = modelA;
                }
                $("#menuModel").html(_html);
            });
        });
    </script>
</header>
