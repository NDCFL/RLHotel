package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.EmployeeVo;

/**
 * Created by chenfeilong on 2017/11/27.
 */
@Repository
public interface EmployeeDAO extends BaseDAO<EmployeeVo>{
    EmployeeVo getHotelId(Long employeeId);
}
