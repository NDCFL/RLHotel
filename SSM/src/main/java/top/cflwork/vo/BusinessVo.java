package top.cflwork.vo;

import java.io.Serializable;
public class BusinessVo implements Serializable {
    private Integer sumHotel=0;
    private Integer sumPrice=0;
    private Integer countBusincess=0;
    private String times;
    public Integer getSumHotel() {
        return sumHotel;
    }

    public void setSumHotel(Integer sumHotel) {
        this.sumHotel = sumHotel;
    }

    public Integer getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Integer sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Integer getCountBusincess() {
        return countBusincess;
    }

    public void setCountBusincess(Integer countBusincess) {
        this.countBusincess = countBusincess;
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times;
    }
}
