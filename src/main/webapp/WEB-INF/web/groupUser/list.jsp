<%--
  Created by IntelliJ IDEA.
  User: mlw
  Date: 18-1-3
  Time: 上午11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script src="${baseurl}/public/js/jquery.min.js" type="text/javascript"></script>
    <script src="${baseurl}/public/js/verification/verification.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
</head>
<body>

<section class="larry-grid">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <ul class="layui-tab-title">
                    <li class="layui-btn " onclick="groupUser.randomGenerateAccountPassword()"><i class="layui-icon">&#xe61f;</i>随机生成账户密码
                    </li>
                </ul>
            </blockquote>
            <div class="larry-separate"></div>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <div class="layui-form ">
                    <table id="example" class="layui-table lay-even " data-name="articleCatData">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>用户名</th>
                            <th>集团电话</th>
                            <th>集团邮箱</th>
                            <th>集团名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>

                </div>
                <div id="demo1"></div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="layui.jsp"></jsp:include>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript">
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let teacher;
    let classId = 0;
    let groupUser, currentMenuId;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        var layer = layui.layer;
        let element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        groupUser = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    last: totalSize,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            groupUser.list();
                        }
                    }
                });
            },
            list: function () {
                $.ajax({
                    url: baseUrl + "/back/groupUsers/list",
                    type: "post",
                    data: {currentIndex: currentIndex, pageSize: pageSize},
                    success: function (data) {
                        console.log("后台数据：" + JSON.stringify(data))
                        if (data.status === 0) {
                            currentIndex = data.data.page.currentIndex;
                            totalSize = data.data.page.totalSize;
                            groupUser.page();
                            // showTotalCount(data.page.totalCount);
                            laytpl($("#list-tpl").text()).render(data.data.accountInfo, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            deleteAccount: function (id) {
                $.ajax({
                    url: baseUrl + "/back/groupUsers/deleteAccount",
                    type: "post",
                    data: {id: id},
                    success: function (data) {
                        if (data.status === 0) {
                            top.layer.msg(data.msg);
                            form.render();
                            setTimeout("self.location.reload()", 2000);
                        }
                    }
                })
            },

            randomGenerateAccountPassword: function () {
                layer.open({
                    type: 1,
                    title: '随机生成用户',
                    area: ["80%", "80%"],
                    content: $("#randomGenerateAccountPassword")
                })
            },
            addAccount: function () {
                let userNumber = $("input[name='userNumber']").val();
                let c_phone = $("input[name='accountPhone']").val();
                let c_email = $("input[name='accountEmail']").val();
                let usernamePrefix = $("input[name='usernamePrefix']").val();
                let parentAccount = $("input[name='groupUsersName']").val();

                if (!verificat.mobileVer(c_phone)) {
                    $("#msgInfo").val("手机号输入错误");
                    $("#showMsg").show();
                    return;
                }
                if (!verificat.emailVer(c_email)) {
                    $("#msgInfo").val("邮箱输入错误");
                    $("#showMsg").show();
                    return;
                }

                if (userNumber !== "" && c_phone !== "" && usernamePrefix !== "" && c_email !== "" && parentAccount !== "") {
                    $.post(baseUrl + "back/groupUsers/addAccount", {
                        userNumber: userNumber,
                        groupUserPrefix: usernamePrefix,
                        parentAccount: parentAccount,
                        cPhone: c_phone,
                        cEmail: c_email
                    }, function (data) {
                        console.log(data);
                        if (data.status === 0) {
                            top.layer.msg(data.msg);
                            setTimeout("self.location.reload()", 2000);
                        } else {
                            $("#msgInfo").val(data.msg);
                            $("#showMsg").show();
                        }
                    })
                } else {
                    $("#msgInfo").val("请将信息填写完整");
                    $("#showMsg").show();
                }
            }
        }

        $(function () {
            groupUser.list();
        })
    });

</script>
</body>
</html>
