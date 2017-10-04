package top.zywork.dozer;

import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.junit.Test;
import top.zywork.dos.BaseDO;
import top.zywork.dto.BaseDTO;

import java.util.ArrayList;
import java.util.List;

/**
 * Dozer工具测试类
 * 创建于2017-08-24
 *
 * @author 王振宇
 */
public class DozerTest {

    @Test
    public void testDozer() {
        Mapper mapper = new DozerBeanMapper();
        BaseDO baseDO = new BaseDO(100L);
        BaseDTO baseDTO = mapper.map(baseDO, BaseDTO.class);
        System.out.println(baseDTO.getId());
    }

    @Test
    public void testDozerField() {
        List<String> mappingFiles = new ArrayList();
        mappingFiles.add("dozerBeanMapping.xml");
        Mapper mapper = new DozerBeanMapper(mappingFiles);
        BaseDO baseDO = new BaseDO(200L);
        top.zywork.dozer.BaseDO baseDO1 = mapper.map(baseDO, top.zywork.dozer.BaseDO.class);
        System.out.println(baseDO1.getIdd());
    }

    @Test
    public void testDozerList() {
        DozerBeanMapper mapper = new DozerBeanMapper();
        List<BaseDO> baseDOList = new ArrayList<>();
        baseDOList.add(new BaseDO(100L));
        baseDOList.add(new BaseDO(200L));
        List<BaseDTO> baseDTOList = new ArrayList<>();
        mapper.map(baseDOList, baseDTOList);
        if (baseDTOList.size() > 0) {
            for (BaseDTO baseDTO : baseDTOList) {
                System.out.println(baseDTO.getId());
            }
        }
    }

}
