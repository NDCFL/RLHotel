package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.dto.UserDTO;
import top.zywork.query.UserAccountPasswordQuery;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * 用户Service接口<br />
 * 创建于2017-09-05
 *
 * @author 王振宇
 * @version 1.0
 */
public interface UserService extends BaseService<UserVo> {

    /**
     * 根据用户账号及密码查询用户
     * @param userAccountPasswordQuery 用户账号及密码组成的查询对象，账号可以是邮箱，手机号，账户名
     * @return 指定账号及密码的用户对象
     */
    UserVo getByAccountPassword(UserAccountPasswordQuery userAccountPasswordQuery);
    int checkReg(String phone);
    int checkLogin(String account);
    void updatePwd(long id, String pwd);
    void updatePhone(long id,String phone);
    String getPassword(long id);
    List<Select2Vo> getUserIdAndName();
}
