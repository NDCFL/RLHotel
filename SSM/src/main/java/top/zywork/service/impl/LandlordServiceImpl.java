package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.LandlordDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.LandlordService;
import top.zywork.vo.LandlordVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/3.
 */
@Service
public class LandlordServiceImpl implements LandlordService {
    @Resource
    private LandlordDAO landlordDAO;
    @Override
    public void save(LandlordVo landlordVo) {
        landlordDAO.save(landlordVo);
    }

    @Override
    public void remove(LandlordVo landlordVo) {
        landlordDAO.remove(landlordVo);
    }

    @Override
    public void removeById(Long id) {
        landlordDAO.removeById(id);
    }

    @Override
    public void update(LandlordVo landlordVo) {
        landlordDAO.update(landlordVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        landlordDAO.updateStatus(statusQuery);
    }

    @Override
    public LandlordVo getById(Long id) {
        return landlordDAO.getById(id);
    }

    @Override
    public List<LandlordVo> listAll() {
        return landlordDAO.listAll();
    }

    @Override
    public List<LandlordVo> listPage(PageQuery pageQuery) {
        return landlordDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return landlordDAO.count();
    }
}
