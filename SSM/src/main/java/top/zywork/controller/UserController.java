package top.zywork.controller;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.query.UserAccountPasswordQuery;
import top.zywork.service.RoleService;
import top.zywork.service.UserRoleService;
import top.zywork.service.UserService;
import top.zywork.service.impl.UserRoleServiceImpl;
import top.zywork.vo.RoleVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserRoleVo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.regex.Matcher;

/**
 * Created by chenfeilong on 2017/10/27.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private RoleService roleService;
    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @RequestMapping("regPage")
    public String regPage() {
        return "loginRegister/regPage";
    }

    @RequestMapping("loginPage")
    public String loginPage() {
        return "loginRegister/loginPage";
    }

    @RequestMapping("userReg")
    public String userReg(UserVo userVo, HttpServletRequest request) {
        try {
            logger.info("手机号码为：" + userVo.getPhone() + "的用户正在通过IP为" + request.getRemoteAddr() + "的设备进行注册操作，当前时间为：" + Calendar.getInstance().getTime());
            //使用shiro进行md5加密
            userVo.setGender((byte) 0);
            userVo.setIsActive((byte) 0);
            userVo.setPassword(new Md5Hash(userVo.getPassword()).toString());
            userVo.setNickname(userVo.getPhone());
            //这里是注册时，新增公司的id暂时只有一家公司瑞蓝酒店
            userVo.setCompanyId(1l);
            userService.save(userVo);
            //通过新增的管理员的手机号获取新增管理员的id
            UserVo userVo1 = userService.findByPhone(userVo.getPhone());
            //通过权限名称来获取到权限的id
            RoleVo roleVo = roleService.findByName("总管理员");
            UserRoleVo userRoleVo = new UserRoleVo();
            if(roleVo==null || "".equals(roleVo)){
                RoleVo roleVo1 = new RoleVo();
                roleVo1.setTitle("总管理员");
                roleVo1.setDescription("总管理员");
                roleVo1.setIsActive((byte)0);
                roleService.save(roleVo1);
            }
            if (roleVo.getId() == 0) {

            } else {
                //同时把信息保存到用户权限表中
                userRoleVo.setIsActive((byte) 0);
                userRoleVo.setUserId(userVo1.getId());
                userRoleVo.setRoleId(roleVo.getId());
                userRoleService.save(userRoleVo);
            }
            return "loginRegister/loginPage";
        } catch (Exception e) {
            e.printStackTrace();
            return "loginRegister/regPage";
        }
    }

    @RequestMapping("checkReg")
    @ResponseBody
    public Map<String, Boolean> checkReg(String phone) {
        Map<String, Boolean> result = new HashMap<String, Boolean>();
        int count = userService.checkReg(phone);
        if (count == 0) {
            result.put("valid", true);
        } else {
            result.put("valid", false);
        }
        return result;
    }

    @RequestMapping("checkLogin")
    @ResponseBody
    public Map<String, Boolean> checkLogin(String phone) {
        Map<String, Boolean> result = new HashMap<String, Boolean>();
        int count = userService.checkLogin(phone);
        if (count == 0) {
            result.put("valid", false);
        } else {
            result.put("valid", true);
        }
        return result;

    }

    @RequestMapping("checkPhoneAndPwd")
    @ResponseBody
    public Map<String, Boolean> checkPhoneAndPwd(String phone, String password) {
        Map<String, Boolean> result = new HashMap<String, Boolean>();
        try {
            Subject subject = SecurityUtils.getSubject();
            UserVo userVo = userService.getByAccountPassword(new UserAccountPasswordQuery(phone, new Md5Hash(password).toString()));
            subject.login(new UsernamePasswordToken(phone, new Md5Hash(password).toString()));
            Session session = subject.getSession();
            session.setAttribute("userVo", userVo);
            result.put("valid", true);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.put("valid", false);
            return result;
        }
    }

    @RequestMapping("exit")
    public String exit(HttpSession session) {
        session.invalidate();
        return "loginRegister/loginPage";
    }

    @RequestMapping("bossInfoPage")
    public String bossInfoPage() {
        return "user/bossInfoPage";
    }

    @RequestMapping("bossInfo")
    @ResponseBody
    public UserVo bossInfo(HttpSession session) {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        return userService.getById(userVo.getId());
    }

    @RequestMapping("updateBossInfo")
    public String updateBossInfo(UserVo userVo) {
        userService.update(userVo);
        return "/index";
    }

    @RequestMapping("checkPwd")
    @ResponseBody
    public Map<String, Boolean> checkPwd(String password, HttpSession session) {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        Map<String, Boolean> result = new HashMap<String, Boolean>();
        try {
            Subject subject = SecurityUtils.getSubject();
            String pwd = userService.getPassword(userVo.getId());
            if (pwd.equals(new Md5Hash(password).toString())) {
                result.put("valid", true);
            } else {
                result.put("valid", false);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            result.put("valid", false);
            return result;
        }
    }

    @RequestMapping("updatePassword")
    public String updatePassword(HttpSession session, String newpassword) {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        userService.updatePwd(userVo.getId(), new Md5Hash(newpassword).toString());
        return "/index";
    }

    @RequestMapping("changePhone")
    public String changePhone(HttpSession session, String phone) {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        userService.updatePhone(userVo.getId(), phone);
        return "/index";
    }

    @RequestMapping("getUserIdAndName")
    @ResponseBody
    public List<Select2Vo> getUserIdAndName() {
        List<Select2Vo> select2Vo = userService.getUserIdAndName();
        return select2Vo;
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id, @PathVariable("status") int status) throws Exception {
        try {
            userService.updateStatus(new StatusQuery(id, status));
            return Message.success("ok");
        } catch (Exception e) {
            return Message.fail("fail");
        }
    }

    @RequestMapping("/deleteManyUser")
    @ResponseBody
    public Message deleteManycashSubject(@Param("manyId") String manyId) throws Exception {
        try {
            String str[] = manyId.split(",");
            for (String s : str) {
                userService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/deleteUser/{id}")
    @ResponseBody
    public Message deletecashSubject(@PathVariable("id") long id) throws Exception {
        try {
            userService.removeById(id);
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }


}
