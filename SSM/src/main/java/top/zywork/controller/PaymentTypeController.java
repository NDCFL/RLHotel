package top.zywork.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.enums.ActiveStatusEnum;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.PaymentTypeService;
import top.zywork.vo.PaymentTypeVo;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/10/19.
 */
@Controller
@RequestMapping("paymentType")
public class PaymentTypeController {
    @Resource
    private PaymentTypeService paymentTypeService;
    @RequestMapping("paymentTypeList")
    @ResponseBody
    public PagingBean paymentTypeList(int pageSize, int pageIndex) throws  Exception{
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(paymentTypeService.count());
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(paymentTypeService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize())));
        return pagingBean;
    }
    @RequestMapping("/paymentTypeAddSave")
    @ResponseBody
    public Message addSavepaymentType(PaymentTypeVo paymentType) throws  Exception {
        try{
            paymentType.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            paymentTypeService.save(paymentType);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findpaymentType/{id}")
    @ResponseBody
    public PaymentTypeVo findpaymentType(@PathVariable("id") long id){
        PaymentTypeVo paymentType = paymentTypeService.getById(id);
        return paymentType;
    }
    @RequestMapping("/paymentTypeUpdateSave")
    @ResponseBody
    public Message updatepaymentType(PaymentTypeVo paymentType) throws  Exception{
        try{
            paymentTypeService.update(paymentType);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyPaymentType")
    @ResponseBody
    public Message deleteManypaymentType(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                paymentTypeService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deletePaymentType/{id}")
    @ResponseBody
    public Message deletepaymentType(@PathVariable("id") long id) throws  Exception{
        try{
            paymentTypeService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/paymentTypePage")
    public String table() throws  Exception{
        return "paymentType/paymentTypeList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            paymentTypeService.updateStatus(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            return  Message.fail("fail");
        }
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
