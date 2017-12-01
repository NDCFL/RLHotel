package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.ServiceSubjectDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.ServiceSubjectService;
import top.zywork.vo.ServiceSubjectVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Service
public class ServiceSubjectServiceImpl implements ServiceSubjectService {
    @Resource
    private ServiceSubjectDAO serviceSubjectDAO;

    @Override
    public void save(ServiceSubjectVo serviceSubjectVo) {
        serviceSubjectDAO.save(serviceSubjectVo);
    }

    @Override
    public void remove(ServiceSubjectVo serviceSubjectVo) {
        serviceSubjectDAO.remove(serviceSubjectVo);
    }

    @Override
    public void removeById(Long id) {
        serviceSubjectDAO.removeById(id);
    }

    @Override
    public void update(ServiceSubjectVo serviceSubjectVo) {
        serviceSubjectDAO.update(serviceSubjectVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        serviceSubjectDAO.updateStatus(statusQuery);
    }

    @Override
    public ServiceSubjectVo getById(Long id) {
        return serviceSubjectDAO.getById(id);
    }

    @Override
    public List<ServiceSubjectVo> listAll() {
        return serviceSubjectDAO.listAll();
    }

    @Override
    public List<ServiceSubjectVo> listPage(PageQuery pageQuery) {
        return serviceSubjectDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return serviceSubjectDAO.count(pageQuery);
    }
}
