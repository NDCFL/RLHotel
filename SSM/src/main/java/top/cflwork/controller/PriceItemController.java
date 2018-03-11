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
import top.cflwork.service.PriceItemService;
import top.cflwork.vo.PriceItemVo;
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
@RequestMapping("priceItem")
public class PriceItemController {

    @Resource
    private PriceItemService priceItemService;
    @RequestMapping("priceItemList")
    @ResponseBody
    public PagingBean priceItemList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(priceItemService.count(new PageQuery(searchVal,userVo.getCompanyId())));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(priceItemService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal,userVo.getCompanyId())));
        return pagingBean;
    }
    @RequestMapping("findPriceItemList")
    @ResponseBody
    public PagingBean findPriceItemList(int pageSize, int pageIndex, String searchVal, HttpSession session,PriceItemVo priceItemVo) throws  Exception{
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            PagingBean pagingBean = new PagingBean();
            pagingBean.setPageSize(pageSize);
            pagingBean.setCurrentPage(pageIndex);
            //赋值给pagequery对象
            PageQuery pageQuery = new PageQuery();
            pageQuery.setCompanyId(userVo.getCompanyId());
            pageQuery.setSearchVal(searchVal);
            pageQuery.setPageSize(pagingBean.getPageSize());
            pageQuery.setPageNo(pagingBean.getStartIndex());
            pagingBean.setTotal(priceItemService.findPriceItemByCount(pageQuery,priceItemVo));
            pagingBean.setrows(priceItemService.findPriceItemList(pageQuery,priceItemVo));
            return pagingBean;
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }
    @RequestMapping("/priceItemAddSave")
    @ResponseBody
    public Message addSavepriceItem(PriceItemVo priceItem,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            priceItem.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            priceItemService.save(priceItem);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findPriceItem/{id}")
    @ResponseBody
    public PriceItemVo findpriceItem(@PathVariable("id") long id){
        PriceItemVo priceItem = priceItemService.getById(id);
        return priceItem;
    }
    @RequestMapping("/priceItemUpdateSave")
    @ResponseBody
    public Message updatepriceItem(PriceItemVo priceItem) throws  Exception{
        try{
            priceItemService.update(priceItem);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyPriceItem")
    @ResponseBody
    public Message deleteManypriceItem(@Param("manyId") String manyId,Integer status) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                priceItemService.updateStatus(new StatusQuery(Long.parseLong(s),status));
            }
            return Message.success("批量修改状态成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("批量修改状态失败!");
        }
    }
    @RequestMapping("/deletePriceItem/{id}")
    @ResponseBody
    public Message deletepriceItem(@PathVariable("id") long id) throws  Exception{
        try{
            priceItemService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/priceItemPage")
    public String table() throws  Exception{
        return "business/priceItemList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            priceItemService.updateStatus(new StatusQuery(id,status));
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
