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
import org.springframework.web.servlet.ModelAndView;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.*;
import top.zywork.vo.*;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by chenfeilong on 2017/11/3.
 */
@Controller
@RequestMapping("landlord")
public class LandlordController {
    @Resource
    private UserService userService;
    @Resource
    private LandlordService landlordService;
    @Resource
    private RoleService roleService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private EmployeeService employeeService;
    @RequestMapping("landlordList")
    @ResponseBody
    public PagingBean landlordList(int pageSize, int pageIndex,HttpSession session,String searchVal) throws Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(landlordService.count(new PageQuery(searchVal)));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(landlordService.listPages(new PageQuery(pagingBean.getStartIndex(), pagingBean.getPageSize()),userVo.getCompanyId()));
        return pagingBean;
    }
    @RequestMapping("landlordAllList")
    @ResponseBody
    public ModelAndView landlordAllList(HttpSession session) throws Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("hotelList",landlordService.listAlls(userVo.getCompanyId()));
        modelAndView.setViewName("employee/hotelManager");
        return modelAndView;
    }
    @RequestMapping("addLandlord")
    @ResponseBody
    public Message addLandlord(UserVo userVo, HttpSession session) {
        UserRoleVo userRole = (UserRoleVo) session.getAttribute("userRole");
        UserVo user = (UserVo) session.getAttribute("userVo");
        userVo.setHeadicon("static/img/face.gif");
        userVo.setIsActive((byte) 0);
        userVo.setPassword(new Md5Hash(userVo.getPassword()).toString());
        userVo.setNickname(userVo.getPhone());
        userVo.setCompanyId(user.getCompanyId());
        //保存店长信息
        userService.save(userVo);
        EmployeeVo employeeVo = new EmployeeVo();
        employeeVo.setCompanyId(userVo.getCompanyId());
        if(userRole.getRoleVo().getTitle().equals("总管理员")){
            employeeVo.setHotelId(-1);
        }
        employeeVo.setUserId(user.getId());
        employeeService.save(employeeVo);
        //通过新增的店长的手机号获取新增店长的id
        UserVo userVo1 = userService.findByPhone(userVo.getPhone());
        //通过权限名称来获取到权限的id
        RoleVo roleVo = roleService.findByName("店长");
        UserRoleVo userRoleVo = new UserRoleVo();
        if (roleVo==null) {
            RoleVo roleVo1 = new RoleVo();
            roleVo1.setIsActive((byte)0);
            roleVo1.setDescription("店长");
            roleVo1.setTitle("店长");
            roleService.save(roleVo1);
            roleVo = roleService.findByName("店长");
        }
        //同时把信息保存到用户权限表中
        userRoleVo.setIsActive((byte) 0);
        userRoleVo.setUserId(userVo1.getId());
        userRoleVo.setRoleId(roleVo.getId());
        userRoleService.save(userRoleVo);
        return Message.success("店长账号新增成功!");
    }
    @RequestMapping("/findLandlord/{id}")
    @ResponseBody
    public UserVo findLandlord(@PathVariable("id") long id) {
        UserVo landlord = landlordService.getById(id);
        return landlord;
    }

    @RequestMapping("/landlordUpdateSave")
    @ResponseBody
    public Message updateLandlord(UserVo landlord) throws Exception {
        try {
            landlordService.update(landlord);
            return Message.success("修改成功!");
        } catch (Exception e) {
            return Message.fail("修改失败!");
        }
    }

    @RequestMapping("/deleteManyLandlord")
    @ResponseBody
    public Message deleteManylandlord(@Param("manyId") String manyId) throws Exception {
        try {
            String str[] = manyId.split(",");
            for (String s : str) {
                landlordService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/deleteLandlord/{id}")
    @ResponseBody
    public Message deletelandlord(@PathVariable("id") long id) throws Exception {
        try {
            landlordService.removeById(id);
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/landlordListPage")
    public String table() throws Exception {
        return "employee/landlordList";
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id, @PathVariable("status") int status) throws Exception {
        try {
            landlordService.updateStatus(new StatusQuery(id, status));
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
