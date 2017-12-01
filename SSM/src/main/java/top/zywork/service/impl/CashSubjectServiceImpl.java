package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.CashSubjectDAO;
import top.zywork.dto.PagerDTO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.CashSubjectService;
import top.zywork.vo.CashSubjectVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Service
public class CashSubjectServiceImpl implements CashSubjectService {
    @Resource
    private CashSubjectDAO cashSubjectDAO;

    @Override
    public void save(CashSubjectVo cashSubjectVo) {
        cashSubjectDAO.save(cashSubjectVo);
    }

    @Override
    public void remove(CashSubjectVo cashSubjectVo) {
        cashSubjectDAO.remove(cashSubjectVo);
    }

    @Override
    public void removeById(Long id) {
        cashSubjectDAO.removeById(id);
    }

    @Override
    public void update(CashSubjectVo cashSubjectVo) {
        cashSubjectDAO.update(cashSubjectVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        cashSubjectDAO.updateStatus(statusQuery);
    }

    @Override
    public CashSubjectVo getById(Long id) {
        return cashSubjectDAO.getById(id);
    }

    @Override
    public List<CashSubjectVo> listAll() {
        return cashSubjectDAO.listAll();
    }

    @Override
    public List<CashSubjectVo> listPage(PageQuery pageQuery) {
        return cashSubjectDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return cashSubjectDAO.count(pageQuery);
    }
}
