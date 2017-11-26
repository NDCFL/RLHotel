package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.vo.HouseVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Repository
public interface HouseDAO extends  BaseDAO<HouseVo> {
    List<Select2Vo> houseTypeList(long companyId);
    List<Select2Vo> hotelList(long companyId);
    List<Select2Vo> userList(long companyId);
    String getHouseCardTitle(long companyId);
}
