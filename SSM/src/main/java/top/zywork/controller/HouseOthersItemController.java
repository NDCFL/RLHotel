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
import top.zywork.service.HouseOthersItemService;
import top.zywork.vo.HouseOthersItemVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/12.
 */
@Controller
@RequestMapping("item")
public class HouseOthersItemController {
    @Resource
    private HouseOthersItemService houseOthersItemService;
    @RequestMapping("houseOthersItemList")
    @ResponseBody
    public PagingBean houseOthersItemList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(houseOthersItemService.count(new PageQuery(searchVal,userVo.getCompanyId())));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(houseOthersItemService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal,userVo.getCompanyId())));
        return pagingBean;
    }
    @RequestMapping("/getSubject")
    @ResponseBody
    public List<Select2Vo> getSubject(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        List<Select2Vo> subjectList = houseOthersItemService.subjectList(userVo.getCompanyId());
        return  subjectList;
    }
    @RequestMapping("/houseOthersItemAddSave")
    @ResponseBody
    public Message addSavehouseOthersItem(HouseOthersItemVo houseOthersItem, HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            houseOthersItem.setCompanyId(userVo.getCompanyId());
            houseOthersItemService.save(houseOthersItem);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findHouseOthersItem/{id}")
    @ResponseBody
    public HouseOthersItemVo findhouseOthersItem(@PathVariable("id") long id){
        HouseOthersItemVo houseOthersItem = houseOthersItemService.getById(id);
        return houseOthersItem;
    }
    @RequestMapping("/houseOthersItemUpdateSave")
    @ResponseBody
    public Message updatehouseOthersItem(HouseOthersItemVo houseOthersItem) throws  Exception{
        try{
            houseOthersItemService.update(houseOthersItem);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyHouseOthersItem")
    @ResponseBody
    public Message deleteManyhouseOthersItem(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                houseOthersItemService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteHouseOthersItem/{id}")
    @ResponseBody
    public Message deletehouseOthersItem(@PathVariable("id") long id) throws  Exception{
        try{
            houseOthersItemService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/houseOthersItemPage")
    public String table() throws  Exception{
        return "houseOthersItem/houseOthersItemList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            houseOthersItemService.updateStatus(new StatusQuery(id,status));
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
