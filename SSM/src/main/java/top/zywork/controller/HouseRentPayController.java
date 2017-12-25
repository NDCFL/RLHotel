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
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date dt=houseRentPayVo.getPayPeriodStart();
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(dt);
            rightNow.add(Calendar.YEAR,houseRentPayVo.getPayTime());//日期减1年
            Date dt1=rightNow.getTime();
            String reStr = sdf.format(dt1);
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            houseRentPayVo.setCompanyId(userVo.getCompanyId());
            houseRentPayVo.setPayPeriodEnd(sdf.parse(reStr));
            double firstPay = houseRentPayVo.getPayTime()*12;
            double sum = Double.parseDouble(houseRentPayVo.getTotalPay()+"");
            houseRentPayVo.setFirstPay(sum/firstPay);
            houseRentPayVo.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            houseRentPayService.save(houseRentPayVo);
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
    @RequestMapping("/houseRentPayUpdateSave")
    @ResponseBody
    public Message updateHouseRentPay(HouseRentPayVo houseRentPayVo) throws  Exception{
        try{
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date dt=houseRentPayVo.getPayPeriodStart();
            Calendar rightNow = Calendar.getInstance();
            rightNow.setTime(dt);
            rightNow.add(Calendar.YEAR,houseRentPayVo.getPayTime());//日期减1年
            Date dt1=rightNow.getTime();
            String reStr = sdf.format(dt1);
            houseRentPayVo.setPayPeriodEnd(sdf.parse(reStr));
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
}
