package top.zywork.service.impl;

import org.springframework.stereotype.Service;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.UserRoleService;
import top.zywork.vo.UserRoleVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/27.
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {
    @Resource
    private UserRoleService userRoleService;
    @Override
    public void save(UserRoleVo userRoleVo) {

    }

    @Override
    public void remove(UserRoleVo userRoleVo) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(UserRoleVo userRoleVo) {

    }

    @Override
    public void updateStatus(StatusQuery statusQuery) {

    }

    @Override
    public UserRoleVo getById(Long id) {
        return null;
    }

    @Override
    public List<UserRoleVo> listAll() {
        return null;
    }

    @Override
    public List<UserRoleVo> listPage(PageQuery pageQuery) {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }

    @Override
    public List<String> pageListByUserId(String userId) {
        return null;
    }
}
