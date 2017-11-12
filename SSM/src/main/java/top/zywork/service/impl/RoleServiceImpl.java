package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.common.DozerMapperUtils;
import top.zywork.common.ExceptionUtils;
import top.zywork.dao.RoleDAO;
import top.zywork.dos.RoleDO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.AbstractBaseService;
import top.zywork.service.RoleService;
import top.zywork.vo.RoleVo;
import top.zywork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色Service实现类<br />
 * 创建于2017-09-11
 *
 * @author 王振宇
 * @version 1.0
 */
@Service
public class RoleServiceImpl extends AbstractBaseService implements RoleService {

    private RoleDAO roleDAO;

    @Override
    public List<RoleVo> listByAccount(String account) {
        try {
            List<RoleVo> roleDOList = roleDAO.listByAccount(account);
            return DozerMapperUtils.map(getDozerMapper(), roleDOList, RoleVo.class);
        } catch (RuntimeException e) {
            throw ExceptionUtils.serviceException(e);
        }
    }

    @Override
    public List<Select2Vo> getRoleIdAndTitle() {
        return roleDAO.getRoleIdAndTitle();
    }

    @Override
    public RoleVo findByName(String title) {
        return roleDAO.findByName(title);
    }

    @Override
    public void save(RoleVo roleVo) {
        roleDAO.save(roleVo);
    }

    @Override
    public void remove(RoleVo roleVo) {
        roleDAO.remove(roleVo);
    }

    @Override
    public void removeById(Long id) {
        roleDAO.removeById(id);
    }

    @Override
    public void update(RoleVo roleVo) {
        roleDAO.update(roleVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        roleDAO.updateStatus(statusQuery);
    }

    @Override
    public RoleVo getById(Long id) {
        return roleDAO.getById(id);
    }

    @Override
    public List<RoleVo> listAll() {
        return roleDAO.listAll();
    }

    @Override
    public List<RoleVo> listPage(PageQuery pageQuery) {
        return roleDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return roleDAO.count();
    }

    @Resource
    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }
}
