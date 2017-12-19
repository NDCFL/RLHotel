package top.zywork.service;

import top.zywork.query.PageQuery;
import top.zywork.vo.CustomerOrderVo;
import top.zywork.vo.Select2Vo;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/12/9.
 */
public interface CustomerOrderService extends BaseService<CustomerOrderVo>{
    List<Select2Vo> getSubject(Long companyId);
    List<Select2Vo> getWeb(Long companyId);
    List<Select2Vo> getHouse(PageQuery pageQuery, Long type, Date leaveTime, int status);
    void updateCashStatus(CustomerOrderVo customerOrderVo);
    void updateRemark(CustomerOrderVo customerOrderVo);
    void checkerManyCashAccount(List<CustomerOrderVo> customerOrderVoList);
    List<Select2Vo> getOthersHotel(PageQuery pageQuery);
    void saveList(List<CustomerOrderVo> customerOrderVoList);
}
