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
import top.zywork.vo.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@RequestMapping("keyIn")
@Controller
public class KeyInController  {
    @Resource
    private UserService userService;
    @Resource
    private KeyInService keyInService;
    @Resource
    private RoleService roleService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private EmployeeService employeeService;
    @RequestMapping("keyInList")
    @ResponseBody
    public PagingBean keyInList(int pageSize, int pageIndex,HttpSession session) throws Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(keyInService.counts(userVo.getId()));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(keyInService.listPages(new PageQuery(pagingBean.getStartIndex(), pagingBean.getPageSize()),userVo.getId()));
        return pagingBean;
    }

    @RequestMapping("addKeyIn")
    @ResponseBody
    public Message addKeyIn(UserVo userVo, HttpSession session) {
        UserVo user = (UserVo) session.getAttribute("userVo");
        UserRoleVo userRole = (UserRoleVo) session.getAttribute("userRole");
        userVo.setHeadicon("static/img/face.gif");
        userVo.setIsActive((byte) 0);
        userVo.setPassword(new Md5Hash(userVo.getPassword()).toString());
        userVo.setNickname(userVo.getPhone());
        userVo.setCompanyId(user.getCompanyId());
        userService.save(userVo);
        EmployeeVo employeeVo = new EmployeeVo();
        employeeVo.setCompanyId(userVo.getCompanyId());
        if(userRole.getRoleVo().getTitle().equals("总管理员")){
            employeeVo.setHotelId(-1);
        }else if(userRole.getRoleVo().getTitle().equals("店长")){
            HotelVo hotelVo = (HotelVo) session.getAttribute("hotelVo");
            employeeVo.setHotelId(hotelVo.getId());
        }
        employeeVo.setUserId(user.getId());
        employeeVo.setEmployeeId(userVo.getId());
        employeeService.save(employeeVo);
        UserVo userVo1 = userService.findByPhone(userVo.getPhone());
        RoleVo roleVo = roleService.findByName("录入员");
        UserRoleVo userRoleVo = new UserRoleVo();
        if (roleVo==null) {
            RoleVo roleVo1 = new RoleVo();
            roleVo1.setIsActive((byte)0);
            roleVo1.setDescription("录入员");
            roleVo1.setTitle("录入员");
            roleService.save(roleVo1);
            roleVo = roleService.findByName("录入员");
        }
        //同时把信息保存到用户权限表中
        userRoleVo.setIsActive((byte) 0);
        userRoleVo.setUserId(userVo1.getId());
        userRoleVo.setRoleId(roleVo.getId());
        userRoleService.save(userRoleVo);
        return Message.success("录入员账号新增成功!");
    }
    @RequestMapping("/findKeyIn/{id}")
    @ResponseBody
    public UserVo findKeyIn(@PathVariable("id") long id) {
        UserVo keyIn = keyInService.getById(id);
        return keyIn;
    }

    @RequestMapping("/keyInUpdateSave")
    @ResponseBody
    public Message updateKeyIn(UserVo keyIn) throws Exception {
        try {
            keyInService.update(keyIn);
            return Message.success("修改成功!");
        } catch (Exception e) {
            return Message.fail("修改失败!");
        }
    }

    @RequestMapping("/deleteManyKeyIn")
    @ResponseBody
    public Message deleteManykeyIn(@Param("manyId") String manyId) throws Exception {
        try {
            String str[] = manyId.split(",");
            for (String s : str) {
                keyInService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/deleteKeyIn/{id}")
    @ResponseBody
    public Message deletekeyIn(@PathVariable("id") long id) throws Exception {
        try {
            keyInService.removeById(id);
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/keyInListPage")
    public String table() throws Exception {
        return "employee/keyInList";
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id, @PathVariable("status") int status) throws Exception {
        try {
            keyInService.updateStatus(new StatusQuery(id, status));
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
