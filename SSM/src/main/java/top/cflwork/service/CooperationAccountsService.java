package top.cflwork.service;

import top.cflwork.query.PageQuery;
import top.cflwork.vo.CashAccountsVo;
import top.cflwork.vo.CooperationAccountsVo;
import top.cflwork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/12/3.
 */
public interface CooperationAccountsService extends BaseService<CooperationAccountsVo>{
    void updateCashStatus(CooperationAccountsVo cooperationAccountsVo);
    List<Select2Vo> getSubject(Long companyId);
    List<Select2Vo> getCooperationCompany(PageQuery pageQuery);
    void updateRemark(CooperationAccountsVo cooperationAccountsVo);
    void checkerManyCashAccount(List<CooperationAccountsVo> cooperationAccountsVos);
    List<CooperationAccountsVo> listPages(PageQuery pageQuery);
    Long counts(PageQuery pageQuery);
}
