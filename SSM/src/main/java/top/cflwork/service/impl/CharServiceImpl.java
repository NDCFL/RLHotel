package top.cflwork.service.impl;

import org.springframework.stereotype.Service;
import top.cflwork.dao.CharDAO;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.CharService;
import top.cflwork.vo.CharVo;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CharServiceImpl implements CharService {
    @Resource
    private CharDAO charDAO;
    @Override
    public void save(CharVo charVo) {
        charDAO.save(charVo);
    }

    @Override
    public void remove(CharVo charVo) {
        charDAO.remove(charVo);
    }

    @Override
    public void removeById(Long id) {
        charDAO.removeById(id);
    }

    @Override
    public void update(CharVo charVo) {
        charDAO.update(charVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        charDAO.updateStatus(statusQuery);
    }

    @Override
    public CharVo getById(Long id) {
        return charDAO.getById(id);
    }

    @Override
    public List<CharVo> listAll() {
        return charDAO.listAll();
    }

    @Override
    public List<CharVo> listPage(PageQuery pageQuery) {
        return charDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return charDAO.count(pageQuery);
    }
}
