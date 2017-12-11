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
