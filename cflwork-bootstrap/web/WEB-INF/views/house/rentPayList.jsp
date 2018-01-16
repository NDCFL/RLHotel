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
    <title>分成房租列表</title>
    <jsp:include page="../common/bootstraptablecss.jsp"></jsp:include>
</head>
<body class="gray-bg">
<div class="col-lg-12">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>分成房租明细统计</h5>
        </div>
        <div class="ibox-content">
            <div class="row">
                <div class="col-xs-2">
                    <div style="margin-top: 5%">
                        <div style="float: left;">
                            <p>待结算总额</p>
                            <p>&nbsp;</p>
                            <p>3000</p>
                            <hr/>
                            <p>结算总收益</p>
                        </div>
                        <div style="float: right">
                            <p>待结算总额</p>
                            <p>&nbsp;</p>
                            <p>6000</p>
                            <hr/>
                            <p>当前应付合计</p>
                        </div>
                    </div>
                </div>
                <div class="col-xs-2">
                    <small class="stats-label" >
                        <input  name="payTime" min="0" max="100" onchange="addCount(this.value);" placeholder="签约年限" type="date" class="form-control" required="" aria-required="true">
                    </small>
                    <hr/>
                    <p class="stats-label">费用合计</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">单间每月</p>
                </div>
                <div style="float:left;width: 1px;height: 200px; background: #87CBCA;"></div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>水费</h4></small>
                    <hr/>
                    <p class="stats-label">7000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">900</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>物业费</h4></small>
                    <hr/>
                    <p class="stats-label">6000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">888</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>空调费</h4></small>
                    <hr/>
                    <p class="stats-label">3000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">800</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>宽带</h4></small>
                    <hr/>
                    <p class="stats-label">8000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">800</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>供暖费</h4></small>
                    <hr/>
                    <p class="stats-label">1000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">60</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>布草洗涤</h4></small>
                    <hr/>
                    <p class="stats-label">3000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">200</p>
                </div>
                <div class="col-xs-1" style="margin-top:1%">
                    <small class="stats-label" ><h4>合计</h4></small>
                    <hr/>
                    <p class="stats-label">30000</p>
                    <p class="stats-label">&nbsp;</p>
                    <p class="stats-label">100</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>所有店面</h5>
                </div>
                <div class="ibox-content">
                    <select class="form-control" id="hotelId_" onchange="getInfo(this.value)" required name="masterId">
                        <option value="">所有店面</option>
                    </select>
                    <div class="stat-percent font-bold text-info">20%
                        <i class="fa fa-level-up"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>房源总数</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="houseTotal"></h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>房源总数</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>待结算总额</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="dfPayMoney"></h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>待结算总额</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>当前应付</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="monthPayMoney"></h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>当前应付</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>每间/每月</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="houseMonthPayMoney">275,800</h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>每间/每月</small>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-info pull-right">全年</span>
                    <h5>每间/每天</h5>
                </div>
                <div class="ibox-content">
                    <h1 class="no-margins" id="houseDayPayMoney"></h1>
                    <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i>
                    </div>
                    <small>每间/每天</small>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>分成房租列表</h5>
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
                    分成房租列表
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <table id="mytab" name="mytab" class="table table-hover"></table>
                </div>
            </div>

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
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="webAddTitle">
                    新增分成房租
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="formadd">
                <div class="modal-body">
                    <h4 class="modal-title" id="webAddTitle1">
                        签约信息
                    </h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">业主姓名：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="master_Id" required name="masterId">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label">房源归属：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="hotel_Id" required name="hotelId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间名称：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="house_Id" required name="houseId">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label">支付总金额：</label>
                        <div class="col-sm-4">
                            <input  name="totalPay" min="0" placeholder="支付总金额" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">签约年限：</label>
                        <div class="col-sm-4">
                            <input  name="payTime" min="0" max="100"  placeholder="签约年限" type="number" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-2 control-label">支付类型：</label>
                        <div class="col-sm-4">
                            <select class="form-control"  required name="payType">
                                <option value="1">1/月付</option>
                                <option value="2">2/月付</option>
                                <option value="3">3/月付</option>
                                <option value="4">4/月付</option>
                                <option value="6">6/月付</option>
                                <option value="12">12/月付</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">首次支付日期：</label>
                        <div class="col-sm-4">
                            <input  name="firstPayTime"  minlength="2" id="test2"  maxlength="20" type="date" value="" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-2 control-label">合同开始日期：</label>
                        <div class="col-sm-4">
                            <input  name="payPeriodStart"  minlength="2"  maxlength="20" type="date" id="test1" value="" class="form-control"  required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group" id="house_count">

                    </div>
                    <hr/>
                    <h4 class="modal-title" id="webAddTitle2">
                        房源信息
                    </h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">面积</label>
                        <div class="col-sm-3">
                            <input  name="area" min="0" placeholder="房间面积" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">楼层</label>
                        <div class="col-sm-3">
                            <input  name="houseCount" min="0" placeholder="房间楼层" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">装修</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="zhuangxiu">
                                <option value="0">毛坯</option>
                                <option value="1">简装</option>
                                <option value="2">精装</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">水电</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="shuidian">
                                <option value="0">商水商电</option>
                                <option value="1">民水民电</option>
                                <option value="2">商水民电</option>
                                <option value="3">民水商电</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">空调</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="kongtiao">
                                <option value="0">有</option>
                                <option value="1">无</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">供暖</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="gongnuan">
                                <option value="0">有</option>
                                <option value="1">无</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">物业</label>
                        <div class="col-sm-3">
                            <input  name="wuye" min="0" placeholder="物业费用/平米" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">结算状态：</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="isCash">
                                <option value="0">未结算</option>
                                <option value="1">已结算</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">保底房租</label>
                        <div class="col-sm-3">
                            <input  name="baodiPay" min="0" placeholder="保底房租" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">备注</label>
                        <div class="col-sm-11">
                            <textarea  name="description" placeholder="备注" minlength="2" id="reason1"  value="" class="form-control" required="" aria-required="true"></textarea>
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
    <div class="modal-dialog  modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    修改分成房租
                </h4>
            </div>
            <form class="form-horizontal" method="post" id="updateform">
                <div class="modal-body">
                    <h4 class="modal-title" >
                        签约信息
                    </h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">业主姓名：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="masterId" required name="masterId">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label">房源归属：</label>
                        <div class="col-sm-4">
                            <select class="form-control" onchange="getHouse(this.value);" id="hotelId" required name="hotelId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">房间名称：</label>
                        <div class="col-sm-4">
                            <select class="form-control" id="houseId" required name="houseId">

                            </select>
                        </div>
                        <label class="col-sm-2 control-label">支付总金额：</label>
                        <div class="col-sm-4">
                            <input  name="totalPay" min="0" placeholder="支付总金额" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">签约年限：</label>
                        <div class="col-sm-4">
                            <input  name="payTime" min="0" max="100" onchange="addCount(this.value);" placeholder="签约年限" type="number" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-2 control-label">支付类型：</label>
                        <div class="col-sm-4">
                            <select class="form-control"  required name="payType">
                                <option value="1">1/月付</option>
                                <option value="2">2/月付</option>
                                <option value="3">3/月付</option>
                                <option value="4">4/月付</option>
                                <option value="6">6/月付</option>
                                <option value="12">12/月付</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">首次支付日期：</label>
                        <div class="col-sm-4">
                            <input  name="firstPayTime"   id="test_3"  type="date" value="" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-2 control-label">合同开始日期：</label>
                        <div class="col-sm-4">
                            <input  name="payPeriodStart"  minlength="2"  id="test_4" maxlength="20" type="date" class="form-control"  value=""  required="" aria-required="true">
                        </div>

                    </div>
                    <h4 class="modal-title" id="">
                        房源信息
                    </h4>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">面积</label>
                        <div class="col-sm-3">
                            <input  name="area" min="0" placeholder="房间面积" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">楼层</label>
                        <div class="col-sm-3">
                            <input  name="houseCount" min="0" placeholder="房间楼层" max="100" type="number" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">装修</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="zhuangxiu">
                                <option value="0">毛坯</option>
                                <option value="1">简装</option>
                                <option value="2">精装</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">水电</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="shuidian">
                                <option value="0">商水商电</option>
                                <option value="1">民水民电</option>
                                <option value="2">商水民电</option>
                                <option value="3">民水商电</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">空调</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="kongtiao">
                                <option value="0">有</option>
                                <option value="1">无</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">供暖</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="gongnuan">
                                <option value="0">有</option>
                                <option value="1">无</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">物业</label>
                        <div class="col-sm-3">
                            <input  name="wuye" min="0" placeholder="物业费用/平米" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                        <label class="col-sm-1 control-label">结算状态：</label>
                        <div class="col-sm-3">
                            <select class="form-control"  required name="isCash">
                                <option value="0">未结算</option>
                                <option value="1">已结算</option>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label">保底房租</label>
                        <div class="col-sm-3">
                            <input  name="baodiPay" min="0" placeholder="保底房租" max="100" type="text" class="form-control" required="" aria-required="true">
                        </div>
                    </div>
                    <hr/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">备注</label>
                        <div class="col-sm-11">
                            <textarea  name="description" placeholder="备注" minlength="2"  value="" class="form-control" required="" aria-required="true"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                   <!--
                     <button type="button" id="update" class="btn btn-primary" data-dismiss="modal">
                        确认修改
                    </button>
                   -->
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="fukuan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">分成房租付款</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="fu_kuan">
                    <input type="hidden" name="id" id="id"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">本期应还金额</label>
                        <div class="col-sm-8">
                            <input  id="first_pay" name="firstPay" min="0"  max="100" type="text" class="form-control" required="" value="" aria-required="true">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" id="huankuan" class="btn btn-primary">确认还款</button>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--网站信息的修改--%>
