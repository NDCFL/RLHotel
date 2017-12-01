package top.zywork.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zywork.query.PageQuery;
import top.zywork.service.BaseService;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
@Repository
public interface KeyInDAO extends BaseDAO<UserVo>{
    long counts(long userId);
    List<UserVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("userId") long userId);

}
