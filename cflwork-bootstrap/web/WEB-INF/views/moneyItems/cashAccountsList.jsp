<%--
  Created by IntelliJ IDEA.
  User: chenfeilong
  Date: 2017/10/19
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>现金流水账目列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>现金流水账目统计</h5>
             <div class="ibox-tools">
                 <div style="float:right;">
                     <button type="button" style="float: right;margin-top: -10px;margin-left: 5px" id="getDval" class="btn btn-primary" data-dismiss="modal">
                         查询
                     </button>
                 </div>
                 <div style="float:right;">
                     <input  name="dateVal" style="width:100%;padding-top: -5%;margin-top: -10px;float: right"  type="text" id="test21"  class="form-control" required="required" aria-required="true">
                 </div>
                 <div style="float:right;margin-right: 20px">
                     <span>账单月份</span>
                 </div>
                 <div style="float:right;margin-right: 20px">
                     <select class="form-control" style="width:100%;padding-top: -5%;margin-top: -10px;float: right" required id="hotelid_" name="hotelId">
                        <option value="">全部</option>
                     </select>
                 </div>
                 <div style="float:right;margin-right: 20px">
                     <span>店面名称</span>
                 </div>
             </div>
        </div>
        <div class="ibox-content">
            <div class="wrapper wrapper-content">
                <div class="row">
                    <a onclick="getInfo('wxin');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">微信</span>
                                    <h5>微信收入</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="wxin"></h3>
                                    <div class="stat-percent font-bold text-info">收入
                                        <i class="fa fa-level-up"></i>
                                    </div>
                                    <small>微信收入</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('zfbin');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">支付宝</span>
                                    <h5>支付宝</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="zfbin"></h3>
                                    <div class="stat-percent font-bold text-info">收入 <i class="fa fa-level-up"></i>
                                    </div>
                                    <small>支付宝收入</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('xjin');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">现金</span>
                                    <h5>现金收入</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="xjin"></h3>
                                    <div class="stat-percent font-bold text-info">现金 <i class="fa fa-level-up"></i>
                                    </div>
                                    <small>现金收入</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('ylin');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right ">银联</span>
                                    <h5>银联收入</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="ylin"></h3>
                                    <div class="stat-percent font-bold text-info">收入 <i class="fa fa-level-up"></i>
                                    </div>
                                    <small>银联收入</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('zjin');" style="color:red">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right" style="color:white;background-color: orangered">合计</span>
                                    <h5 style="color:red">总计</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="zjin"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">收入 <i class="fa fa-level-up"></i>
                                    </div>
                                    <small style="color:red">总计收入</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <div class="col-sm-2">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-info pull-right" style="background-color: blue">盈亏</span>
                                <h5 style="color:blue">盈亏</h5>
                            </div>
                            <div class="ibox-content">
                                <h3 class="no-margins" id="yk"></h3>
                                <div class="stat-percent font-bold text-info" style="color:blue">盈亏 <i class="fa fa-level-up"></i>
                                </div>
                                <small style="color:blue">酒店盈亏</small>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="wrapper wrapper-content">
                <div class="row">
                    <a onclick="getInfo('wxout');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">微信</span>
                                    <h5>微信支出</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="wxout"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">支出
                                        <i class="fa fa-level-down" ></i>
                                    </div>
                                    <small>微信支出</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('zfbout');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">支付宝</span>
                                    <h5>支付宝</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="zfbout"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">支出 <i class="fa fa-level-down"></i>
                                    </div>
                                    <small>支付宝支出</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('xjout');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right">现金</span>
                                    <h5>现金支出</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="xjout"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">支出 <i class="fa fa-level-down"></i>
                                    </div>
                                    <small>现金支出</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('ylout');" style="color:#797979">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right ">银联</span>
                                    <h5>银联支出</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="ylout"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">支出 <i class="fa fa-level-down"></i>
                                    </div>
                                    <small>银联支出</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a onclick="getInfo('zjout');" style="color:red">
                        <div class="col-sm-2">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-info pull-right" style="color:white;background-color: orangered">合计</span>
                                    <h5 style="color:red">总计</h5>
                                </div>
                                <div class="ibox-content">
                                    <h3 class="no-margins" id="zjout"></h3>
                                    <div class="stat-percent font-bold text-info" style="color:red">支出 <i class="fa fa-level-down"></i>
                                    </div>
                                    <small style="color:red">总计支出</small>
                                </div>
                            </div>
                        </div>
                    </a>
                    <div class="col-sm-2">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <span class="label label-info pull-right" style="background-color: blue">盈亏</span>
                                <h5 style="color:blue">盈亏</h5>
                            </div>
                            <div class="ibox-content">
                                <h3 class="no-margins" id="y_k"></h3>
                                <div class="stat-percent font-bold text-info" style="color:blue">盈亏 <i class="fa fa-level-up"></i>
                                </div>
                                <small style="color:blue">酒店盈亏</small>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>现金流水账目列表</h5>
        </div>
        <div class="ibox-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询列表
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <table id="mytab" name="mytab" class="table table-hover"></table>
                    <div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
                        <button id="btn_shenhe" type="button" onclick="return getAccounts();" class="btn btn-default" style="display: block; border-radius: 0" data-toggle="modal" data-target="#manayShenhe">
                            <span class="glyphicon glyphicon-import" aria-hidden="true" ></span>批量审核
                        </button>
                        <button id="btn_delete" onclick="deleteMany();" type="button" class="btn btn-default" style="display: block;">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>批量删除
                        </button>
                        <button id="btn_add" type="button" class="btn btn-default" data-toggle="modal" data-target="#webAdd">
                            <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--网站数据的新增--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="webAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="webAddTitle">
                    新增现金流水账目
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属酒店：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="hotel_id" name="hotelId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属现金流水科目：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="subject_id" name="subjectId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">现金流水账目类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="accountType">
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付方式：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="payType_Id" name="payTypeId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">现金流水账目金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" minlength="2" maxlength="20" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">收支起始时间：</label>
                        <div class="col-sm-8">
                            <input  name="accountTime"  type="datetime" id="test2" class="form-control" required="required" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">收支结束时间：</label>
                        <div class="col-sm-8">
                            <input  name="accountTimeEnd"  type="datetime" id="test1" class="form-control" required="required" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">账目说明：</label>
                        <div class="col-sm-8">
                            <textarea  name="description" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" id="add" class="btn btn-primary">
                        确认新增
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<input type="hidden" value=""  id="deleteId"/>
<%--网站新增结束--%>
<%--网站信息的修改--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    现金流水账目的修改
                </h4>
            </div>
            <form class="form-horizontal" id="updateform" >
                <input  id="id" type="hidden" name="id" />
                <div class="form-group">
                    <label class="col-sm-3 control-label">所属酒店：</label>
                    <div class="col-sm-8">
                        <select class="form-control" required id="hotelId" name="hotelId">
                        </select>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属现金流水科目：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="subjectId" name="subjectId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">现金流水账目类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="accountType">
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">现金流水账目金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" minlength="2" id="totalPay" maxlength="20" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付方式：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="payTypeId" name="payTypeId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">账目说明：</label>
                        <div class="col-sm-8">
                            <textarea  name="description" id="description" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="update" class="btn btn-primary" data-dismiss="modal">
                        确认修改
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="shenheModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="shenheModalLabel">
                    现金流水账目的审核
                </h4>
            </div>
            <form class="form-horizontal" id="shenheform" >
                <input  id="accountid" type="hidden" name="id" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">审核操作：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="cashStatus">
                                <option value="0">未审核</option>
                                <option value="1">审核通过</option>
                                <option value="2">审核不通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">审核备注：</label>
                        <div class="col-sm-8">
                            <textarea  name="reason" id="reason" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="shenhe" class="btn btn-primary" data-dismiss="modal">
                        确认审核
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="manayShenhe" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="manyShenheModalLabel">
                    现金流水账目的批量审核
                </h4>
            </div>
            <form class="form-horizontal" id="manyshenheform" >
                <input  id="manyId" type="hidden" name="manyId" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">审核操作：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="cashStatus">
                                <option value="0">未审核</option>
                                <option value="1">审核通过</option>
                                <option value="2">审核不通过</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">审核备注：</label>
                        <div class="col-sm-8">
                            <textarea  name="reason" class="form-control" id="accountsReason" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="accountsshenhe" class="btn btn-primary" data-dismiss="modal">
                        确认批量审核
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="remarkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="remarkModalLabel">
                    现金流水账目的批注
                </h4>
            </div>
            <form class="form-horizontal" id="remarkform" >
                <input  id="remarkid" type="hidden" name="id" />
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-3 control-label">批注：</label>
                        <div class="col-sm-8">
                            <textarea  name="remark" id="remark" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="remarkAdd" class="btn btn-primary" data-dismiss="modal">
                        确认批注
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/plugins/laydate/laydate.js"></script>
<script src="<%=path%>/static/js/pageJs/cashAccounts.js"></script>
</body>
<%--<script>--%>
    <%--$(function () {--%>
        <%--alert("asdflsfa");--%>
        <%--layer.msg('已发布', {icon:1,time:1000});--%>
        <%--layer.msg('已发布', {icon:2,time:1000});--%>
        <%--layer.msg('已发布', {icon:3,time:1000});--%>
        <%--layer.msg('已发布', {icon:4,time:1000});--%>
        <%--layer.msg('已发布', {icon:5,time:1000});--%>
        <%--layer.msg('已发布', {icon:6,time:1000});--%>
        <%--layer.msg('已发布', {icon:7,time:1000});--%>
        <%----%>
    <%--});--%>

