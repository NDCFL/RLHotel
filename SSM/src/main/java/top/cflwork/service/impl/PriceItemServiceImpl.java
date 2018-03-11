package top.cflwork.service.impl;

import org.springframework.stereotype.Service;
import top.cflwork.dao.PriceItemDAO;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.PriceItemService;
import top.cflwork.vo.PriceItemVo;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PriceItemServiceImpl implements PriceItemService {
    @Resource
    private PriceItemDAO priceItemDAO;
    @Override
    public void save(PriceItemVo priceItemVo) {
        priceItemDAO.save(priceItemVo);
    }

    @Override
    public void remove(PriceItemVo priceItemVo) {
        priceItemDAO.remove(priceItemVo);
    }

    @Override
    public void removeById(Long id) {
        priceItemDAO.removeById(id);
    }

    @Override
    public void update(PriceItemVo priceItemVo) {
        priceItemDAO.update(priceItemVo);
    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {
        priceItemDAO.updateStatus(statusQuery);
    }

    @Override
    public PriceItemVo getById(Long id) {
        return priceItemDAO.getById(id);
    }

    @Override
    public List<PriceItemVo> listAll() {
        return priceItemDAO.listAll();
    }

    @Override
    public List<PriceItemVo> listPage(PageQuery pageQuery) {
        return priceItemDAO.listPage(pageQuery);
    }

    @Override
    public long count(PageQuery pageQuery) {
        return priceItemDAO.count(pageQuery);
    }

    @Override
    public List<PriceItemVo> findPriceItemList(PageQuery pageQuery, PriceItemVo priceItemVo) {
        return priceItemDAO.findPriceItemList(pageQuery, priceItemVo);
    }

    @Override
    public long findPriceItemByCount(PageQuery pageQuery, PriceItemVo priceItemVo) {
        return priceItemDAO.findPriceItemByCount(pageQuery, priceItemVo);
    }
}
