package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.CustomerOrderDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.CustomerOrderService;
import top.zywork.vo.CustomerOrderVo;
import top.zywork.vo.Select2Vo;

import javax.annotation.Resource;
import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/9.
 */
@Service
public class CustomerOrderServiceImpl implements CustomerOrderService{
    @Resource
    private CustomerOrderDAO customerOrderDAO;

    @Override
    public void save(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.save(customerOrderVo);
    }

    @Override
    public void remove(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.remove(customerOrderVo);
    }

    @Override
    public void removeById(Long id) {
        customerOrderDAO.removeById(id);
    }

    @Override
    public void update(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.update(customerOrderVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        customerOrderDAO.updateStatus(statusQuery);
    }

    @Override
    public CustomerOrderVo getById(Long id) {
        return customerOrderDAO.getById(id);
    }

    @Override
    public List<CustomerOrderVo> listAll() {
        return customerOrderDAO.listAll();
    }

    @Override
    public List<CustomerOrderVo> listPage(PageQuery pageQuery) {
        return customerOrderDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return customerOrderDAO.count(pageQuery);
    }

    @Override
    public List<Select2Vo> getSubject(Long companyId) {
        return customerOrderDAO.getSubject(companyId);
    }

    @Override
    public List<Select2Vo> getWeb(Long companyId) {
        return customerOrderDAO.getWeb(companyId);
    }

    @Override
    public List<Select2Vo> getHouse(PageQuery pageQuery, Long type, Date leaveTime, int status) {
        return customerOrderDAO.getHouse(pageQuery,type,leaveTime,status);
    }

    @Override
    public void updateCashStatus(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.updateCashStatus(customerOrderVo);
    }

    @Override
    public void updateRemark(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.updateRemark(customerOrderVo);
    }

    @Override
    public void checkerManyCashAccount(List<CustomerOrderVo> customerOrderVoList) {
        customerOrderDAO.checkerManyCashAccount(customerOrderVoList);
    }

    @Override
    public List<Select2Vo> getOthersHotel(PageQuery pageQuery) {
        return customerOrderDAO.getOthersHotel(pageQuery);
    }

    @Override
    public void saveList(List<CustomerOrderVo> customerOrderVoList) {
        customerOrderDAO.saveList(customerOrderVoList);
    }

    @Override
    public void changeHouse(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.changeHouse(customerOrderVo);
    }

    @Override
    public void endHouse(CustomerOrderVo customerOrderVo) {
        customerOrderDAO.endHouse(customerOrderVo);
    }
}
