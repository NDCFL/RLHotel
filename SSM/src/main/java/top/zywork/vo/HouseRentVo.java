package top.zywork.vo;

import java.io.Serializable;

/**
 * Created by chenfeilong on 2017/12/26.
 */
public class HouseRentVo implements Serializable {

    private Integer houseTotal;//总房间数
    private Double dfPayMoney;//待付金额
    private Double monthPayMoney;//平均每月租金
    private Double houseMonthPayMoney;//每间每月
    private Double houseDayPayMoney;//每间，每天
    private Double chaoqiPayMoney;//超期未付
    private Double fiveDayPayMoney;//近5日待付
    private Double thisMonthPayMoney;//本月应付
    private Double thisMonthPayAll;//本月已付租金总额
    private Double thisMonthNotPay;//本月待付
    private Double nextMonthPay;//次月应付

    public Integer getHouseTotal() {
        return houseTotal;
    }

    public void setHouseTotal(Integer houseTotal) {
        this.houseTotal = houseTotal;
    }

    public Double getDfPayMoney() {
        return dfPayMoney;
    }

    public void setDfPayMoney(Double dfPayMoney) {
        this.dfPayMoney = dfPayMoney;
    }

    public Double getMonthPayMoney() {
        return monthPayMoney;
    }

    public void setMonthPayMoney(Double monthPayMoney) {
        this.monthPayMoney = monthPayMoney;
    }

    public Double getHouseMonthPayMoney() {
        return houseMonthPayMoney;
    }

    public void setHouseMonthPayMoney(Double houseMonthPayMoney) {
        this.houseMonthPayMoney = houseMonthPayMoney;
    }

    public Double getHouseDayPayMoney() {
        return houseDayPayMoney;
    }

    public void setHouseDayPayMoney(Double houseDayPayMoney) {
        this.houseDayPayMoney = houseDayPayMoney;
    }

    public Double getChaoqiPayMoney() {
        return chaoqiPayMoney;
    }

    public void setChaoqiPayMoney(Double chaoqiPayMoney) {
        this.chaoqiPayMoney = chaoqiPayMoney;
    }

    public Double getFiveDayPayMoney() {
        return fiveDayPayMoney;
    }

    public void setFiveDayPayMoney(Double fiveDayPayMoney) {
        this.fiveDayPayMoney = fiveDayPayMoney;
    }

    public Double getThisMonthPayMoney() {
        return thisMonthPayMoney;
    }

    public void setThisMonthPayMoney(Double thisMonthPayMoney) {
        this.thisMonthPayMoney = thisMonthPayMoney;
    }

    public Double getThisMonthPayAll() {
        return thisMonthPayAll;
    }

    public void setThisMonthPayAll(Double thisMonthPayAll) {
        this.thisMonthPayAll = thisMonthPayAll;
    }

    public Double getThisMonthNotPay() {
        return thisMonthNotPay;
    }

    public void setThisMonthNotPay(Double thisMonthNotPay) {
        this.thisMonthNotPay = thisMonthNotPay;
    }

    public Double getNextMonthPay() {
        return nextMonthPay;
    }

    public void setNextMonthPay(Double nextMonthPay) {
        this.nextMonthPay = nextMonthPay;
    }
}
