package top.cflwork.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.cflwork.service.RoleService;
import top.cflwork.vo.RoleVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色服务测试类<br />
 * 创建于2017-08-24
 *
 * @author 陈飞龙
 */
@ContextConfiguration(locations = {"classpath:/config/spring-mybatis.xml",
        "classpath:/config/spring-context.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class RoleServiceTest {

    @Resource
    private RoleService roleService;

    @Test
    public void testListByAccount() {
        List<RoleVo> roleVoList = roleService.listByAccount("13672297775");
        for (RoleVo roleVo : roleVoList) {
            System.out.println(roleVo.getTitle());
        }
    }

}
