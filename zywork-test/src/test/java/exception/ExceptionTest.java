package exception;

import org.junit.Test;

/**
 * Created by Wang Genshen on 2017-09-07.
 */
public class ExceptionTest {

    public static void test1() {
        throw new DAOException(1, "dao");
    }

    public static void test2() {
        try {
            test1();
        } catch (DAOException e) {
            throw new ServiceException(e);
        }
    }

    @Test
    public void testException() {
        try {
            test2();
        } catch (ServiceException e) {
            System.out.println(e.getCode());
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
