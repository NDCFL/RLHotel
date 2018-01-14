package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.query.PageQuery;
import top.zywork.vo.HouseTypeVo;

import java.util.List;

public interface HouseTypeService extends  BaseService<HouseTypeVo>{
    Long findCount(PageQuery pageQuery, HouseTypeVo houseTypeVo);
    List<HouseTypeVo> findPage(PageQuery pageQuery, HouseTypeVo houseTypeVo);

}
