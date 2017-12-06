package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.CashAccountsVo;
import top.zywork.vo.Select2Vo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/3.
 */
@Repository
public interface CashAccountsDAO extends BaseDAO<CashAccountsVo>{
    void updateCashStatus(CashAccountsVo cashAccountsVo);
    List<Select2Vo> getSubject(Long companyId);
    void updateRemark(CashAccountsVo cashAccountsVo);
    void checkerManyCashAccount(List<CashAccountsVo> cashAccountsVoList);
}
