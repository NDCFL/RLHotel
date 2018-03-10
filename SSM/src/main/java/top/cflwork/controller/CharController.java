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
import top.cflwork.service.CharService;
import top.cflwork.vo.CharVo;
import top.cflwork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Controller
@RequestMapping("char")
public class CharController {

    @Resource
    private CharService charService;
    @RequestMapping("charList")
    @ResponseBody
    public PagingBean charList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(charService.count(new PageQuery(searchVal,userVo.getCompanyId())));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(charService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal,userVo.getCompanyId())));
        return pagingBean;
    }
    @RequestMapping("/charAddSave")
    @ResponseBody
    public Message addSavechar(CharVo chars,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            chars.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            charService.save(chars);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findChar/{id}")
    @ResponseBody
    public CharVo findchar(@PathVariable("id") long id){
        CharVo chars = charService.getById(id);
        return chars;
    }
    @RequestMapping("/charUpdateSave")
    @ResponseBody
    public Message updatechar(CharVo chars) throws  Exception{
        try{
            charService.update(chars);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyChar")
    @ResponseBody
    public Message deleteManychar(@Param("manyId") String manyId,Integer status) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                charService.updateStatus(new StatusQuery(Long.parseLong(s),status));
            }
            return Message.success("批量修改状态成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("批量修改状态失败!");
        }
    }
    @RequestMapping("/deleteChar/{id}")
    @ResponseBody
    public Message deletechar(@PathVariable("id") long id) throws  Exception{
        try{
            charService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/charPage")
    public String table() throws  Exception{
        return "business/charList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            charService.updateStatus(new StatusQuery(id,status));
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
