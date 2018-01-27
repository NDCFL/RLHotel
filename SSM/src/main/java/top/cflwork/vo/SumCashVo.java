package top.cflwork.vo;

import java.io.Serializable;
import java.util.function.DoubleBinaryOperator;

/**
 * Created by chenfeilong on 2018/1/7.
 */
public class SumCashVo implements Serializable {

    private Double wxin;
    private Double wxout;
    private Double wxjy;
    private Double zfbin;
    private Double zfbout;
    private Double zfbjy;
    private Double ylin;
    private Double ylout;
    private Double yljy;
    private Double zjin;
    private Double zjout;
    private Double xjin;
    private Double xjout;
    private Double xjjy;
    private Double ykVal;
    private Integer yk;

    public Double getWxin() {
        return wxin;
    }

    public void setWxin(Double wxin) {
        this.wxin = wxin;
    }

    public Double getWxout() {
        return wxout;
    }

    public void setWxout(Double wxout) {
        this.wxout = wxout;
    }

    public Double getZfbin() {
        return zfbin;
    }

    public void setZfbin(Double zfbin) {
        this.zfbin = zfbin;
    }

    public Double getZfbout() {
        return zfbout;
    }

    public void setZfbout(Double zfbout) {
        this.zfbout = zfbout;
    }

    public Double getYlin() {
        return ylin;
    }

    public void setYlin(Double ylin) {
        this.ylin = ylin;
    }

    public Double getYlout() {
        return ylout;
    }

    public void setYlout(Double ylout) {
        this.ylout = ylout;
    }

    public Double getZjin() {
        return zjin;
    }

    public void setZjin(Double zjin) {
        this.zjin = zjin;
    }

    public Double getZjout() {
        return zjout;
    }

    public void setZjout(Double zjout) {
        this.zjout = zjout;
    }

    public Integer getYk() {
        if(zjin-zjout<0){
            yk=0;//收入减支出小于0表示改月是亏损
        }else{
            yk=1;//收入减支出小于0表示改月是盈利
        }
        return yk;
    }

    public void setYk(Integer yk) {
        this.yk = yk;
    }

    public Double getYkVal() {
        return Math.abs(zjin-zjout);
    }

    public void setYkVal(Double ykVal) {
        this.ykVal = ykVal;
    }

    public Double getXjin() {
        return xjin;
    }

    public void setXjin(Double xjin) {
        this.xjin = xjin;
    }

    public Double getXjout() {
        return xjout;
    }

    public void setXjout(Double xjout) {
        this.xjout = xjout;
    }

    public Double getWxjy() {
        return wxin-wxout;
    }

    public void setWxjy(Double wxjy) {
        this.wxjy = wxjy;
    }

    public Double getZfbjy() {
        return zfbin-zfbout;
    }

    public void setZfbjy(Double zfbjy) {
        this.zfbjy = zfbjy;
    }

    public Double getYljy() {
        return ylin-ylout;
    }

    public void setYljy(Double yljy) {
        this.yljy = yljy;
    }

    public Double getXjjy() {
        return xjin-xjout;
    }

    public void setXjjy(Double xjjy) {
        this.xjjy = xjjy;
    }
}
