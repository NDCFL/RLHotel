package top.zywork.service;

import org.apache.ibatis.annotations.Param;
import top.zywork.query.PageQuery;
import top.zywork.vo.UserVo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/11/12.
 */
public interface CheckerService extends BaseService<UserVo>{
    long counts(long userId);
    void initPwd(String password,Long id);
    List<UserVo> listPages(PageQuery pageQuery,long userId);
}
