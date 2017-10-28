package top.zywork.service;

import top.zywork.dao.BaseDAO;
import top.zywork.vo.RolePermissionVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/10/27.
 */
public interface RolePermissionService extends BaseDAO<RolePermissionVo>{
    List<String> pageListByRoleId(String roleId);
}
