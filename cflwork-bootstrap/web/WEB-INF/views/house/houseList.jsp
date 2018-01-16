<%--
  Created by IntelliJ IDEA.
  User: chenfeilong
  Date: 3017/6/19
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
    <title>房型列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>房型列表</h5>
        </div>
        <div class="ibox-content">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-1 control-label" style="line-height: 30px;width:100px">分店名称</label>
                    <div class="col-sm-1" style="width: 120px" >
                        <select class="form-control"  id="hotelId_" style="width: 130px;margin-left: -40px" onchange="getCardTitle(this.value);" required name="hotelId">

                        </select>
                    </div>
                    <label class="col-sm-1 control-label" style="width:100px;line-height: 30px;margin-left: -20px">房型名称</label>
                    <div class="col-sm-1" style="width: 120px" >
                        <select class="form-control"  id="houseType_" style="width: 130px;margin-left: -40px" required name="type">
                            <option value="">全部</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label" style="width:100px;line-height: 30px;margin-left: -20px">房型状态</label>
                    <div class="col-sm-1" style="width: 120px" >
                        <select class="form-control"  id="isActive" style="width: 130px;margin-left: -40px" required name="isActive">
                            <option value="">全部</option>
                            <option value="0">启用</option>
                            <option value="1">停用</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label" style="width:100px;line-height: 30px;margin-left: -20px">房型类别</label>
                    <div class="col-sm-1" style="width: 120px" >
                        <select class="form-control"  id="house__Type" style="width: 130px;margin-left: -40px" required name="houseType">
                            <option value="">全部</option>
                            <option value="0">真实房间</option>
                            <option value="1">虚拟房间</option>
                        </select>
                    </div>
                    <label class="col-sm-1 control-label" style="width:100px;line-height: 30px;margin-left: -20px">房号</label>
                    <div class="col-sm-1" style="width: 120px" >
                        <input type="text" class="form-control" id="title" placeholder="请输入房间名称" style="width: 160px;margin-left: -40px" name="title"/>
                    </div>
                    <div class="col-sm-1" style="width: 120px;margin-left: 20px" >
                        <button class="btn btn-primary" id="search_btn" style="width: 60px">查询</button>
                    </div>
                </div>
            </div>
            <table id="mytab" name="mytab" class="table table-hover"></table>
            <div id="toolbar" class="btn-group pull-right" style="margin-right: 30px;">
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
                    新增房型
                </h4>
            </div>
            <form method="post" id="form" role="form" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">所属酒店：</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="hotelId" onchange="getCardTitle(this.value);"  name="hotelId" required>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">酒店房号：</label>
                    <div class="col-sm-6">
                        <input type="text" id="cardTitle" name="cardTitle" placeholder="请输入房号多个房号用','号分割" required class="form-control"> <span class="help-block m-b-none" id="card_title"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间类型：</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="type" name="type" onchange="getInfo(this.value);"  required>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间类别：</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="houseType" name="houseType" required>
                            <option value="0">真实房间</option>
                            <option value="1">虚拟房间</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间描述：</label>
                    <div class="col-sm-6">
                        <textarea class="form-control" name="description" ></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-3">
                        <button class="btn btn-primary"  type="submit">新增</button>
                        <button class="btn btn-white" type="button" data-dismiss="modal">取消</button>
                    </div>
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
                    房型的修改
                </h4>
            </div>
            <form method="post" id="form1" role="form" class="form-horizontal">
                <input type="hidden"  id="id" name="id" value="">
                <input type="hidden"  id="ca" name="ca" value="">
                <div class="form-group">
                    <label class="col-sm-3 control-label">所属酒店：</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="hotel_Id"  onchange="getCardTitle(this.value);"
                                name="hotelId" required>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房号</label>
                    <div class="col-sm-6">
                        <input type="text" name="cardTitle" id="cardTitle_" required class="form-control"> <span
                            class="help-block m-b-none" id="card"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间类型：</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="type" id="house_Type" onchange="getInfo(this.value);"
                                required>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间类别：</label>
                    <div class="col-sm-6">
                        <select class="form-control" name="houseType" required>
                            <option value="0">真实房间</option>
                            <option value="1">虚拟房间</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间描述</label>
                    <div class="col-sm-6">
                        <textarea class="form-control" id="description" name="description" required></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">房间状态：</label>
                    <div class="col-sm-6">
                        <select class="form-control" id="houseStatus" name="houseStatus" required>
                            <option value="0" id="status0">未入住</option>
                            <option value="1" id="status1">已入住</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-3">
                        <button class="btn btn-primary" type="submit">修改</button>
                        <button class="btn btn-white" type="button" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/house.js"></script>
