package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.common.ExceptionUtils;
import top.zywork.dao.UserDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.query.UserAccountPasswordQuery;
import top.zywork.service.UserService;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户Service实现类<br />
 * 创建于2017-09-05
 *
 * @author 王振宇
 * @version 1.0
 */
@Service
public class UserServiceImpl  implements UserService {

    @Resource
    private UserDAO userDAO;

    @Override
    public UserVo getByAccountPassword(UserAccountPasswordQuery userAccountPasswordQuery) {
        try {
            UserVo userVo = userDAO.getByAccountPassword(userAccountPasswordQuery);
            return userVo;
        } catch (RuntimeException e) {
            throw ExceptionUtils.serviceException(e);
        }
    }

    @Override
    public int checkReg(String phone) {
        return userDAO.checkReg(phone);
    }

    @Override
    public int checkLogin(String account) {
        return userDAO.checkLogin(account);
    }

    @Override
    public void updatePwd(long id, String pwd) {
        userDAO.updatePwd(id,pwd);
    }

    @Override
    public void updatePhone(long id, String phone) {
        userDAO.updatePhone(id, phone);
    }

    @Override
    public String getPassword(long id) {
        return userDAO.getPassword(id);
    }

    @Override
    public List<Select2Vo> getUserIdAndName() {
        return userDAO.getUserIdAndName();
    }

    @Override
    public void save(UserVo userVo) {
        userDAO.save(userVo);
    }

    @Override
    public void remove(UserVo userVo) {
        userDAO.remove(userVo);
    }

    @Override
    public void removeById(Long id) {
        userDAO.removeById(id);
    }

    @Override
    public void update(UserVo userVo) {
        userDAO.update(userVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        userDAO.updateStatus(statusQuery);
    }

    @Override
    public UserVo getById(Long id) {
        return userDAO.getById(id);
    }

    @Override
    public List<UserVo> listAll() {
        return userDAO.listAll();
    }

    @Override
    public List<UserVo> listPage(PageQuery pageQuery) {
        return userDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return userDAO.count();
    }

}
