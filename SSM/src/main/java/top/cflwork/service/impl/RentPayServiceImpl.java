package top.cflwork.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import top.cflwork.dao.RentPayDAO;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.RentPayService;
import top.cflwork.vo.HouseRentVo;
import top.cflwork.vo.RentPayMoneyVo;
import top.cflwork.vo.RentPayVo;
import top.cflwork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RentPayServiceImpl implements RentPayService{
    @Resource
    private RentPayDAO rentPayDAO;
    @Override
    public void save(RentPayVo rentPayVo) {
        rentPayDAO.save(rentPayVo);
    }

    @Override
    public void remove(RentPayVo rentPayVo) {
        rentPayDAO.remove(rentPayVo);
    }

    @Override
    public void removeById(Long id) {
        rentPayDAO.removeById(id);
    }

    @Override
    public void update(RentPayVo rentPayVo) {
        rentPayDAO.update(rentPayVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        rentPayDAO.updateStatus(statusQuery);
    }

    @Override
    public RentPayVo getById(Long id) {
        return rentPayDAO.getById(id);
    }

    @Override
    public List<RentPayVo> listAll() {
        return rentPayDAO.listAll();
    }

    @Override
    public List<RentPayVo> listPage(PageQuery pageQuery) {
        return rentPayDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return rentPayDAO.count(pageQuery);
    }

    @Override
    public void removeMany(Long[] id) {
        rentPayDAO.removeMany(id);
    }

    @Override
    public List<Select2Vo> getContractMaster(Long companyId) {
        return rentPayDAO.getContractMaster(companyId);
    }

    @Override
    public List<Select2Vo> getHotel(Long companyId) {
        return rentPayDAO.getHotel(companyId);
    }

    @Override
    public HouseRentVo notHotelId() {
        return rentPayDAO.notHotelId();
    }

    @Override
    public HouseRentVo haveHotelId(Long hotelId) {
        return rentPayDAO.haveHotelId(hotelId);
    }

    @Override
    public void huankuan(Long id) {
        rentPayDAO.huankuan(id);
    }

    @Override
    public List<Select2Vo> getHouse(PageQuery pageQuery) {
        return rentPayDAO.getHouse(pageQuery);
    }

    @Override
    public List<RentPayMoneyVo> getSubjectMoney(RentPayMoneyVo rentPayMoneyVo) {
        return rentPayDAO.getSubjectMoney(rentPayMoneyVo);
    }
}
