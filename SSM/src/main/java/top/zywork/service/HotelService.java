package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.query.PageQuery;
import top.zywork.vo.HotelVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

public interface HotelService extends BaseService<HotelVo>{
    long counts(long companyId);
    List<HotelVo> listPages(PageQuery pageQuery, long companyId);
    List<Select2Vo> getContract();
    List<Select2Vo> getLandlord();
}
