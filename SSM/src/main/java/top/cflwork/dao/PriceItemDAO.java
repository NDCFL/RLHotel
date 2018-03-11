package top.cflwork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.PriceItemVo;

import java.util.List;

@Repository
public interface PriceItemDAO extends BaseDAO<PriceItemVo>{
    List<PriceItemVo> findPriceItemList(@Param("pageQuery")PageQuery pageQuery, @Param("priceItemVo") PriceItemVo priceItemVo);
    long findPriceItemByCount(@Param("pageQuery")PageQuery pageQuery,@Param("priceItemVo") PriceItemVo priceItemVo);

}