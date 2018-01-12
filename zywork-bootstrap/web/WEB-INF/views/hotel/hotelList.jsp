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
    <title>分店管理</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>分店管理</h5>
        </div>
        <div class="ibox-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">酒店名称：</label>
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
                <!--
                 <button id="btn_edit" type="button" class="btn btn-default" style="display: block; border-radius: 0">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>批量修改状态
                </button>
                <button id="btn_delete" onclick="deleteMany();" type="button" class="btn btn-default" style="display: block;">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>批量删除
                </button>-->
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
                    新增酒店
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">签约编号：</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="contractId" id="contract_Id" required >

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">酒店店长：</label>
                        <div class="col-sm-8">
                            <select class="form-control"  id="landlord_Id" required name="hotelManagerId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">酒店名称：</label>
                        <div class="col-sm-8">
                            <input  name="title" minlength="2" maxlength="20" type="text" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">酒店热线：</label>
                        <div class="col-sm-8">
                            <input  name="tel" minlength="2" maxlength="20" type="text" class="form-control" required="" aria-required="true">
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
                    酒店的修改
                </h4>
            </div>
            <form class="form-horizontal" id="updateform" >
                <div class="modal-body">
                    <input type="hidden" name="id" id="id" value="">
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">签约编号：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="contractId" required name="contractId">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">酒店店长：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="landlordId" required name="hotelManagerId">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">酒店名称：</label>
                            <div class="col-sm-8">
                                <input  name="title" id="title" minlength="2" maxlength="20" type="text" class="form-control" required="" aria-required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">酒店热线：</label>
                            <div class="col-sm-8">
                                <input  name="tel" id="tel" minlength="2" maxlength="20" type="text" class="form-control" required="" aria-required="true">
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
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/hotel.js"></script>
<script src="<%=path%>/static/js/select2.min.js"></script>
</body>
<script>
    $(function() {
        $.post(
            "/hotel/getContract",
            function (data) {

                $("#contract_Id").select2({
                    data: data,
                    placeholder: '请选择签约编号',
                    allowClear: false
                })
                $("#contractId").select2({
                    data: data,
                    placeholder: '请选择房东请选择签约编号',
                    allowClear: false
                })
            },
            "json"
        );
        $.post(
            "/hotel/getLandlord",
            function (data) {

                $("#landlord_Id").select2({
                    data: data,
                    placeholder: '请选择酒店店长',
                    allowClear: false
                })
                $("#landlordId").select2({
                    data: data,
                    placeholder: '请选择酒店店长',
                    allowClear: false
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

</script>
</html>