<%--</script>--%>
<script>
    var date = new Date();
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    $("#test21").val(y + '-' + m + '-' + d);
    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#test2' //指定元素
        ,type: 'datetime'
    });
    laydate.render({
        elem: '#test21'
    });
</script>
<script>
    $(function () {
        $.post(
            "/cashAccounts/getSubject",
            function(data){
                $("#subjectId").select2({
                    data: data
                })
                $("#subject_id").select2({
                    data: data
                })
                $("#select2-subjectId-container").remove();
                $("#select2-subject_id-container").remove();
            },
            "json"

        );
        $.post(
            "/cashAccounts/getHotel",
            function(data){
                $("#hotelId").select2({
                    data: data
                })
                $("#hotel_id").select2({
                    data: data
                })
                $("#hotelid_").select2({
                    data: data
                })
                $("#select2-hotelId-container").remove();
                $("#select2-hotel_id-container").remove();
                $("#select2-hotelid_-container").remove();
            },
            "json"

        );
        $.post(
            "/cashAccounts/getPayType",
            function(data){
                $("#payType_Id").select2({
                    data: data
                })
                $("#payTypeId").select2({
                    data: data
                })
                $("#select2-payType_Id-container").remove();
                $("#select2-payTypeId-container").remove();
            },
            "json"

        );
    });
