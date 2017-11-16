package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.ContractMasterDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.ContractMasterService;
import top.zywork.vo.ContractMasterVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/16.
 */
@Service
public class ContractMasterServiceImpl implements ContractMasterService{
    @Resource
    private ContractMasterDAO contractMasterDAO;
    @Override
    public void save(ContractMasterVo contractMasterVo) {
        contractMasterDAO.save(contractMasterVo);
    }

    @Override
    public void remove(ContractMasterVo contractMasterVo) {
        contractMasterDAO.remove(contractMasterVo);
    }

    @Override
    public void removeById(Long id) {
        contractMasterDAO.removeById(id);
    }

    @Override
    public void update(ContractMasterVo contractMasterVo) {
        contractMasterDAO.update(contractMasterVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        contractMasterDAO.updateStatus(statusQuery);
    }

    @Override
    public ContractMasterVo getById(Long id) {
        return contractMasterDAO.getById(id);
    }

    @Override
    public List<ContractMasterVo> listAll() {
        return contractMasterDAO.listAll();
    }

    @Override
    public List<ContractMasterVo> listPage(PageQuery pageQuery) {
        return contractMasterDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return contractMasterDAO.count();
    }

    @Override
    public List<ContractMasterVo> listPages(PageQuery pageQuery, long companyId) {
        return contractMasterDAO.listPages(pageQuery,companyId);
    }

    @Override
    public long counts(long companyId) {
        return contractMasterDAO.counts(companyId);
    }
}
