package exception;

/**
 * 统一的DAO异常类，在DAO中不需要每一个异常类都去捕捉，统一使用catch (Exception e)的方式，并抛出DAOException<br />
 * 创建于2017-08-24
 *
 * @author 王振宇
 * @version 1.0
 */
public class DAOException extends BaseException {

    private static final long serialVersionUID = -890711541168008154L;

    public DAOException() {
        super();
    }

    public DAOException(String message) {
        super(message);
    }

    public DAOException(int code, String message) {
        super(code, message);
    }

    public DAOException(String message, Throwable cause) {
        super(message, cause);
    }

    public DAOException(Throwable cause) {
        super(cause);
    }

    protected DAOException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