<jsp:include page="../common/bootstraptablejs.jsp"></jsp:include>
<script src="<%=path%>/static/js/pageJs/rentPay.js"></script>
<script src="<%=path%>/static/js/select2.min.js"></script>
</body>
<script>
    lay('#version').html('-v'+ laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
    });
    laydate.render({
        elem: '#test2' //指定元素
    });
    laydate.render({
        elem: '#test3' //指定元素
    });
    laydate.render({
        elem: '#test4' //指定元素
    });
</script>
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
                $("#hotelId_").select2({
                    data: data
                })
                $.post(
                    "/rentPay/getHouse/"+data[0].id,
                    function (data) {
                        $("#houseId").select2({
                            data: data
                        })
                        $("#house_Id").select2({
                            data: data
                        })
                    },
                    "json"
                );
            },
            "json"
        );

    });
    function getHouse(id) {
        $.post(
            "/rentPay/getHouse/"+id,
            function (data) {
                $("#houseId").select2({
                    data: data
                })
                $("#house_Id").select2({
                    data: data
                })
            },
            "json"
        );
    }
</script>
<script>
    $(function () {
        getHotelInfo();
    });
    function getInfo(id) {
        getHotelInfo();
    }
    function getHotelInfo(){
        var hotelId = $("#hotelId_").val();
        $.post(
            "<%=path%>/rentPay/hotelInfo",
            {
                "hotelId":hotelId
            },
            function (data) {
                $("#houseTotal").html(data.houseTotal);//房源总数
                $("#dfPayMoney").html("￥"+data.dfPayMoney);//代付资金
                $("#monthPayMoney").html("￥"+data.monthPayMoney);//代付资金
                $("#houseMonthPayMoney").html("￥"+data.houseMonthPayMoney);//每间每月
                $("#houseDayPayMoney").html("￥"+data.houseDayPayMoney);//每间，每天
                $("#chaoqiPayMoney").html("￥"+data.chaoqiPayMoney);//超期未付
                $("#fiveDayPayMoney").html("￥"+data.fiveDayPayMoney);//近5日待付
                $("#thisMonthPayMoney").html("￥"+data.thisMonthPayMoney);//本月应付
                $("#thisMonthPayAll").html("￥"+data.thisMonthPayAll);//本月已付租金总额
                $("#thisMonthNotPay").html("￥"+data.thisMonthNotPay);//本月待付
                $("#nextMonthPay").html("￥"+data.nextMonthPay);//次月应付
            },
            "json"
        );
    }
</script>
</html>
