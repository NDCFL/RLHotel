package top.cflwork.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class RentPayVo implements Serializable {

    private Long id;

    private Long hotelId;

    private Long masterId;

    private Long companyId;

    private BigDecimal baodiPay;

    private Integer payTime;//签约年限

    private Integer payType;//支付类别

    private Date payPeriodStart;//总支付开始时间

    private Date payPeriodEnd;//总支付结束时间

    private String description;//说明

    private Integer isCash;//是否支付

    private Date createTime;//创建时间

    private Byte isActive;//是否激活

    private Double firstPay;//每期支付金额

    private Date firstPayTime;//首次支付时间

    private double sumPay;//已经支付金额

    private Long houseId;//房间名称

    private HotelVo hotelVo;

    private Double area;//房间面积

    private Integer houseCount;//楼层

    private Integer shuidian;//水电

    private Integer kongtiao;//空调

    private Integer gongnuan;//供暖

    private Double wuye;//物业费用单位为平米

    private HouseVo houseVo;

    private ContractMasterVo contractMasterVo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public Long getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }

    public BigDecimal getBaodiPay() {
        return baodiPay;
    }

    public void setBaodiPay(BigDecimal baodiPay) {
        this.baodiPay = baodiPay;
    }

    public Integer getPayTime() {
        return payTime;
    }

    public void setPayTime(Integer payTime) {
        this.payTime = payTime;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Date getPayPeriodStart() {
        return payPeriodStart;
    }

    public void setPayPeriodStart(Date payPeriodStart) {
        this.payPeriodStart = payPeriodStart;
    }

    public Date getPayPeriodEnd() {
        return payPeriodEnd;
    }

    public void setPayPeriodEnd(Date payPeriodEnd) {
        this.payPeriodEnd = payPeriodEnd;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getIsCash() {
        return isCash;
    }

    public void setIsCash(Integer isCash) {
        this.isCash = isCash;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Byte getIsActive() {
        return isActive;
    }

    public void setIsActive(Byte isActive) {
        this.isActive = isActive;
    }

    public Double getFirstPay() {
        return firstPay;
    }

    public void setFirstPay(Double firstPay) {
        this.firstPay = firstPay;
    }

    public Date getFirstPayTime() {
        return firstPayTime;
    }

    public void setFirstPayTime(Date firstPayTime) {
        this.firstPayTime = firstPayTime;
    }

    public double getSumPay() {
        return sumPay;
    }

    public void setSumPay(double sumPay) {
        this.sumPay = sumPay;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public HotelVo getHotelVo() {
        return hotelVo;
    }

    public void setHotelVo(HotelVo hotelVo) {
        this.hotelVo = hotelVo;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getHouseCount() {
        return houseCount;
    }

    public void setHouseCount(Integer houseCount) {
        this.houseCount = houseCount;
    }

    public Integer getShuidian() {
        return shuidian;
    }

    public void setShuidian(Integer shuidian) {
        this.shuidian = shuidian;
    }

    public Integer getKongtiao() {
        return kongtiao;
    }

    public void setKongtiao(Integer kongtiao) {
        this.kongtiao = kongtiao;
    }

    public Integer getGongnuan() {
        return gongnuan;
    }

    public void setGongnuan(Integer gongnuan) {
        this.gongnuan = gongnuan;
    }

    public Double getWuye() {
        return wuye;
    }

    public void setWuye(Double wuye) {
        this.wuye = wuye;
    }

    public HouseVo getHouseVo() {
        return houseVo;
    }

    public void setHouseVo(HouseVo houseVo) {
        this.houseVo = houseVo;
    }

    public Long getMasterId() {
        return masterId;
    }

    public void setMasterId(Long masterId) {
        this.masterId = masterId;
    }

    public ContractMasterVo getContractMasterVo() {
        return contractMasterVo;
    }

    public void setContractMasterVo(ContractMasterVo contractMasterVo) {
        this.contractMasterVo = contractMasterVo;
    }
}
