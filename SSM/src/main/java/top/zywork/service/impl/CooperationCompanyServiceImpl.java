package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.CooperationCompanyDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.CooperationCompanyService;
import top.zywork.vo.CooperationCompanyVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/6.
 */
@Service
public class CooperationCompanyServiceImpl implements CooperationCompanyService {
    @Resource
    private CooperationCompanyDAO cooperationCompanyDAO;
    @Override
    public void save(CooperationCompanyVo cooperationCompanyVo) {
        cooperationCompanyDAO.save(cooperationCompanyVo);
    }

    @Override
    public  void remove(CooperationCompanyVo cooperationCompanyVo) {
        cooperationCompanyDAO.remove(cooperationCompanyVo);
    }

    @Override
    public void removeById(Long id) {
        cooperationCompanyDAO.removeById(id);
    }

    @Override
    public void update(CooperationCompanyVo cooperationCompanyVo) {
        cooperationCompanyDAO.update(cooperationCompanyVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        cooperationCompanyDAO.updateStatus(statusQuery);
    }

    @Override
    public CooperationCompanyVo getById(Long id) {
        return cooperationCompanyDAO.getById(id);
    }

    @Override
    public List<CooperationCompanyVo> listAll() {
        return cooperationCompanyDAO.listAll();
    }

    @Override
    public List<CooperationCompanyVo> listPage(PageQuery pageQuery) {
        return cooperationCompanyDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return cooperationCompanyDAO.count(pageQuery);
    }
}
