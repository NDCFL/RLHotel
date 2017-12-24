package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.HouseRentPayVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/12/24.
 */
@Repository
public interface HouseRentPayDAO extends BaseDAO<HouseRentPayVo>{

    List<Select2Vo> getContractMaster(Long companyId);
    List<Select2Vo> getHotel(Long companyId);
}
