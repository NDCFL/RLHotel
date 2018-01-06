package top.zywork.service;

import top.zywork.query.PageQuery;
import top.zywork.vo.HouseRentVo;
import top.zywork.vo.RentPayVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

public interface RentPayService extends BaseService<RentPayVo>{
    List<Select2Vo> getContractMaster(Long companyId);
    List<Select2Vo> getHotel(Long companyId);
    HouseRentVo notHotelId();
    HouseRentVo haveHotelId(Long hotelId);
    void huankuan(Long id);
    List<Select2Vo> getHouse(PageQuery pageQuery);
}
