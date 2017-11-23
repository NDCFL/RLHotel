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
import top.zywork.service.*;
import top.zywork.vo.HouseVo;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Controller
@RequestMapping("house")
public class HouseController {
    @Resource
    private HouseService houseService;
    @RequestMapping("houseList")
    @ResponseBody
    public PagingBean houseList(int pageSize, int pageIndex) throws  Exception{
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(houseService.count());
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(houseService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize())));
        return pagingBean;
    }
    @RequestMapping("/houseAddSave")
    @ResponseBody
    public Message addSaveHouse(HouseVo house) throws  Exception {
        try{
            house.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            houseService.save(house);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findHouse/{id}")
    @ResponseBody
    public HouseVo findhouse(@PathVariable("id") long id){
        HouseVo house = houseService.getById(id);
        return house;
    }
    @RequestMapping("/houseUpdateSave")
    @ResponseBody
    public Message updatehouse(HouseVo house) throws  Exception{
        try{
            houseService.update(house);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyHouse")
    @ResponseBody
    public Message deleteManyhouse(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                houseService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteHouse/{id}")
    @ResponseBody
    public Message deletehouse(@PathVariable("id") long id) throws  Exception{
        try{
            houseService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/housePage")
    public String table() throws  Exception{
        return "house/houseList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            houseService.updateStatus(new StatusQuery(id,status));
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
