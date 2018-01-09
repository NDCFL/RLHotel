package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.CustomerOrderOTAVO;

import java.util.List;

@Repository
public interface CustomerOrderOTADAO extends BaseDAO<CustomerOrderOTAVO> {

    void batchSave(List<Object> orders);

}
