package top.cflwork.common;

import org.junit.Test;

/**
 * UUID工具测试类
 * 创建于2017-08-15
 *
 * @author 陈飞龙
 */
public class UUIDUtilsTest {
    @Test
    public void testUUID() {
        System.out.println(UUIDUtils.uuid());
    }

    @Test
    public void testUUIDWithoutLine() {
        System.out.println(UUIDUtils.uuidWithoutLine());
    }
}
