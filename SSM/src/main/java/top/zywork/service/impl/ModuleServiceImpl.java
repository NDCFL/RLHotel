package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.common.ExceptionUtils;
import top.zywork.dao.ModuleDAO;
import top.zywork.exception.DAOException;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.AbstractBaseService;
import top.zywork.service.ModuleService;
import top.zywork.vo.ModuleVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * 模块服务实现类<br />
 * 创建于2017-09-12
 *
 * @author 王振宇
 * @version 1.0
 */
@Service
public class ModuleServiceImpl extends AbstractBaseService implements ModuleService {

    private ModuleDAO moduleDAO;

    @Override
    public void save(ModuleVo moduleVo) {

    }

    @Override
    public void remove(ModuleVo moduleVo) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(ModuleVo moduleVo) {

    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {

    }

    @Override
    public ModuleVo getById(Long id) {
        try {
            return getDozerMapper().map(moduleDAO.getById(id), ModuleVo.class);
        } catch (DAOException e) {
            throw ExceptionUtils.serviceException(e);
        }
    }

    @Override
    public List<ModuleVo> listAll() {
        return null;
    }

    @Override
    public List<ModuleVo> listPage(PageQuery pageQuery) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Resource
    public void setModuleDAO(ModuleDAO moduleDAO) {
        this.moduleDAO = moduleDAO;
    }
}
