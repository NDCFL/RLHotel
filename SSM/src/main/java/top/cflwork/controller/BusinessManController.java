package top.cflwork.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.cflwork.common.Message;
import top.cflwork.common.PagingBean;
import top.cflwork.enums.ActiveStatusEnum;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.BusinessManService;
import top.cflwork.vo.BusinessManVo;
import top.cflwork.vo.Select2Vo;
import top.cflwork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Controller
@RequestMapping("businessMan")
public class BusinessManController {

    @Resource
    private BusinessManService businessManService;
    @RequestMapping("businessManList")
    @ResponseBody
    public PagingBean businessManList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(businessManService.count(new PageQuery(searchVal,userVo.getCompanyId())));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(businessManService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal,userVo.getCompanyId())));
        return pagingBean;
    }
    @RequestMapping("/businessManAddSave")
    @ResponseBody
    public Message addSavebusinessMan(BusinessManVo businessMan,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            businessMan.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            businessMan.setType(ActiveStatusEnum.ACTIVE.getValue());
            businessManService.save(businessMan);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findBusinessMan/{id}")
    @ResponseBody
    public BusinessManVo findbusinessMan(@PathVariable("id") long id){
        BusinessManVo businessMan = businessManService.getById(id);
        return businessMan;
    }
    @RequestMapping("/businessManUpdateSave")
    @ResponseBody
    public Message updatebusinessMan(BusinessManVo businessMan) throws  Exception{
        try{
            businessManService.update(businessMan);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyBusinessMan")
    @ResponseBody
    public Message deleteManybusinessMan(@Param("manyId") String manyId,Integer status) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                businessManService.updateStatus(new StatusQuery(Long.parseLong(s),status));
            }
            return Message.success("批量修改状态成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("批量修改状态失败!");
        }
    }
    @RequestMapping("/deleteBusinessMan/{id}")
    @ResponseBody
    public Message deletebusinessMan(@PathVariable("id") long id) throws  Exception{
        try{
            businessManService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/businessManPage")
    public String table() throws  Exception{
        return "business/businessManList";
    }
    @RequestMapping("/getBusinessManList")
    @ResponseBody
    public List<Select2Vo> getBusinessManList() throws  Exception{
        return businessManService.businessManList();
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            businessManService.updateStatus(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            return  Message.fail("fail");
        }
    }
    @RequestMapping("updateType/{id}/{status}")
    @ResponseBody
    public Message updateType(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            businessManService.updateType(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            e.printStackTrace();
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
