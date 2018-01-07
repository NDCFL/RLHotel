package top.zywork.service;

import top.zywork.query.PageQuery;
import top.zywork.vo.CashAccountsVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.SumCashVo;

import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/3.
 */
public interface CashAccountsService extends BaseService<CashAccountsVo>{
    void updateCashStatus(CashAccountsVo cashAccountsVo);
    List<Select2Vo> getSubject(Long companyId);
    void updateRemark(CashAccountsVo cashAccountsVo);
    void checkerManyCashAccount(List<CashAccountsVo> cashAccountsVoList);
    List<Select2Vo> getHotel(Long companyId);
    List<Select2Vo> getPayType(Long companyId);
    SumCashVo sumCash(Date dateVal, Long companyId);
    List<CashAccountsVo> listPages(PageQuery pageQuery);
    long counts(PageQuery pageQuery);
}
