package top.cflwork.service;

import org.apache.ibatis.annotations.Param;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.vo.BusinessManVo;
import top.cflwork.vo.Select2Vo;

import java.util.List;

public interface BusinessManService extends BaseService<BusinessManVo>{
    List<Select2Vo> businessManList();
    void updateType(StatusQuery statusQuery);
    List<BusinessManVo> findBusinessManList(PageQuery pageQuery, BusinessManVo businessManVo);
    long findBusinessByCount(PageQuery pageQuery,BusinessManVo businessManVo);

}
