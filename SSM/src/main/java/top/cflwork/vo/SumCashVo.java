package top.cflwork.vo;

import java.io.Serializable;
import java.util.function.DoubleBinaryOperator;

/**
 * Created by chenfeilong on 2018/1/7.
 */
public class SumCashVo implements Serializable {

    private Double sumMoneyIn;
    private Double sumMoneyOut;
    private Double sumMoneyJieyu;

    public Double getSumMoneyIn() {
        return sumMoneyIn;
    }

    public void setSumMoneyIn(Double sumMoneyIn) {
        this.sumMoneyIn = sumMoneyIn;
    }

    public Double getSumMoneyOut() {
        return sumMoneyOut;
    }

    public void setSumMoneyOut(Double sumMoneyOut) {
        this.sumMoneyOut = sumMoneyOut;
    }

    public Double getSumMoneyJieyu() {
        return sumMoneyIn-sumMoneyOut;
    }

    public void setSumMoneyJieyu(Double sumMoneyJieyu) {
        this.sumMoneyJieyu = sumMoneyJieyu;
    }
}
