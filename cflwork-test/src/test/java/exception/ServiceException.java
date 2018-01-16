package exception;

/**
 * 统一的Service异常类，在service中不需要对每一个异常都进行细致的捕捉，而可以用catch (Exception e)的方式，
 * 并且抛出ServiceException<br/>
 * 创建于2017-08-24
 *
 * @author 王振宇
 * @version 1.0
 */
public class ServiceException extends BaseException {

    private static final long serialVersionUID = 3175276262178811936L;

    public ServiceException() {
        super();
    }

    public ServiceException(String message) {
        super(message);
    }

    public ServiceException(int code, String message) {
        super(code, message);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public ServiceException(Throwable cause) {
        super(cause);
    }

    protected ServiceException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
