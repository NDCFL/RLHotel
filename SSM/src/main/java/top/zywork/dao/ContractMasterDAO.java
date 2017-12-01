package top.zywork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zywork.query.PageQuery;
import top.zywork.vo.ContractMasterVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/16.
 */
@Repository
public interface ContractMasterDAO extends  BaseDAO<ContractMasterVo> {
    List<ContractMasterVo> listPages(@Param("pageQuery") PageQuery pageQuery,@Param("companyId") long companyId);
    long counts(@Param("companyId") long companyId,@Param("pageQuery") PageQuery pageQuery);
    List<Select2Vo> listAlls(long companyId);
}
