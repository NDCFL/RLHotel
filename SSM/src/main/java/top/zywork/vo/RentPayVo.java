package top.zywork.vo;

import java.math.BigDecimal;
import java.util.Date;

public class RentPayVo {
    private Long id;

    private Long landlordId;

    private BigDecimal totalPay;

    private Date payTime;

    private Date payPeriodStart;

    private Date payPeriodEnd;

    private String description;

    private Date createTime;

    private Byte isActive;

    public RentPayVo(Long id, Long landlordId, BigDecimal totalPay, Date payTime, Date payPeriodStart, Date payPeriodEnd, String description, Date createTime, Byte isActive) {
        this.id = id;
        this.landlordId = landlordId;
        this.totalPay = totalPay;
        this.payTime = payTime;
        this.payPeriodStart = payPeriodStart;
        this.payPeriodEnd = payPeriodEnd;
        this.description = description;
        this.createTime = createTime;
        this.isActive = isActive;
    }

    public RentPayVo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getLandlordId() {
        return landlordId;
    }

    public void setLandlordId(Long landlordId) {
        this.landlordId = landlordId;
    }

    public BigDecimal getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(BigDecimal totalPay) {
        this.totalPay = totalPay;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
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
        this.description = description == null ? null : description.trim();
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
}