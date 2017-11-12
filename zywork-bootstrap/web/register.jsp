<%--
  Created by IntelliJ IDEA.
  User: chenfeilong
  Date: 2017/10/26
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>瑞蓝酒店后台总店长注册</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/animate.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/style.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/bootstrapValidator.css" rel="stylesheet">
    <base target="_blank">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">RL</h1>
        </div>
            <form class="m-t" role="form" id="form" action="login.html">
                <div class="form-group">
                    <input type="text" class="form-control" name="userAccount" placeholder="请输入用户账号" required="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control " name="userPassword" placeholder="请输入密码" required="">
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input type="number" class="form-control" name="captcha" id="captcha" placeholder="请输入答案">
                        <div class="input-group-btn">
                            <label class="btn btn-primary block dropdown-toggle" style="width:106px" data-toggle="dropdown" id="captchaOperation"></label>
                        </div><!-- /btn-group -->
                    </div>
                    <%--<input type="text" class="form-control" name="captcha" id="captcha" placeholder="输入答案">--%>
                    <%--<label class="col-lg-6 control-label fa fa-question-circle" style="float: right;margin-top: 0;padding-top: 0px" id="captchaOperation"></label>--%>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <input type="number" class="form-control" name="registercode" id="registercode" placeholder="验证码">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-primary block " style="width:106px"  id="getcode">获取验证码</button>
                        </div><!-- /btn-group -->
                    </div>
                    <%--<button type="button" class="btn btn-primary btn-lg fa-question-circle glyphicon glyphicon-leaf" id="getcode" >获取验证码</button>--%>
                </div>
                <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>
                <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.html">点此登录</a>
                </p>
            </form>
    </div>
</div>
<script src="<%=path%>/static/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=path%>/static/js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript" src="<%=path%>/static/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zh_CN.js"></script>
</body>
<script type="text/javascript">
    $(function () {
        // Generate a simple captcha
        function randomNumber(min, max) {
            return Math.floor(Math.random() * (max - min + 1) + min);
        };
        $('#captchaOperation').html(['? =', randomNumber(1, 100), '+',randomNumber(1, 100) ].join(' '));
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                userAccount: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '用户名长度必须在11位'
                        }
                        <%--threshold: 10,--%>
                        <%--remote: {--%>
                            <%--url: '${pageContext.request.contextPath}/manager/checkmanageraccount',--%>
                            <%--message: '用户不存在',--%>
                            <%--delay :  2000,--%>
                            <%--type: 'POST'--%>
                        <%--}--%>
                    }
                },
                userPassword: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '密码只能包含大写、小写、数字和下划线'
                        }
                        <%--threshold: 6,--%>
                        <%--remote: {--%>
                            <%--url: "${pageContext.request.contextPath}/manager/checkpassword",--%>
                            <%--data: function (validator) {--%>
                                <%--return {--%>
                                    <%--useraccount: $("#useraccount").val(),--%>
                                    <%--password: $("#password").val()--%>
                                <%--};--%>

                            <%--},--%>
                            <%--message: '密码输入错误！',--%>
                            <%--delay:1000--%>
                        <%--}--%>

                    }
                },
                registercode :{
                    validators: {
                        notEmpty: {
                            message: '验证码不能为空!'
                        },
                        stringLength: {
                            min: 6,
                            max: 6,
                            message: '请输入6位数的验证码'
                        }
                        <%--threshold :6,--%>
                        <%--remote: {--%>
                            <%--url: '${pageContext.request.contextPath}/manager/checkcode',--%>
                            <%--message: '验证码错误!',--%>
                            <%--delay :  2000,--%>
                            <%--type: 'POST'--%>
                        <%--}--%>
                    }
                },
                captcha: {
                    validators: {
                        callback: {
                            message: '回答错误',
                            callback: function(value, validator) {
                                var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[1]) + parseInt(items[3]);
                                return value == sum;
                            }
                        }
                    }
                },fastuseraccount: {
                    message: '用户名验证失败',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '用户名长度必须在11位'
                        }
                        <%--threshold: 10,--%>
                        <%--remote: {--%>
                            <%--url: '${pageContext.request.contextPath}/manager/checkregisteraccount',--%>
                            <%--message: '用户已存在',--%>
                            <%--delay :  2000,--%>
                            <%--type: 'POST'--%>
                        <%--}--%>
                    }
                },
                fastphonecode: {
                    message: '密码验证失败',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 18,
                            message: '密码长度必须在6到18位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_]+$/,
                            message: '密码只能包含大写、小写、数字和下划线'
                        }
                        <%--threshold: 6,--%>
                        <%--remote: {--%>
                            <%--url: "${pageContext.request.contextPath}/manager/getcode",--%>
                            <%--data: function (validator) {--%>
                                <%--return {--%>
                                    <%--useraccount: $("#useraccount").val()--%>
                                <%--};--%>
                            <%--},--%>
                            <%--message: '密码输入错误！',--%>
                            <%--delay:1000--%>
                        <%--}--%>

                    }
                }
            }
        });
    });
</script>
<script>
    $(function(){
        $("#lg").bind("click",function(){
            $('#myTab li:eq(0) a').tab('show')
        });
        $("#re").bind("click",function(){
            $('#myTab li:eq(1) a').tab('show')
        });
    });
</script>
<script>
    $(function() {
        $("#bt").click(function(){
            $(this).button('loading').delay(1000).queue(function() {
                $(this).button('reset');
                $(this).dequeue();
            });
        });
    });
</script>
<script>
    $(function(){
        var num=60;
        $("#getcode").click(function(){
            if($("#registeraccount").val()==""){
                alert("请输入手机号");
                return;
            }
            alert("尊敬的"+$("#registeraccount").val()+"用户,短信发送成功,请注意查收，谢谢支持！");
            <%--$.post(--%>
                <%--"${pageContext.request.contextPath}/manager/sendcode",--%>
                <%--{--%>
                    <%--"registeraccount":$("#registeraccount").val()--%>
                <%--},--%>
                <%--function(data){--%>
                <%--},--%>
                <%--"json"--%>
            <%--);--%>
            showtime();
        });
        function showtime(){
            if(num>=0){
                num--;
                $("#getcode").html(num+"秒后重发");
            }else{
                $("#getcode").html("重新发送");
                num=60;
            }
            setTimeout(showtime,1000);
        }
        $("#getphonecode").click(function(){
            if($("#fastuseraccount").val()==""){
                alert("请输入手机号");
                return;
            }
            showtimecode();
        });
        function showtimecode(){
            if(num>=0){
                num--;
                $("#getphonecode").html(num+"秒后重发");
//     				$.post(
//     					"",
//     					{

//     					},
//     					function(data){

//     					},
//     					"json"
//     				);
            }else{
                $("#getphonecode").html("重新发送");
            }
            setTimeout(showtimecode,1000);
        }
    });
</script>
</html>