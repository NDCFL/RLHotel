package top.cflwork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.vo.BusinessManVo;
import top.cflwork.vo.Select2Vo;

import java.util.List;

@Repository
public interface BusinessManDAO extends BaseDAO<BusinessManVo>{
    List<Select2Vo> businessManList();
    void updateType(StatusQuery statusQuery);
    List<BusinessManVo> findBusinessManList(@Param("pageQuery")PageQuery pageQuery,@Param("businessManVo") BusinessManVo businessManVo);
    long findBusinessByCount(@Param("pageQuery")PageQuery pageQuery,@Param("businessManVo") BusinessManVo businessManVo);
}
