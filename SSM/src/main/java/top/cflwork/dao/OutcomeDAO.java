package top.cflwork.dao;

import org.apache.ibatis.annotations.Param;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.CooperationAccountsVo;
import top.cflwork.vo.HotelVo;
import top.cflwork.vo.OutcomeVo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import top.cflwork.dao.BaseDAO;

/**
 * 酒店的支出表，记录哪个公司旗下的哪个酒店，的支出明细
 * @author chglee
 * @email xljx_888888@163.com
 * @date 2018-09-11 16:00:27
 */
@Repository
public interface OutcomeDAO extends BaseDAO<OutcomeVo>{
    List<OutcomeVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("outcomeVo") OutcomeVo outcomeVo);
    long counts(@Param("pageQuery") PageQuery pageQuery, @Param("outcomeVo") OutcomeVo outcomeVo);
}
