package top.cflwork.service;

import org.apache.ibatis.annotations.Param;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.PriceItemVo;

import java.util.List;

public interface PriceItemService extends BaseService<PriceItemVo>{
    List<PriceItemVo> findPriceItemList(PageQuery pageQuery, PriceItemVo priceItemVo);
    long findPriceItemByCount(PageQuery pageQuery,PriceItemVo priceItemVo);

}
