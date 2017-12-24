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
    <title>房租列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>房租列表</h5>
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
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">房租名称：</label>
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
                <button id="btn_edit" type="button" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改
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
                    新增房租
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">业主姓名：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="master_Id" required name="masterId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">房源归属：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="hotel_Id" required name="hotelId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">房间名称：</label>
                        <div class="col-sm-8">
                            <input  name="houseName" min="0" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付总金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" min="0" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">签约年限：</label>
                        <div class="col-sm-8">
                            <input  name="payTime" min="0" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control"  required name="payType">
                                <option value="0">月付</option>
                                <option value="1">季付</option>
                                <option value="2">年付</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">首次支付日期：</label>
                        <div class="col-sm-8">
                            <input  name="payPeriodStart" minlength="2"  maxlength="20" type="date" value="" class="form-control  date form_datetime" placeholder="首次支付时间" data-date-format="yyyy-mm-dd" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">结算状态：</label>
                        <div class="col-sm-8">
                            <select class="form-control"  required name="isCash">
                                <option value="0">未结算</option>
                                <option value="1">已结算</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">备注：</label>
                        <div class="col-sm-8">
                            <textarea  name="description" minlength="2" id="reason1"  value="" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="add" class="btn btn-primary" data-dismiss="modal">
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
                    房租的修改
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="updateform">
                <input type="hidden" name="id" />
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">业主姓名：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="masterId" required name="masterId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">房源归属：</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="hotelId" required name="hotelId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">房间名称：</label>
                        <div class="col-sm-8">
                            <input  name="houseName" min="0" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付总金额：</label>
                        <div class="col-sm-8">
                            <input  name="totalPay" min="0" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">签约年限：</label>
                        <div class="col-sm-8">
                            <input  name="payTime" min="0" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">支付类型：</label>
                        <div class="col-sm-8">
                            <select class="form-control"  required name="payType">
                                <option value="0">月付</option>
                                <option value="1">季付</option>
                                <option value="2">年付</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">首次支付日期：</label>
                        <div class="col-sm-8">
                            <input  name="payPeriodStart" minlength="2"  maxlength="20" type="datetime" value="" class="form-control  date form_datetime" placeholder="首次支付时间" data-date-format="yyyy-mm-dd" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">结算状态：</label>
                        <div class="col-sm-8">
                            <select class="form-control"  required name="isCash">
                                <option value="0">未结算</option>
                                <option value="1">已结算</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" id="update" class="btn btn-primary" data-dismiss="modal">
                            确认修改
                        </button>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/houseRentPay.js"></script>
<script src="<%=path%>/static/js/select2.min.js"></script>
</body>
<script>
    $(function() {
        $.post(
            "/houseRentPay/getContractMaster",
            function (data) {

                $("#master_Id").select2({
                    data: data
                })
                $("#masterId").select2({
                    data: data
                })
            },
            "json"
        );
        $.post(
            "/houseRentPay/getHotel",
            function (data) {

                $("#hotel_Id").select2({
                    data: data
                })
                $("#hotelId").select2({
                    data: data
                })
            },
            "json"
        );
        $(".form_datetime").datetimepicker({
            format: "yyyy-mm-dd",
            language: 'zh-CN',
            autoclose: true,
            todayHighlight: true
        });
    });

</script>
</html>
