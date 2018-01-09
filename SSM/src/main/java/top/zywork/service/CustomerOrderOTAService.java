package top.zywork.service;

import top.zywork.vo.CustomerOrderOTAVO;

import java.util.List;

public interface CustomerOrderOTAService extends BaseService<CustomerOrderOTAVO> {

    void batchSave(List<Object> orders);

}
