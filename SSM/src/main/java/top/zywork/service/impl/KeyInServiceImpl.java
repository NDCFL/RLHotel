package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.dao.KeyInDAO;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.KeyInService;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Service
public class KeyInServiceImpl implements KeyInService {
    @Resource
    private KeyInDAO keyInDAO;
    @Override
    public void save(UserVo userVo) {
        keyInDAO.save(userVo);
    }

    @Override
    public void remove(UserVo userVo) {
        keyInDAO.remove(userVo);
    }

    @Override
    public void removeById(Long id) {
        keyInDAO.removeById(id);
    }

    @Override
    public void update(UserVo userVo) {
        keyInDAO.update(userVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        keyInDAO.updateStatus(statusQuery);
    }

    @Override
    public UserVo getById(Long id) {
        return keyInDAO.getById(id);
    }

    @Override
    public List<UserVo> listAll() {
        return keyInDAO.listAll();
    }

    @Override
    public List<UserVo> listPage(PageQuery pageQuery) {
        return keyInDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return keyInDAO.count(pageQuery);
    }

    @Override
    public long counts(long userId) {
        return keyInDAO.counts(userId);
    }

    @Override
    public List<UserVo> listPages(PageQuery pageQuery, long userId) {
        return keyInDAO.listPages(pageQuery,userId);
    }
}
