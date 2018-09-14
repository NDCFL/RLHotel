package top.cflwork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.IncomeVo;

import java.util.List;
@Repository
public interface IncomeDAO  extends BaseDAO<IncomeVo> {

	List<IncomeVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("incomeVo") IncomeVo incomeVo);
	
    long counts(@Param("pageQuery") PageQuery pageQuery, @Param("incomeVo") IncomeVo incomeVo);
	
}
