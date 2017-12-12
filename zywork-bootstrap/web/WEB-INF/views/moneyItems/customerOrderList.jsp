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
<!DOCTYPE HTML>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>客户订单列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>客户订单列表</h5>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">客户订单名称：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="search_name"/>
                    </div>
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">创建时间：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="search_tel"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-4">
                        <button class="btn btn-primary" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
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
                <button id="order_add" type="button" class="btn btn-default" data-toggle="modal" data-target=".bs-example-modal-lg">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>订单新增
                </button>
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
                    新增客户订单
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属现金流水科目：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="subject_id" name="subjectId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户订单类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="accountType">
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户订单金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" minlength="2" maxlength="20" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">收支时间：</label>
                        <div class="col-sm-8 date form_datetime">
                            <input  name="accountTime"  type="datetime" class="form-control" required="" aria-required="true">
                            <span class="add-on"><i class="icon-th"></i></span>
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
                    客户订单的修改
                </h4>
            </div>
            <form class="form-horizontal" id="updateform" >
                <input  id="id" type="hidden" name="id" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属现金流水科目：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required id="subjectId" name="subjectId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户订单类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="accountType">
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户订单金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" minlength="2" id="totalPay" maxlength="20" type="number" class="form-control" required="" aria-required="true">
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
                    客户订单的审核
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
                    客户订单的批量审核
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
                    客户订单的批注
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
<div class="modal fade bs-example-modal-lg"  id="itemsModule" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="orderModalLabel">
                    订单入住
                </h4>
            </div>
            <form class="form-horizontal" id="updateorderform" >
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-1 control-label">姓名：</label>
                        <div class="col-sm-3">
                            <input  name="customerName" minlength="2" id="customerName"  maxlength="20" type="text" placeholder="请输入入住人的姓名" value="" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">手机：</label>
                        <div class="col-sm-3">
                            <input  name="customerPhone" minlength="2" id="customerPhone"  maxlength="20" type="text" placeholder="请输入入住人的联系方式" value="" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">证件：</label>
                        <div class="col-sm-3">
                            <input  name="customerIdentity" minlength="2" id="customerIdentity" placeholder="请输入入住人的证件号"  maxlength="20" type="text" value="" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group" class="div" id="ffid">
                        <div class="form-group" id="fid">
                            <div class="col-sm-2">
                                <input  name="checkinTime" minlength="2" id="checkinTime0"  maxlength="20" type="datetime" value="" class="form-control  date form_datetime" placeholder="入住时间" data-date-format="yyyy-mm-dd hh:ii:ss" required="" aria-required="true">
                            </div>
                            <div class="col-sm-2">
                                <input  name="checkoutTime" minlength="2" id="checkoutTime0"  maxlength="20" type="datetime" value="" class="form-control  date form_datetime" onchange="getDays(this.value,0)" placeholder="离店时间" data-date-format="yyyy-mm-dd hh:ii:ss" required="" aria-required="true">
                            </div>
                            <div class="col-sm-2">
                                <input  name="totalDays" minlength="2" id="totalDays0" readonly maxlength="20" type="text" value="" class="form-control" required="" aria-required="true">
                            </div>
                            <div class="col-sm-2">
                                <select class="form-control" onchange="getHouse(this.value,0);" id="housetTypeId0" required name="housetTypeId">
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <select class="form-control" onchange="getHousePrice(this.value,0);" id="housetId0" required name="housetId">
                                </select>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" style="background-color: inherit;border: 0" class="btn btn-default"><span class="glyphicon glyphicon-usd" style="color:blue" name="houseP" id="houseP0" onchange="getSum(this.text);"></span></button>
                                <a onclick="removeDiv(this);" id="remove0"><span style="margin-left: 5px"><i class="glyphicon glyphicon-minus-sign" style="color:red"></i></span></a>
                            </div>
                        </div>
                    </div>
                    <div  class="form-group" style="margin-top: -30px;">
                        <hr height="5px"/>
                        <a onclick="addDiv();"><i class="glyphicon glyphicon-plus" style="color:green;float:left;margin-top: -16px">新增房间</i></a>
                        <i class="glyphicon glyphicon-usd" style="color:green;float:right;margin-top: -16px">房费总计：<span id="sumMoney"></span></i>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="hotelItemType" id="hotel0" value="0">
                            </label>
                        </div>
                        <label class="col-sm-2 control-label" style="margin-left: -40px">支付类型：</label>
                        <div class="col-sm-2" style="margin-left:-30px">
                            <select class="form-control" id="paymentTypeId" required name="paymentTypeId">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label" style="margin-left: -40px">渠道选择：</label>
                        <div class="col-sm-2">
                            <select class="form-control" id="websiteId" required name="websiteId" style="margin-left: -30px">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-1">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="hotelItemType" id="hotel1" value="1">
                            </label>
                        </div>
                        <label class="col-sm-2 control-label" style="margin-left: -40px">商家送客：</label>
                        <div class="col-sm-2" style="margin-left:-30px">
                            <select class="form-control"  name="othersHotel_id" required id="othersHotel_id">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label" style="margin-left: -40px">结算状态：</label>
                        <div class="col-sm-2">
                            <select class="form-control" required name="isCash0" style="margin-left: -30px">
                                <option value="0">未结算</option>
                                <option value="1">已结算</option>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label" style="margin-left: -40px">支付类型：</label>
                        <div class="col-sm-2" style="margin-left:-30px">
                            <select class="form-control" id="paymentType_Id" required name="paymentTypeId">

                            </select>
                        </div>
                    </div>
                    <div  class="form-group" style="margin-top: -30px;">
                        <hr height="5px"/>
                    </div>
                    <div class="form-group">
                        <div  class="form-group col-sm-12">
                            <div class="col-sm-1">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hotelItemType" id="hotel2" value="2">
                                </label>
                            </div>
                            <label class="col-sm-2 control-label" style="margin-left: -40px">借房商家：</label>
                            <div class="col-sm-2" style="margin-left:-30px">
                                <select class="form-control" id="othersHotelId" required name="othersHotelId">
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" style="margin-left: -40px">结算金额：</label>
                            <div class="col-sm-2">
                                <input  name="otherHotelMoney" minlength="2" style="margin-left:-30px" maxlength="20" type="number" placeholder="结算金额" value="" class="form-control" required="" aria-required="true">
                            </div>
                            <label class="col-sm-2 control-label" style="margin-left: -40px">选择房号：</label>
                            <div class="col-sm-2" style="margin-left:-30px">
                                <select class="form-control" id="houseId" required name="xnHouse">
                                    <option>虚拟101房间</option>
                                </select>
                            </div>
                        </div>

                        <div  class="form-group col-sm-12">
                            <div class="col-sm-1">
                                <label class="checkbox-inline">

                                </label>
                            </div>
                            <label class="col-sm-2 control-label" style="margin-left: -40px">结算状态：</label>
                            <div class="col-sm-2" style="margin-left:-30px">
                                <select class="form-control"  required name="isCash1">
                                    <option value="0">未结算</option>
                                    <option value="1">已结算</option>
                                </select>
                            </div>
                            <label class="col-sm-2 control-label" style="margin-left: -40px">结算账户：</label>
                            <div class="col-sm-2" style="margin-left:-30px">
                                <select class="form-control" id="otherHotelMoneyType" required name="otherHotelMoneyType">

                                </select>
                            </div>
                        </div>
                    </div>
                    <div  class="form-group" style="margin-top: -30px;">
                        <hr height="5px"/>
                        <i class="glyphicon glyphicon-usd" style="color:red;float:left;margin-top: -16px"><span style="color:red">订单盈亏:</span><span style="color:red">100</span><span style="color:red">房费-结算金额</span></i>
                    </div>
                    <div class="form-group">
                        <table id="mytab1" name="mytab1" class="table table-hover"></table>
                    </div>
                    <div  class="form-group" style="margin-top: -30px;">
                        <hr height="5px"/>
                        <a data-toggle="modal" data-target="#orderAdd"><i class="glyphicon glyphicon-plus" style="color:green;float:left;margin-top: -16px">新增款项</i></a>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">备注：</label>
                        <div class="col-sm-11">
                            <textarea  name="title" minlength="2" id="reason1"  maxlength="20" value="" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="orderItemAdd" class="btn btn-primary">
                        录入订单
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="orderAdd" tabindex="-1" role="dialog" aria-labelledby="webAddLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="otherMoney">
                    新增客户增值业务款项
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="otherMoneyForm">
                <div class="modal-body">
                    <div class="form-group">
                        <input  name="totalPay" minlength="2" maxlength="20" type="number" class="form-control" required="" aria-required="true">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">所属科目：</label>
                        <div class="col-sm-8">
                            <select class="form-control" required name="accountType">
                                <option value="0">收入</option>
                                <option value="1">支出</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">客户订单金额：</label>
                        <div class="col-sm-8">
                            <input  name="payMoney" minlength="2" maxlength="20" type="number" class="form-control" required="" aria-required="true">
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
                    <button type="submit" id="otherMoneyAdd" class="btn btn-primary">
                        确认新增
                    </button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/customerOrder.js"></script>
