package top.zywork.controller;

import org.apache.http.protocol.HTTP;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.zywork.common.DateParseUtils;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.enums.ActiveStatusEnum;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouseRentPayService;
import top.zywork.vo.HouseRentPayVo;
import top.zywork.vo.HouseRentVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/24.
 */
@Controller
@RequestMapping("houseRentPay")
public class HouseRentPayController  { 
    @Resource
    private HouseRentPayService houseRentPayService;
    @RequestMapping("houseRentPayList")
    @ResponseBody
    public PagingBean houseList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        PageQuery pageQuery = new PageQuery();
        pageQuery.setCompanyId(userVo.getCompanyId());
        pageQuery.setSearchVal(searchVal);
        pagingBean.setTotal(houseRentPayService.count(pageQuery));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pageQuery.setPageNo(pagingBean.getStartIndex());
        pageQuery.setPageSize(pagingBean.getPageSize());
        pagingBean.setrows(houseRentPayService.listPage(pageQuery));
        return pagingBean;
    }
    @RequestMapping("/getContractMaster")
    @ResponseBody
    public List<Select2Vo> getContractMaster(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        return  houseRentPayService.getContractMaster(userVo.getCompanyId());

    }
    @RequestMapping("/getHotel")
    @ResponseBody
    public List<Select2Vo> getHotel(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        return  houseRentPayService.getHotel(userVo.getCompanyId());

    }
    @RequestMapping("/houseRentPayAddSave")
    @ResponseBody
    public Message addSaveHouseRentPay(HouseRentPayVo houseRentPayVo,HttpSession session) throws  Exception {
        try{
            List<HouseRentPayVo> houseRentPayVoList = new ArrayList<>();
            houseRentPayVo.setPayPeriodEnd(getDate(houseRentPayVo.getPayPeriodStart(),houseRentPayVo.getPayTime()));
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            houseRentPayVo.setCompanyId(userVo.getCompanyId());
            houseRentPayVo.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            Integer countInfo[] = houseRentPayVo.getCount();
            int cnt = countInfo.length;
            for (int i=0;i<cnt;i++){
                houseRentPayVo.setSpareMoney(Double.parseDouble(countInfo[i]+""));//当前合同剩余支付金额，默认初始化为未支付状态
                houseRentPayVo.setPayFactTime(1);//最小单位为1年
                BigDecimal b = new BigDecimal(Double.parseDouble(countInfo[i]+""));
                houseRentPayVo.setFactPay(b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());//每个合同所需支付的全年金额总和
                houseRentPayVo.setFirstPay(b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue()/(12/houseRentPayVo.getPayType()));//首付租金，根据选择的付款状态来决定
                houseRentPayVo.setPayCount(12/houseRentPayVo.getPayType());//分多少期付款
                houseRentPayVo.setFactPayTimeStart(getDate(houseRentPayVo.getPayPeriodStart(),i));//第一期合同开始时间
                houseRentPayVo.setFactPayTimeEnd(getDate(houseRentPayVo.getPayPeriodStart(),(i+1)));//第一期合同结束时间
                houseRentPayVo.setFactedPayTimeStart(getDate(houseRentPayVo.getFirstPayTime(),i));//第一个合同首付租金日期
                houseRentPayVo.setFactedPayTimeEnd(getDateByMonth(houseRentPayVo.getFactPayTimeStart(),houseRentPayVo.getPayType()));//第一个合同首付结束时间
                houseRentPayVo.setDayPay(houseRentPayVo.getFactPay()/(datediffDay(getDate(houseRentPayVo.getFirstPayTime(),i),getDate(houseRentPayVo.getPayPeriodStart(),(i+1)))));//每天付款金额总金额/总天数
                houseRentPayVo.setMonthPay(houseRentPayVo.getFactPay()/(monthCount(getDate(houseRentPayVo.getFirstPayTime(),i),getDate(houseRentPayVo.getPayPeriodStart(),(i+1)))));//每月的租金总和
                houseRentPayVoList.add(houseRentPayVo);
                houseRentPayService.save(houseRentPayVo);
            }
            return  Message.success("新增成功!");
        }catch (Exception E){
            E.printStackTrace();
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findHouseRentPay/{id}")
    @ResponseBody
    public HouseRentPayVo findHouseRentPay(@PathVariable("id") long id){
        HouseRentPayVo house = houseRentPayService.getById(id);
        return house;
    }
    @RequestMapping("/hotelInfo")
    @ResponseBody
    public HouseRentVo hotelInfo(Long hotelId){
        if(hotelId==null){
            return houseRentPayService.notHotelId();
        }else{
            return  houseRentPayService.haveHotelId(hotelId);
        }

    }
    @RequestMapping("/houseRentPayUpdateSave")
    @ResponseBody
    public Message updateHouseRentPay(HouseRentPayVo houseRentPayVo) throws  Exception{
        try{
            houseRentPayVo.setPayPeriodEnd(getDate(houseRentPayVo.getPayPeriodStart(),houseRentPayVo.getPayTime()));
            double firstPay = houseRentPayVo.getPayTime()*12;
            double sum = Double.parseDouble(houseRentPayVo.getTotalPay()+"");
            houseRentPayVo.setFirstPay(sum/firstPay);
            houseRentPayService.update(houseRentPayVo);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyHouseRentPay")
    @ResponseBody
    public Message deleteManyhouse(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                houseRentPayService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteHouseRentPay/{id}")
    @ResponseBody
    public Message deleteHouseRentPay(@PathVariable("id") long id) throws  Exception{
        try{
            houseRentPayService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/houseRentPayPage")
    public String table() throws  Exception{
        return "house/houseRentPayList";
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            houseRentPayService.updateStatus(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            return  Message.fail("fail");
        }
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    public Date getDate(Date date, Integer cnt){
        try{
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(date);
            rightNow.add(Calendar.YEAR,cnt);
            Date dt1=rightNow.getTime();
            String reStr = sdf.format(dt1);
            return  sdf.parse(reStr);
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }
    public Date getDateByMonth(Date date, Integer cnt){
        try{
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(date);
            rightNow.add(Calendar.MONTH,cnt);
            Date dt1=rightNow.getTime();
            String reStr = sdf.format(dt1);
            return  sdf.parse(reStr);
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }
    public int datediffDay(Date date1,Date date2){
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
        return days;
    }
    public int monthCount(Date date1,Date date2) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        Calendar bef = Calendar.getInstance();
        Calendar aft = Calendar.getInstance();
        bef.setTime(date1);
        aft.setTime(date2);
        int result = aft.get(Calendar.MONTH) - bef.get(Calendar.MONTH);
        int month = (aft.get(Calendar.YEAR) - bef.get(Calendar.YEAR)) * 12;
        return Math.abs(month + result);
    }
}
