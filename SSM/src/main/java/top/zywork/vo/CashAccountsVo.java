package top.zywork.vo;

import java.math.BigDecimal;
import java.util.Date;

public class CashAccountsVo {
    private Long id;

    private Long shopManagerId;

    private Byte accountType;

    private Date accountTime;

    private BigDecimal totalPay;

    private Long subjectId;

    private String description;

    private String remark;

    private Date createTime;

    private Byte isActive;

    public CashAccountsVo(Long id, Long shopManagerId, Byte accountType, Date accountTime, BigDecimal totalPay, Long subjectId, String description, String remark, Date createTime, Byte isActive) {
        this.id = id;
        this.shopManagerId = shopManagerId;
        this.accountType = accountType;
        this.accountTime = accountTime;
        this.totalPay = totalPay;
        this.subjectId = subjectId;
        this.description = description;
        this.remark = remark;
        this.createTime = createTime;
        this.isActive = isActive;
    }

    public CashAccountsVo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getShopManagerId() {
        return shopManagerId;
    }

    public void setShopManagerId(Long shopManagerId) {
        this.shopManagerId = shopManagerId;
    }

    public Byte getAccountType() {
        return accountType;
    }

    public void setAccountType(Byte accountType) {
        this.accountType = accountType;
    }

    public Date getAccountTime() {
        return accountTime;
    }

    public void setAccountTime(Date accountTime) {
        this.accountTime = accountTime;
    }

    public BigDecimal getTotalPay() {
        return totalPay;
    }

    public void setTotalPay(BigDecimal totalPay) {
        this.totalPay = totalPay;
    }

    public Long getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Long subjectId) {
        this.subjectId = subjectId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
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