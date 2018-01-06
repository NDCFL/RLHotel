package top.zywork.dao;

import org.springframework.stereotype.Repository;
import top.zywork.query.PageQuery;
import top.zywork.vo.HouseRentPayVo;
import top.zywork.vo.HouseRentVo;
import top.zywork.vo.RentPayVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

@Repository
public interface RentPayDAO extends BaseDAO<RentPayVo>{
    List<Select2Vo> getContractMaster(Long companyId);
    List<Select2Vo> getHotel(Long companyId);
    HouseRentVo notHotelId();
    HouseRentVo haveHotelId(Long hotelId);
    void huankuan(Long id);
    List<Select2Vo> getHouse(PageQuery pageQuery);
}
