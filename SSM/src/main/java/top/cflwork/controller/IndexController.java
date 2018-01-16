package top.cflwork.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import top.cflwork.query.UserAccountPasswordQuery;
import top.cflwork.service.HotelService;
import top.cflwork.service.RoleService;
import top.cflwork.service.UserRoleService;
import top.cflwork.service.UserService;
import top.cflwork.vo.HotelVo;
import top.cflwork.vo.UserRoleVo;
import top.cflwork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 用于显示主页的控制器<br />
 * 创建于2017-08-28
 *
 * @author 陈飞龙
 * @version 1.0
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;
    @Resource
    private HotelService hotelService;
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index(HttpSession session) {
        try{
            UserVo user = (UserVo) session.getAttribute("userVo");
            Subject subject = SecurityUtils.getSubject();
            UserVo userVo = userService.getByAccountPassword(new UserAccountPasswordQuery(user.getPhone(), user.getPassword()));
            subject.login(new UsernamePasswordToken(user.getPhone(), user.getPassword()));
            UserRoleVo userRoleVo = userRoleService.getRole(user.getId());
            if(userRoleVo.getRoleVo().getTitle().equals("店长")){
                HotelVo hotelVo = hotelService.findHotel(user.getId());
                session.setAttribute("hotelVo",hotelVo);
            }
            session.setAttribute("userRole",userRoleVo);
            return "index";
        }catch (Exception e){
            return "loginRegister/loginPage";
        }
    }

}
