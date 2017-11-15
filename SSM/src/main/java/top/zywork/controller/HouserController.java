package top.zywork.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.*;
import top.zywork.vo.RoleVo;
import top.zywork.vo.UserRoleVo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Controller
@RequestMapping("houser")
public class HouserController {
    @Resource
    private UserService userService;
    @Resource
    private HouserService houserService;
    @Resource
    private RoleService roleService;
    @Resource
    private UserRoleService userRoleService;

    @RequestMapping("houserList")
    @ResponseBody
    public PagingBean houserList(int pageSize, int pageIndex) throws Exception {
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(houserService.count());
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(houserService.listPage(new PageQuery(pagingBean.getStartIndex(), pagingBean.getPageSize())));
        return pagingBean;
    }

    @RequestMapping("addHouser")
    @ResponseBody
    public Message addHouser(UserVo userVo) {
        userVo.setHeadicon("static/img/face.gif");
        userVo.setIsActive((byte) 0);
        userVo.setPassword(new Md5Hash(userVo.getPassword()).toString());
        userVo.setNickname(userVo.getPhone());
        //保存店长信息
        userService.save(userVo);
        //通过新增的店长的手机号获取新增店长的id
        UserVo userVo1 = userService.findByPhone(userVo.getPhone());
        //通过权限名称来获取到权限的id
        RoleVo roleVo = roleService.findByName("房东");
        UserRoleVo userRoleVo = new UserRoleVo();
        if (roleVo.getId() == 0) {
            return Message.fail("房东角色不存在!");
        } else {
            //同时把信息保存到用户权限表中
            userRoleVo.setIsActive((byte) 0);
            userRoleVo.setUserId(userVo1.getId());
            userRoleVo.setRoleId(roleVo.getId());
            userRoleService.save(userRoleVo);
            return Message.success("房东账号新增成功!");
        }
    }
    @RequestMapping("/findHouser/{id}")
    @ResponseBody
    public UserVo findHouser(@PathVariable("id") long id) {
        UserVo houser = houserService.getById(id);
        return houser;
    }

    @RequestMapping("/houserUpdateSave")
    @ResponseBody
    public Message updateHouser(UserVo houser) throws Exception {
        try {
            houserService.update(houser);
            return Message.success("修改成功!");
        } catch (Exception e) {
            return Message.fail("修改失败!");
        }
    }

    @RequestMapping("/deleteManyHouser")
    @ResponseBody
    public Message deleteManyhouser(@Param("manyId") String manyId) throws Exception {
        try {
            String str[] = manyId.split(",");
            for (String s : str) {
                houserService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/deleteHouser/{id}")
    @ResponseBody
    public Message deletehouser(@PathVariable("id") long id) throws Exception {
        try {
            houserService.removeById(id);
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/houserListPage")
    public String table() throws Exception {
        return "employee/houserList";
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id, @PathVariable("status") int status) throws Exception {
        try {
            houserService.updateStatus(new StatusQuery(id, status));
            return Message.success("ok");
        } catch (Exception e) {
            return Message.fail("fail");
        }
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
