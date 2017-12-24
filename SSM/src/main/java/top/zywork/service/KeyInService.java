package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.query.PageQuery;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
public interface KeyInService extends BaseService<UserVo>{
    long counts(long userId);
    void initPwd(String password,Long id);
    List<UserVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("userId") long userId);

}
