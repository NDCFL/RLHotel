package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.HouserDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.HouserService;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Service
public class HouserServiceImpl implements HouserService{
    @Resource
    private HouserDAO houserDAO;
    @Override
    public void save(UserVo userVo) {
        houserDAO.save(userVo);
    }

    @Override
    public void remove(UserVo userVo) {
        houserDAO.remove(userVo);
    }

    @Override
    public void removeById(Long id) {
        houserDAO.removeById(id);
    }

    @Override
    public void update(UserVo userVo) {
        houserDAO.update(userVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        houserDAO.updateStatus(statusQuery);
    }

    @Override
    public UserVo getById(Long id) {
        return houserDAO.getById(id);
    }

    @Override
    public List<UserVo> listAll() {
        return houserDAO.listAll();
    }

    @Override
    public List<UserVo> listPage(PageQuery pageQuery) {
        return houserDAO.listPage(pageQuery);
    }

    @Override
    public long count() {
        return houserDAO.count();
    }
}
