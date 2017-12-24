package top.zywork.service;

import org.springframework.stereotype.Service;
import top.zywork.vo.HouseRentPayVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/12/24.
 */
public interface HouseRentPayService extends BaseService<HouseRentPayVo>{

    List<Select2Vo> getContractMaster(Long companyId);
    List<Select2Vo> getHotel(Long companyId);
}
