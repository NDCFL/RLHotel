package top.cflwork.service;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.IncomeVo;
import java.util.List;
public interface IncomeService  extends BaseService<IncomeVo> {

	List<IncomeVo> listPages(PageQuery pageQuery, IncomeVo incomeVo);
	
    long counts(PageQuery pageQuery, IncomeVo incomeVo);
	
}
