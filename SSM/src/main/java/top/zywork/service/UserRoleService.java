package top.zywork.service;

import top.zywork.dao.BaseDAO;
import top.zywork.vo.UserRoleVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/10/27.
 */
public interface UserRoleService extends BaseDAO<UserRoleVo>{
    List<String> pageListByUserId(String userId);
}