<script src="<%=path%>/static/js/pageJs/addOrderItems.js"></script>
<script src="<%=path%>/static/js/pageJs/addHouseMoney.js"></script>
</body>
<script>
    $('#orderAdd').on('hidden.bs.modal', function() {
        $('#itemsModule').css({'overflow-y':'scroll'});
    });
    $("#orderItemAdd").click(function(){
        if($("#customerName").val()==""){
            layer.msg('客户姓名不能为空', {icon:2,time:1500});
            return;
        }
        if($("#customerIdentity").val()==''){
            layer.msg('客户身份证不能为空', {icon:2,time:1500});
            return;
        }
        if($("#customerPhone").val()==''){
            layer.msg('客户手机号不能为空', {icon:2,time:1500});
            return;
        }
        if($("#customerPhone").val()==''){
            layer.msg('客户手机号不能为空', {icon:2,time:1500});
            return;
        }
        var obj = document.getElementsByName("checkinTime");
        for(i=0;i<obj.length;i++){
            if(obj[i].value==''){
                layer.msg('入住时间不能为空', {icon:2,time:1500});
                return;
            }
        }
        var obj1 = document.getElementsByName("checkoutTime");
        for(i=0;i<obj1.length;i++){
            if(obj1[i].value==''){
                layer.msg('离店时间不能为空', {icon:2,time:1500});
                return;
            }
        }
        var obj2=document.getElementsByName('hotelItemType');
        var s='';
        var val="";
        for(var i=0; i<obj2.length; i++){
            if(obj2[i].checked){
                s++;
                val=obj2[i].value;
            }
        }
        if(s==''){
            layer.msg('请勾选操作类别', {icon:2,time:1500});
            return;
        }
        if(s!=1){
            layer.msg('只允许勾选一个操作类别', {icon:2,time:1500});
            return;
        }
        if(s==1){
            if(val==2){
                if($("#otherHotelMoney").val()==''){
                    layer.msg('结算金额不能为空', {icon:2,time:1500});
                    return;
                }
            }
        }
    });
