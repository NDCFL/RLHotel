package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HotelDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HotelService;
import top.zywork.vo.HotelVo;
import top.zywork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;
@Service
public class HotelServiceImpl implements HotelService {
    @Resource
    private HotelDAO hotelDAO;
    @Override
    public long counts(long companyId) {
        return hotelDAO.counts(companyId);
    }

    @Override
    public List<HotelVo> listPages(PageQuery pageQuery, long companyId) {
        return hotelDAO.listPages(pageQuery,companyId);
    }

    @Override
    public List<Select2Vo> getContract() {
        return hotelDAO.getContract();
    }

    @Override
    public List<Select2Vo> getLandlord() {
        return hotelDAO.getLandlord();
    }

    @Override
    public void save(HotelVo hotelVo) {
        hotelDAO.save(hotelVo);
    }

    @Override
    public void remove(HotelVo hotelVo) {
        hotelDAO.remove(hotelVo);
    }

    @Override
    public void removeById(Long id) {
        hotelDAO.removeById(id);
    }

    @Override
    public void update(HotelVo hotelVo) {
        hotelDAO.update(hotelVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        hotelDAO.updateStatus(statusQuery);
    }

    @Override
    public HotelVo getById(Long id) {
        return hotelDAO.getById(id);
    }

    @Override
    public List<HotelVo> listAll() {
        return hotelDAO.listAll();
    }

    @Override
    public List<HotelVo> listPage(PageQuery pageQuery) {
        return hotelDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return hotelDAO.count();
    }
}
