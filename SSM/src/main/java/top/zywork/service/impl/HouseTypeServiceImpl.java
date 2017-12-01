package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HouseTypeDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouseTypeService;
import top.zywork.vo.HouseTypeVo;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HouseTypeServiceImpl implements HouseTypeService {
    @Resource
    private HouseTypeDAO houseTypeDAO;

    @Override
    public void save(HouseTypeVo houseTypeVo) {
        houseTypeDAO.save(houseTypeVo);
    }

    @Override
    public void remove(HouseTypeVo houseTypeVo) {
        houseTypeDAO.remove(houseTypeVo);
    }

    @Override
    public void removeById(Long id) {
        houseTypeDAO.removeById(id);
    }

    @Override
    public void update(HouseTypeVo houseTypeVo) {
        houseTypeDAO.update(houseTypeVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        houseTypeDAO.updateStatus(statusQuery);
    }

    @Override
    public HouseTypeVo getById(Long id) {
        return houseTypeDAO.getById(id);
    }

    @Override
    public List<HouseTypeVo> listAll() {
        return houseTypeDAO.listAll();
    }

    @Override
    public List<HouseTypeVo> listPage(PageQuery pageQuery) {
        return houseTypeDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return houseTypeDAO.count(pageQuery);
    }
}
