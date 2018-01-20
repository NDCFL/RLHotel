package top.cflwork.dao;

import org.activiti.engine.impl.Page;
import org.springframework.stereotype.Repository;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.CashAccountsVo;
import top.cflwork.vo.CooperationAccountsVo;
import top.cflwork.vo.CooperationCompanyVo;
import top.cflwork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/12/3.
 */
@Repository
public interface CooperationAccountsDAO extends BaseDAO<CooperationAccountsVo>{
    void updateCashStatus(CooperationAccountsVo cooperationAccountsVo);
    List<Select2Vo> getSubject(Long companyId);
    List<Select2Vo> getCooperationCompany(PageQuery pageQuery);
    void updateRemark(CooperationAccountsVo cooperationAccountsVo);
    void checkerManyCashAccount(List<CooperationAccountsVo> cooperationAccountsVos);
    List<CooperationAccountsVo> listPages(PageQuery pageQuery);
    Long counts(PageQuery pageQuery);
}
