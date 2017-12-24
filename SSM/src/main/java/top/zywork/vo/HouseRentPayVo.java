package top.zywork.vo;

import java.math.BigDecimal;
import java.util.Date;

public class HouseRentPayVo {
    private Long id;

    private Long masterId;

    private Long hotelId;

    private Long companyId;

    private Long contractId;

    private BigDecimal totalPay;

    private Integer payTime;

    private Integer payType;

    private Date payPeriodStart;

    private Date payPeriodEnd;

    private String description;

    private Integer isCash;

    private Date createTime;

    private Byte isActive;

    private Double firstPay;

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    private String houseName;

    private ContractMasterVo contractMasterVo;

    private HotelVo hotelVo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMasterId() {
        return masterId;
    }

    public void setMasterId(Long masterId) {
        this.masterId = masterId;
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

    public Long getContractId() {
        return contractId;
    }

    public void setContractId(Long contractId) {
        this.contractId = contractId;
    }

    public BigDecimal getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(BigDecimal totalPay) {
        this.totalPay = totalPay;
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

    public double getFirstPay() {
        return firstPay;
    }

    public void setFirstPay(double firstPay) {
        this.firstPay = firstPay;
    }

    public ContractMasterVo getContractMasterVo() {
        return contractMasterVo;
    }

    public void setContractMasterVo(ContractMasterVo contractMasterVo) {
        this.contractMasterVo = contractMasterVo;
    }

    public HotelVo getHotelVo() {
        return hotelVo;
    }

    public void setHotelVo(HotelVo hotelVo) {
        this.hotelVo = hotelVo;
    }
}