</script>
<%--
<script>
    var cnt = 0;
    function addDiv(){
        cnt++;
        var divHtml = '<div class="form-group" id="fid"> \n' +
            '\t<div class="col-sm-2">\n' +
            ' <input  name="checkinTime" minlength="2" id="checkinTime'+cnt+'"  maxlength="20" type="datetime" value="" class="form-control  date form_datetime" placeholder="入住时间" data-date-format="yyyy-mm-dd hh:ii:ss" required="" aria-required="true">\n' +
            '     </div>\n' +
            '     <div class="col-sm-2">\n' +
            '         <input  name="checkoutTime" minlength="2" id="checkoutTime'+cnt+'"  maxlength="20" type="datetime" value="" class="form-control  date form_datetime" onchange="getDays(this.value,cnt)" placeholder="离店时间" data-date-format="yyyy-mm-dd hh:ii:ss" required="" aria-required="true">\n' +
            '     </div>\n' +
            '     <div class="col-sm-2">\n' +
            '         <input  name="totalDays" minlength="2" id="totalDays'+cnt+'" readonly maxlength="20" type="text" value="" class="form-control" required="" aria-required="true">\n' +
            '     </div>\n' +
            '     <div class="col-sm-2">\n' +
            '         <select class="form-control" onchange="getHouse(this.value,cnt);" id="housetTypeId'+cnt+'" required name="housetTypeId">\n' +
            '         </select>\n' +
            '     </div>\n' +
            '     <div class="col-sm-2">\n' +
            '         <select class="form-control" onchange="getHousePrice(this.value,cnt);" id="housetId'+cnt+'" required name="housetId">\n' +
            '         </select>\n' +
            '     </div>\n' +
            '     <div class="col-sm-2">\n' +
            '         <button type="button" style="background-color: inherit;border: 0" class="btn btn-default"><span class="glyphicon glyphicon-usd" name="houseP" style="color:blue" id="houseP'+cnt+'"></span></button>\n' +
            '         <a onclick="removeDiv(this);" id="remove'+cnt+'"><span style="margin-left: 5px"><i class="glyphicon glyphicon-minus-sign" style="color:red"></i></span></a>\n' +
            '     </div>\n' +
            ' </div>';
        $("#ffid").append(divHtml);
        addDivHouse(cnt);
        $(".form_datetime").datetimepicker({
            format: "yyyy-mm-dd hh:ii:ss",
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });
    }
    $(function () {
        $.post(
            "/customerOrder/getTypeList",
            function(data){
                $("#housetTypeId0").select2({
                    data: data
                });
                $.post(
                    "/customerOrder/getHouse/"+data[0].id,
                    function(data){
                        $("#housetId0").select2({
                            data: data
                        });
                        $.post(
                            "/house/findHouse/"+data[0].id,
                            function(data){
                                $("#houseP0").html(data.unitPrice);
                                $("#sumMoney").html(parseInt($("#houseP0").html()));
                            },
                            "json"
                        );
                    },
                    "json"
                );
            },
            "json"

        );
        //支付类型列表
        $.post(
            "/customerOrder/getSubject",
            function(data){
                $("#paymentTypeId").select2({
                    data: data
                });
                $("#paymentType_Id").select2({
                    data: data
                })
            },
            "json"

        );
        //网站列表
        $.post(
            "/customerOrder/getWeb",
            function(data){
                $("#websiteId").select2({
                    data: data
                })
            },
            "json"

        );
        $(".form_datetime").datetimepicker({
            format: "yyyy-mm-dd hh:ii:ss",
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });
    });
    function getHouse(id,cnt){
        $.post(
            "/customerOrder/getHouse/"+id,
            function(data){
                if(data==null || data==""){
                    $("#housetId"+cnt).html("<option value='-1'>无数据</option>");
                    $("#houseP"+cnt).html(0.0);
                }else{
                    $("#housetId"+cnt).html("");
                    $("#housetId"+cnt).select2({
                        data: data
                    });
                    $.post(
                        "/house/findHouse/"+data[0].id,
                        function(data){
                            $("#houseP"+cnt).html(data.unitPrice);
                            var number = "0";
                            for(var i=0;i<=cnt;i++){
                                number=parseInt(number)+parseInt($("#houseP"+i).html());
                            }
                            $("#sumMoney").html(parseInt(number));
                        },
                        "json"
                    );
                }
            },
            "json"
        );
    }
    function getHousePrice(id,cnt){
        if(id==-1){
            layer.msg('房间不存在', {icon:2,time:1000});
        }else{
            $.post(
                "/house/findHouse/"+id,
                function(data){
                    var days = $("#totalDays"+cnt).val();
                    if(days==""){
                        $("#houseP"+cnt).html(data.unitPrice);
                        var number = "0";
                        for(var i=0;i<=cnt;i++){
                            number+=parseInt($("#houseP"+i).html());
                        }
                        $("#sumMoney").html(parseInt(number));
                    }else{
                        $("#houseP"+cnt).html(parseInt(days.substring(0,days.length-1))*parseInt(data.unitPrice));
                        var number = "0";
                        for(var i=0;i<=cnt;i++){
                            number=parseInt(number)+parseInt($("#houseP"+i).html());
                        }
                        $("#sumMoney").html(parseInt(number));
                    }

                },
                "json"
            );
        }
    }
    function getDays(val,cnt) {
        var src = $("#checkinTime"+cnt).val();
        if(src==""){
            layer.msg('入住时间不能为空', {icon:2,time:1000});
        }else{
            var num = dateDiff(src.substring(0,10),val.substring(0,10))+"天";
            var numberVal = dateDiff(src.substring(0,10),val.substring(0,10))
            $("#totalDays"+cnt).val(num);
            $("#houseP"+cnt).html(parseInt($("#houseP"+cnt).html())*numberVal);
            var number = "0";
            for(var i=0;i<=cnt;i++){
                number=parseInt(number)+parseInt($("#houseP"+i).html());
            }
            $("#sumMoney").html(parseInt(number));
        }
    }
    function getSum(num){
        alert(num);
    }
    function dateDiff(startDateString, endDateString){
        var separator = "-"; //日期分隔符
        var startDates = startDateString.split(separator);
        var endDates = endDateString.split(separator);
        var startDate = new Date(startDates[0], startDates[1]-1, startDates[2]);
        var endDate = new Date(endDates[0], endDates[1]-1, endDates[2]);
        return parseInt(Math.abs(endDate - startDate ) / 1000 / 60 / 60 /24);//把相差的毫秒数转换为天数
    };
    function addDivHouse(id){
        $.post(
            "/customerOrder/getTypeList",
            function(data){
                $("#housetTypeId"+id).select2({
                    data: data
                });
                $.post(
                    "/customerOrder/getHouse/"+data[0].id,
                    function(data){
                        $("#housetId"+id).select2({
                            data: data
                        });
                        $.post(
                            "/house/findHouse/"+data[0].id,
                            function(data){
                                $("#houseP"+id).html(data.unitPrice);
                                $("#sumMoney").html(parseInt($("#sumMoney").html())+parseInt($("#houseP"+id).html()));
                            },
                            "json"
                        );
                    },
                    "json"
                );
            },
            "json"

        );
    }
    function removeDiv(e){
        $(e).parent().parent().remove();
        var num="0";
        var obj = document.getElementsByName("houseP");
        for(i=0;i<obj.length;i++){
            num = parseInt(num)+parseInt($("#"+obj[i].id).html());
        }
        $("#sumMoney").html(parseInt(num));
    }
</script>
--%>
</html>
