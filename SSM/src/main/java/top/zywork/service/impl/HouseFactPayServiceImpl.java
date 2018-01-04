package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HouseFactPayDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouseFactPayService;
import top.zywork.vo.HouseFactPayVo;
import javax.annotation.Resource;
import java.util.List;

@Service
public class HouseFactPayServiceImpl implements HouseFactPayService {
    @Resource
    private HouseFactPayDAO houseFactPayDAO;
    @Override
    public void save(HouseFactPayVo houseFactPayVo) {
        houseFactPayDAO.save(houseFactPayVo);
    }

    @Override
    public void remove(HouseFactPayVo houseFactPayVo) {
        houseFactPayDAO.remove(houseFactPayVo);
    }

    @Override
    public void removeById(Long id) {
        houseFactPayDAO.removeById(id);
    }

    @Override
    public void update(HouseFactPayVo houseFactPayVo) {
        houseFactPayDAO.update(houseFactPayVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        houseFactPayDAO.updateStatus(statusQuery);
    }

    @Override
    public HouseFactPayVo getById(Long id) {
        return houseFactPayDAO.getById(id);
    }

    @Override
    public List<HouseFactPayVo> listAll() {
        return houseFactPayDAO.listAll();
    }

    @Override
    public List<HouseFactPayVo> listPage(PageQuery pageQuery) {
        return houseFactPayDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return houseFactPayDAO.count(pageQuery);
    }
}
