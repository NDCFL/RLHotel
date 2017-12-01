package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.dao.BaseDAO;
import top.zywork.query.PageQuery;
import top.zywork.vo.LandlordVo;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/3.
 */
public interface LandlordService extends BaseService<UserVo> {
    List<UserVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("companyId") long companyId);
    List<UserVo> listAlls(long companyId);
}