</script>
<script>
    $(function () {
        getVal();
    });
    $("#getDval").click(function () {
        getVal($("#test21").val());
    });
    function getVal(val) {
        $.post(
            "/cashAccounts/getCashVal",
            {
                dateVal:val,
                hotelId:$("#hotelid_").val()
            },
            function(data){
                $("#wxin").html("￥"+data.wxin);
                $("#wxout").html("￥"+data.wxout);
                $("#xjin").html("￥"+data.xjin);
                $("#xjout").html("￥"+data.xjout);
                $("#zfbin").html("￥"+data.zfbin);
                $("#zfbout").html("￥"+data.zfbout);
                $("#ylin").html("￥"+data.ylin);
                $("#ylout").html("￥"+data.ylout);
                $("#zjin").html("￥"+data.zjin);
                $("#zjout").html("￥"+data.zjout);
                if(data.yk==0){
                    $("#yk").html("亏损￥"+data.ykVal);
                    $("#yk").css("color","red");
                    $("#y_k").html("亏损￥"+data.ykVal);
                    $("#y_k").css("color","red");
                }else{
                    $("#yk").html("盈利￥"+data.ykVal);
                    $("#yk").css("color","blue");
                    $("#y_k").html("盈利￥"+data.ykVal);
                    $("#y_k").css("color","blue");
                }
            },
            "json"

        );
    }
</script>
</html>
