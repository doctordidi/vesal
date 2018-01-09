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
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/register_front.css">
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
            <h1 style="color: white ;margin-bottom: 20px;">用户注册</h1>
            <form class="form">
                <input type="text" name="username" placeholder="请输入用户名">
                <input type="password" name="password" placeholder="请输入密码">
                <input type="password" name="passwordAgain" placeholder="请确认密码">
                <%--<input type="text" name="userCode" placeholder="请输入客户编码">--%>
                <select id="userSet" style="color: #FFFFFF">
                    <option value="">请选择用户职业</option>
                    <option value="教师">教师</option>
                    <option value="医生">医生</option>
                    <option value="管理人员">管理人员</option>
                    <option value="其他">其他</option>
                </select>
                <input type="text" name="userPhone" placeholder="请输入联系电话" style="margin-top: 10px">
                <input type="text" name="userEmail" placeholder="请输入电子邮箱">
                <button type="button" id="code-button" class="btn btn-info" style="margin-bottom: 10px">发送邮箱验证码</button>
                <input type="text" name="codeEmail" placeholder="请输入邮箱验证码">
                <input type="text" name="userCity" placeholder="请输入所在城市">
                <input style="display: none" type="text" id="showMsg">
                <input style="display: none" type="text" id="codeEmail">
                <button type="button" id="submit-button">注册信息</button>
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
<script type="text/javascript">
    $('#submit-button').click(function () {
        let username = $("input[name='username']").val();
        let password = $("input[name='password']").val();
        let passwordAgain = $("input[name='passwordAgain']").val();
        let userOccupation = $("#userSet").val();
        let userPhone = $("input[name='userPhone']").val();
        let userEmail = $("input[name='userEmail']").val();
        let userCity = $("input[name='userCity']").val();
        //手机验证规则
        let checkPhone = /^1[3|4|5|7|8][0-9]{9}$/;
        //电话号码：区号+号码，区号以0开头，3位或4位 号码由7位或8位数字组成
        let checkTelephone = /^0\d{2,3}-?\d{7,8}$/;
        //用户名：校验用户名 只能输入5-20个以字母开头、可带数字、“_”、“.”的字串
        let checkName = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
        //密码：只能输入6-20个字母、数字、下划线
        let checkPass = /^(\w){6,20}$/;
        //邮箱：
        let checkEmail = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
        //验证是否全为中文
        let checkChinese = /^[\u4e00-\u9fa5]+$/;
        let customNameIsNo = true;
         let codeEmail = $("#codeEmail").val();
        let custemCodeEmail = $("input[name='codeEmail']").val();
        $.post("${baseurl}/CustomLogin/queryCustomByName", {cName: username,cPhone:userPhone}, function (data) {
            customNameIsNo = data.customName;
            customPhoneIsNo = data.customPhone;
            if (customNameIsNo) {
                layer.msg("用户名已经存在", {
                    time: 2000
                });
            }else if (customPhoneIsNo) {
                layer.msg("手机号已经存在", {
                    time: 2000
                });
            }else if (username == "" || password == "" || passwordAgain == "" || userOccupation == "" || userPhone == "" || userEmail == "" || userCity == "" || custemCodeEmail == "") {
                layer.msg("信息不能为空", {
                    time: 2000
                });
            } else if (!checkName.test(username)) {
                layer.msg("用户名不合格：5-20个以字母开头的字母、数字", {
                    time: 2000
                });
            } else if (!checkPass.test(password)) {
                layer.msg("密码格式不正确：6-20个字母、数字", {
                    time: 2000
                });
            } else if (password !== passwordAgain) {
                layer.msg("两次填写的密码不相同", {
                    time: 2000
                });
            } else if (!(checkPhone.test(userPhone) || checkTelephone.test(userPhone))) {
                layer.msg("手机/电话填写有误", {
                    time: 2000
                });
            } else if (!checkEmail.test(userEmail)) {
                layer.msg("邮箱填写有误", {
                    time: 2000
                });
            } else if (!checkChinese.test(userCity)) {
                layer.msg("地址输入不正确", {
                    time: 2000
                });
            } else if (custemCodeEmail !== codeEmail ) {
                layer.msg("邮箱验证码输入不正确", {
                    time: 2000
                });
            } else {
                $.post("${baseurl}/CustomLogin/customRegister",
                    {
                        cName: username,
                        cPassword: password,
                        cOccupation: userOccupation,
                        cPhone: userPhone,
                        cEmail: userEmail,
                        cCity: userCity
                    }, function (data) {
                        if (data.status == 0) {
                            layer.msg("注冊成功", {
                                time: 1000
                            }, function () {
                                window.location.href = "${baseurl}/page/frontLogin";
                            });
                        }
                    })
            }
        });
    });
    $("#code-button").click(function () {
        let userEmail = $("input[name='userEmail']").val();
        //邮箱：
        let checkEmail = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
        if(userEmail != "" && checkEmail.test(userEmail)){
            $.post("${baseurl}/CustomLogin/identifying",{cEmail:userEmail}, function (data) {
                    if (data.result) {
                        $("#codeEmail").val(data.codeEmail);
                    }
                    layer.msg(data.msg, {
                        time: 2000
                    });
                })
        }else{
            layer.msg("邮箱输入不正确！", {
                time: 2000
            });
        }
    })
</script>

</body>
</html>