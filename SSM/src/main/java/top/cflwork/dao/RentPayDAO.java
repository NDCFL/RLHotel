package top.cflwork.dao;

import org.springframework.stereotype.Repository;
import top.cflwork.query.PageQuery;
import top.cflwork.vo.HouseRentPayVo;
import top.cflwork.vo.HouseRentVo;
import top.cflwork.vo.RentPayVo;
import top.cflwork.vo.Select2Vo;

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
