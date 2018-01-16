package top.cflwork.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.cflwork.service.PermissionService;
import top.cflwork.vo.PermissionVo;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 权限服务测试类<br />
 * 创建于2017-09-11
 *
 * @author 陈飞龙
 */
@ContextConfiguration(locations = {"classpath:/config/spring-mybatis.xml",
        "classpath:/config/spring-context.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class PermissionServiceTest {

    @Resource
    private PermissionService permissionService;

    @Test
    public void testListByRoleIds() {
        List<Long> roleIds = new ArrayList<>();
        roleIds.add(1L);
        roleIds.add(2L);
        List<PermissionVo> permissionVoList = permissionService.listByRoleIds(roleIds);
        for (PermissionVo permissionVo : permissionVoList) {
            System.out.println(permissionVo.getTitle());
        }
    }

    @Test
    public void testListByAccount() {
        List<PermissionVo> permissionVoList = permissionService.listByAccount("13672297775");
        for (PermissionVo permissionVo : permissionVoList) {
            System.out.println(permissionVo.getTitle());
        }
    }

}
