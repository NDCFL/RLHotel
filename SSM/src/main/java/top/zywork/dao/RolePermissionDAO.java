package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.RolePermissionVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/10/27.
 */
@Repository
public interface RolePermissionDAO extends  BaseDAO<RolePermissionVo>{
    List<String> pageListByRoleId(String roleId);
}
