package cn.tw.util;

public class ExceptionHanding extends RuntimeException{
    public ExceptionHanding(String message) {
        super(message);
    }

    public ExceptionHanding(String message, Throwable cause) {
        super(message, cause);
    }
}
