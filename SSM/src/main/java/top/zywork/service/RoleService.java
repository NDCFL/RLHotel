package top.zywork.service;

import top.zywork.dto.RoleDTO;
import top.zywork.vo.RoleVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

/**
 * 角色Service接口<br />
 * 创建于2017-09-11
 *
 * @author 王振宇
 * @version 1.0
 */
public interface RoleService extends BaseService<RoleVo> {

    /**
     * 根据用户账户查找对应的所有角色
     * @param account 用户账户，可能是邮箱，手机号或账户名
     * @return 指定用户账户对应的所有角色组成的列表
     */
    List<RoleVo> listByAccount(String account);
    List<Select2Vo> getRoleIdAndTitle();
    RoleVo findByName(String title);
}
