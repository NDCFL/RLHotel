package top.cflwork.dao;

import top.cflwork.vo.LogVo;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import top.cflwork.query.PageQuery;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import top.cflwork.dao.BaseDAO;

/**
 * 系统日志
 * @author cflwork
 * @email xljx_888888@163.com
 * @date 2018-09-29 09:36:57
 */
@Repository
public interface LogDAO extends BaseDAO<LogVo>{
    List<LogVo> listPages(@Param("pageQuery") PageQuery pageQuery, @Param("logVo") LogVo logVo);
    long counts(@Param("pageQuery") PageQuery pageQuery, @Param("logVo") LogVo logVo);
}
