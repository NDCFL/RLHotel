package top.zywork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zywork.query.PageQuery;
import top.zywork.vo.LandlordVo;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/3.
 */
@Repository
public interface LandlordDAO extends  BaseDAO<UserVo> {
    List<UserVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("companyId") long companyId);
    List<UserVo> listAlls(long companyId);
    void initPwd(@Param("password") String password,@Param("id") Long id);
}
