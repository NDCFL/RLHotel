package top.zywork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zywork.query.PageQuery;
import top.zywork.vo.HouseTypeVo;
import top.zywork.vo.HouseVo;

import java.util.List;

@Repository
public interface HouseTypeDAO extends BaseDAO<HouseTypeVo>{

    Long findCount(@Param("pageQuery")PageQuery pageQuery,@Param("houseTypeVo") HouseTypeVo houseTypeVo);
    List<HouseTypeVo> findPage(@Param("pageQuery")PageQuery pageQuery, @Param("houseTypeVo") HouseTypeVo houseTypeVo);
}
