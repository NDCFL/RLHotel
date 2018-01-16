package exception;

/**
 * Created by Wang Genshen on 2017-09-07.
 */
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = -7950025963157139258L;

    private Integer code;

    public BaseException() {
        super();
    }

    public BaseException(String message) {
        super(message);
    }

    public BaseException(int code, String message) {
        super(message);
        this.code = code;
    }

    public BaseException(String message, Throwable cause) {
        super(message, cause);
        if (cause instanceof BaseException) {
            setCode(((BaseException) cause).getCode());
        }
    }

    public BaseException(Throwable cause) {
        super(cause);
        if (cause instanceof BaseException) {
            setCode(((BaseException) cause).getCode());
        }
    }

    protected BaseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
        if (cause instanceof BaseException) {
            setCode(((BaseException) cause).getCode());
        }
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
