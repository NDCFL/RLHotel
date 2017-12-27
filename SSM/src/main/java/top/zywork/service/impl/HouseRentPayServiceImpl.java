package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HouseRentPayDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouseRentPayService;
import top.zywork.vo.HouseRentPayVo;
import top.zywork.vo.HouseRentVo;
import top.zywork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/24.
 */
@Service
public class HouseRentPayServiceImpl implements HouseRentPayService {
    @Resource
    private HouseRentPayDAO houseRentPayDAO;
    @Override
    public void save(HouseRentPayVo houseRentPayVo) {
        houseRentPayDAO.save(houseRentPayVo);
    }

    @Override
    public void remove(HouseRentPayVo houseRentPayVo) {
        houseRentPayDAO.remove(houseRentPayVo);
    }

    @Override
    public void removeById(Long id) {
        houseRentPayDAO.removeById(id);
    }

    @Override
    public void update(HouseRentPayVo houseRentPayVo) {
        houseRentPayDAO.update(houseRentPayVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        houseRentPayDAO.updateStatus(statusQuery);
    }

    @Override
    public HouseRentPayVo getById(Long id) {
        return houseRentPayDAO.getById(id);
    }

    @Override
    public List<HouseRentPayVo> listAll() {
        return houseRentPayDAO.listAll();
    }

    @Override
    public List<HouseRentPayVo> listPage(PageQuery pageQuery) {
        return houseRentPayDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return houseRentPayDAO.count(pageQuery);
    }

    @Override
    public List<Select2Vo> getContractMaster(Long companyId) {
        return houseRentPayDAO.getContractMaster(companyId);
    }

    @Override
    public List<Select2Vo> getHotel(Long companyId) {
        return houseRentPayDAO.getHotel(companyId);
    }

    @Override
    public HouseRentVo notHotelId() {
        return houseRentPayDAO.notHotelId();
    }

    @Override
    public HouseRentVo haveHotelId(Long hotelId) {
        return houseRentPayDAO.haveHotelId(hotelId);
    }
}
