<%--
  Created by IntelliJ IDEA.
  User: chenfeilong
  Date: 2017/10/28
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>总店长的资料的修改</title>
    <link href="<%=path%>/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/animate.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/style.min.css" rel="stylesheet">
    <link href="<%=path%>/static/css/bootstrapValidator.css" rel="stylesheet">
    <base target="_blank">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>修改密码</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" role="form" id="updatePassWord" action="<%=path%>/user/updatePassword">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">旧密码：</label>
                            <div class="col-sm-8">
                                <input id="password" name="password" placeholder="请输入旧密码" class="form-control" type="password" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">新密码：</label>
                            <div class="col-sm-8">
                                <input id="newpassword" name="newpassword" class="form-control" placeholder="请输入新密码" type="password"  >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">确认密码：</label>
                            <div class="col-sm-8">
                                <input id="qnewpassword" name="qnewpassword" class="form-control" type="password" placeholder="再次输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">温馨提示：</label>
                            <div class="col-sm-8">
                                <br/>
                                请牢记修改的密码，千万保密！
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit">修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-14">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更改绑定的手机号</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal" role="form" id="updatePhone" action="<%=path%>/user/changePhone">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新手机号：</label>
                                <div class="col-sm-8 input-group">
                                    <input type="number" class="form-control" placeholder="请输入新手机号码" name="phone" id="phone">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">手机验证码：</label>
                                <div class="col-sm-8 input-group">
                                    <input type="number" class="form-control" name="phonecode" id="phonecode" placeholder="验证码">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">温馨提示：</label>
                                <div class="col-sm-8">
                                    <br/>
                                    请牢记新绑定的手机号，千万保密！
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3 form-inline">
                                    <input type="button" class="btn btn-primary block " style="float: right" onclick="time(this)"  id="getcode" value="获取验证码"></input>
                                    <button class="btn btn-primary" type="submit" style="float: left">确认修改</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>个人资料的修改</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="form_basic.html#">选项1</a>
                            </li>
                            <li><a href="form_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal" role="form" id="updateInfo" action="<%=path%>/user/updateBossInfo">
                        <input type="hidden" value="" name="id" id="id"/>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户昵称：</label>
                            <div class="col-sm-8">
                                <input id="nickname" name="nickname" class="form-control" placeholder="请输入用户昵称" type="text" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">真实名字：</label>
                            <div class="col-sm-8">
                                <input id="realname" name="realname" class="form-control" placeholder="请输入真实姓名" type="text"  >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">身份证号：</label>
                            <div class="col-sm-8">
                                <input id="identity" name="identity" placeholder="请输入18位的身份证号码" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户性别：</label>
                            <div class="col-sm-8">
                                <select class="form-control m-b" name="sex" id="sex">
                                    <option value="0">男</option>
                                    <option value="1">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户年龄：</label>
                            <div class="col-sm-8">
                                <input id="age" name="age" placeholder="请输入用户年龄" class="form-control" type="number">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户邮箱：</label>
                            <div class="col-sm-8">
                                <input id="email" name="email" placeholder="请输入用户邮箱" class="form-control" type="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户地址：</label>
                            <div class="col-sm-8">
                                <input id="address" name="address" placeholder="请输入用户地址" class="form-control" type="map">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用 户q q：</label>
                            <div class="col-sm-8">
                                <input id="qq" name="qq" placeholder="请输入用户QQ" class="form-control" type="map">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">用户微信：</label>
                            <div class="col-sm-8">
                                <input id="wechat" name="wechat" placeholder="请输入用户微信" class="form-control" type="map">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit">修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<%--<jsp:include page="../common/js.jsp"></jsp:include>--%>
<script src="<%=path%>/static/js/jquery.min.js?v=2.1.4"></script>
<script src="<%=path%>/static/js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript" src="<%=path%>/static/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jquery.formautoFill.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/pageJs/valid.js"></script>
</html>