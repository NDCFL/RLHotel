package top.zywork.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.enums.ActiveStatusEnum;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.RoleService;
import top.zywork.service.UserRoleService;
import top.zywork.service.UserService;
import top.zywork.vo.UserRoleVo;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/10/29.
 */
@RequestMapping("userRole")
@Controller
public class UserRoleController {
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;
    @RequestMapping("userRoleList")
    @ResponseBody
    public PagingBean userRoleList(int pageSize, int pageIndex) throws  Exception{
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(userRoleService.count());
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(userRoleService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize())));
        return pagingBean;
    }
    @RequestMapping("/userRoleAddSave")
    @ResponseBody
    public Message addSaveuserRole(UserRoleVo userRole) throws  Exception {
        try{
            userRole.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            userRoleService.save(userRole);
            return  Message.success("新增成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findUserRoleVo/{id}")
    @ResponseBody
    public UserRoleVo findUserRole(@PathVariable("id") long id){
        UserRoleVo userRole = userRoleService.getById(id);
        return userRole;
    }
    @RequestMapping("/userRoleUpdateSave")
    @ResponseBody
    public Message updateuserRole(UserRoleVo userRole) throws  Exception{
        try{
            userRoleService.update(userRole);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyUserRole")
    @ResponseBody
    public Message deleteManyuserRole(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                userRoleService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteUserRole/{id}")
    @ResponseBody
    public Message deleteuserRole(@PathVariable("id") long id) throws  Exception{
        try{
            userRoleService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/userRolePage")
    public ModelAndView table() throws  Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("role/userRoleList");
        modelAndView.addObject("userList",userService.getUserIdAndName());
        modelAndView.addObject("roleList",roleService.getRoleIdAndTitle());
        return modelAndView;
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            userRoleService.updateStatus(new StatusQuery(id,status));
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