</body>
<%--<script>--%>
    <%--$(function () {--%>
        <%--alert("asdflsfa");--%>
        <%--layer.msg('已发布', {icon:1,time:200});--%>
        <%--layer.msg('已发布', {icon:3,time:200});--%>
        <%--layer.msg('已发布', {icon:3,time:200});--%>
        <%--layer.msg('已发布', {icon:4,time:200});--%>
        <%--layer.msg('已发布', {icon:5,time:200});--%>
        <%--layer.msg('已发布', {icon:6,time:200});--%>
        <%--layer.msg('已发布', {icon:7,time:200});--%>
        <%----%>
    <%--});--%>
<%--</script>--%>
<script>
    $.post(
        "/house/getHotelList",
        function(data){
            $("#hotelId").select2({
                data: data
            });
            $("#hotel_Id").select2({
                data: data
            })
            $("#hotelId_").select2({
                data: data
            })
            $("#select2-hotelId-container").remove();
            $("#select2-hotel_Id-container").remove();
            $("#select2-hotelId_-container").remove();
            var id = data[0].id;
            $.post(
                "/house/getTypeList/"+id,
                function(data){
                    $("#type").select2({
                        data: data
                    })
                    $("#house_Type").select2({
                        data: data
                    })
                    $("#houseType_").select2({
                        data: data
                    })
                    $("#select2-type-container").remove();
                    $("#select2-house_Type-container").remove();
                    $("#select2-houseType_-container").remove();
                },
                "json"
            );
            var text = data[0].text;
            $.post(
                "/house/getHouseCardTitle/"+data[0].id,
                function(data) {
                    if (data.cardTitle == null || data.cardTitle == "") {
                        $("#card_title").html(text + "酒店还没有添加房号");
                        $("#card_title").css("color", "red");
                        $("#card").html(text + "酒店还没有添加房号");
                        $("#card").css("color", "red");
                    } else {
                        $("#card_title").html(text + "酒店现已有如下房号，请不要重复房号:" + data.cardTitle);
                        $("#card_title").css("color", "red");
                        $("#card").html(text + "酒店现已有如下房号，请不要重复房号:" + data.cardTitle);
                        $("#card").css("color", "red");
                    }
                },
                "json"
            );
        },
        "json"
    );
    function getCardTitle(val) {
        $.post(
            "/house/getHouseCardTitle/"+val,
            function(data){
                if(data.cardTitle==null || data.cardTitle==""){
                    $("#card_title").html($("#hotelId").find("option:selected").text()+"酒店还没有添加房号");
                    $("#card_title").css("color","red");
                    $("#card").html($("#hotelId").find("option:selected").text()+"酒店还没有添加房号");
                    $("#card").css("color","red");
                }else{
                    $("#card_title").html($("#hotelId").find("option:selected").text()+"酒店现已有如下房号，请不要重复房号:"+data.cardTitle);
                    $("#card_title").css("color","red");
                    $("#card").html($("#hotelId").find("option:selected").text()+"酒店现已有如下房号，请不要重复房号:"+data.cardTitle);
                    $("#card").css("color","red");
                }

            },
            "json"
        );
        $.post(
            "/house/getTypeList/"+val,
            function(data){
                $("#type").html("");
                $("#house_Type").html("");
                $("#houseType_").html("");
                $("#type").select2({
                    data: data
                })
                $("#house_Type").select2({
                    data: data
                })
                $("#houseType_").select2({
                    data: data
                })
                $("#select2-type-container").remove();
                $("#select2-house_Type-container").remove();
                $("#select2-houseType_-container").remove();

            },
            "json"
        );
    }
</script>
</html>
