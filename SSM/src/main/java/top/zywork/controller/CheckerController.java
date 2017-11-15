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
@RequestMapping("checker")
@Controller
public class CheckerController {
    @Resource
    private UserService userService;
    @Resource
    private CheckerService checkerService;
    @Resource
    private RoleService roleService;
    @Resource
    private UserRoleService userRoleService;

    @RequestMapping("checkerList")
    @ResponseBody
    public PagingBean checkerList(int pageSize, int pageIndex) throws Exception {
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(checkerService.count());
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(checkerService.listPage(new PageQuery(pagingBean.getStartIndex(), pagingBean.getPageSize())));
        return pagingBean;
    }

    @RequestMapping("addChecker")
    @ResponseBody
    public Message addChecker(UserVo userVo) {
        userVo.setHeadicon("static/img/face.gif");
        userVo.setIsActive((byte) 0);
        userVo.setPassword(new Md5Hash(userVo.getPassword()).toString());
        userVo.setNickname(userVo.getPhone());
        //保存店长信息
        userService.save(userVo);
        //通过新增的店长的手机号获取新增店长的id
        UserVo userVo1 = userService.findByPhone(userVo.getPhone());
        //通过权限名称来获取到权限的id
        RoleVo roleVo = roleService.findByName("审核员");
        UserRoleVo userRoleVo = new UserRoleVo();
        if (roleVo.getId() == 0) {
            return Message.fail("审核员角色不存在!");
        } else {
            //同时把信息保存到用户权限表中
            userRoleVo.setIsActive((byte) 0);
            userRoleVo.setUserId(userVo1.getId());
            userRoleVo.setRoleId(roleVo.getId());
            userRoleService.save(userRoleVo);
            return Message.success("审核员账号新增成功!");
        }
    }
    @RequestMapping("/findChecker/{id}")
    @ResponseBody
    public UserVo findChecker(@PathVariable("id") long id) {
        UserVo checker = checkerService.getById(id);
        return checker;
    }

    @RequestMapping("/checkerUpdateSave")
    @ResponseBody
    public Message updateChecker(UserVo checker) throws Exception {
        try {
            checkerService.update(checker);
            return Message.success("修改成功!");
        } catch (Exception e) {
            return Message.fail("修改失败!");
        }
    }

    @RequestMapping("/deleteManyChecker")
    @ResponseBody
    public Message deleteManychecker(@Param("manyId") String manyId) throws Exception {
        try {
            String str[] = manyId.split(",");
            for (String s : str) {
                checkerService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/deleteChecker/{id}")
    @ResponseBody
    public Message deletechecker(@PathVariable("id") long id) throws Exception {
        try {
            checkerService.removeById(id);
            return Message.success("删除成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    @RequestMapping("/checkerListPage")
    public String table() throws Exception {
        return "employee/checkerList";
    }

    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id, @PathVariable("status") int status) throws Exception {
        try {
            checkerService.updateStatus(new StatusQuery(id, status));
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
