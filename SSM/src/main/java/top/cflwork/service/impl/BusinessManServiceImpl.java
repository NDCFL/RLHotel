package top.cflwork.service.impl;

import org.springframework.stereotype.Service;
import top.cflwork.dao.BusinessManDAO;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.BusinessManService;
import top.cflwork.vo.BusinessManVo;
import top.cflwork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BusinessManServiceImpl implements BusinessManService {
    @Resource
    protected BusinessManDAO businessManDAO;
    @Override
    public void save(BusinessManVo businessManVo) {
        businessManDAO.save(businessManVo);
    }

    @Override
    public void remove(BusinessManVo businessManVo) {
        businessManDAO.remove(businessManVo);
    }

    @Override
    public void removeById(Long id) {
        businessManDAO.removeById(id);
    }

    @Override
    public void update(BusinessManVo businessManVo) {
        businessManDAO.update(businessManVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        businessManDAO.updateStatus(statusQuery);
    }

    @Override
    public BusinessManVo getById(Long id) {
        return businessManDAO.getById(id);
    }

    @Override
    public List<BusinessManVo> listAll() {
        return businessManDAO.listAll();
    }

    @Override
    public List<BusinessManVo> listPage(PageQuery pageQuery) {
        return businessManDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return businessManDAO.count(pageQuery);
    }

    @Override
    public List<Select2Vo> businessManList() {
        return businessManDAO.businessManList();
    }

    @Override
    public void updateType(StatusQuery statusQuery) {
        businessManDAO.updateType(statusQuery);
    }
}
