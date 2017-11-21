package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.query.PageQuery;
import top.zywork.vo.ContractVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/17.
 */
public interface ContractService extends BaseService<ContractVo>{
    List<ContractVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("companyId") long companyId);
    long counts(long companyId);
    List<ContractVo> listPagesByMaster(@Param("pageQuery") PageQuery pageQuery, @Param("companyId") long companyId,@Param("masterId") long masterId);
    long countsByMaster(long companyId,long masterId);
}
