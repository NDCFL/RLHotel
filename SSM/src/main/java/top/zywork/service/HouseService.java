package top.zywork.service;

import org.springframework.stereotype.Service;
import top.zywork.query.StatusQuery;
import top.zywork.vo.HouseVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
public interface HouseService extends  BaseService<HouseVo>{
    List<Select2Vo> houseTypeList(long companyId);
    List<Select2Vo> hotelList(long companyId);
    List<Select2Vo> userList(long companyId);
    String getHouseCardTitle(long companyId);
    void updateHouseStatus(StatusQuery statusQuery,Date leaveTitle);
}
