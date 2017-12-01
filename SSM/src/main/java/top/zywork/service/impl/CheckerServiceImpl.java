package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.CheckerDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.CheckerService;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Service
public class CheckerServiceImpl implements CheckerService {
    @Resource
    private CheckerDAO checkerDAO;
    @Override
    public void save(UserVo userVo) {
        checkerDAO.save(userVo);
    }

    @Override
    public void remove(UserVo userVo) {
        checkerDAO.remove(userVo);
    }

    @Override
    public void removeById(Long id) {
        checkerDAO.removeById(id);
    }

    @Override
    public void update(UserVo userVo) {
        checkerDAO.update(userVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        checkerDAO.updateStatus(statusQuery);
    }

    @Override
    public UserVo getById(Long id) {
        return checkerDAO.getById(id);
    }

    @Override
    public List<UserVo> listAll() {
        return checkerDAO.listAll();
    }

    @Override
    public List<UserVo> listPage(PageQuery pageQuery) {
        return checkerDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return checkerDAO.count(pageQuery);
    }

    @Override
    public long counts(long userId) {
        return checkerDAO.counts(userId);
    }

    @Override
    public List<UserVo> listPages(PageQuery pageQuery, long userId) {
        return checkerDAO.listPages(pageQuery,userId);
    }
}
