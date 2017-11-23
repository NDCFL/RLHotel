package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HouseDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouseService;
import top.zywork.vo.HouseVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Service
public class HouseServiceImpl implements HouseService {
    @Resource
    private HouseDAO houserDAO;
    @Override
    public void save(HouseVo userVo) {
        houserDAO.save(userVo);
    }

    @Override
    public void remove(HouseVo userVo) {
        houserDAO.remove(userVo);
    }

    @Override
    public void removeById(Long id) {
        houserDAO.removeById(id);
    }

    @Override
    public void update(HouseVo userVo) {
        houserDAO.update(userVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        houserDAO.updateStatus(statusQuery);
    }

    @Override
    public HouseVo getById(Long id) {
        return houserDAO.getById(id);
    }

    @Override
    public List<HouseVo> listAll() {
        return houserDAO.listAll();
    }

    @Override
    public List<HouseVo> listPage(PageQuery pageQuery) {
        return houserDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return houserDAO.count();
    }
}
