package top.zywork.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import top.zywork.service.RoleService;
import top.zywork.vo.RoleVo;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色服务测试类<br />
 * 创建于2017-08-24
 *
 * @author 王振宇
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
