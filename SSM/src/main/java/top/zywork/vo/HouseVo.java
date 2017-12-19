package top.zywork.vo;

import java.math.BigDecimal;
import java.util.Date;

public class HouseVo {
    private Long id;

    private String cardTitle;

    private Double area;

    private BigDecimal unitPrice;

    private BigDecimal salePrice;

    private Byte type;

    private Long hotelId;

    private Long shopManagerId;

    private Long shopAgentId;

    private Byte houseStatus;

    private Date createTime;

    private Byte isActive;

    private String description;

    private HouseTypeVo houseTypeVo;

    private HotelVo hotelVo;

    private UserVo userVo;

    private Date leaveTime;

    public HouseVo(Long id, String cardTitle, Double area, BigDecimal unitPrice, BigDecimal salePrice, Byte type, Long hotelId, Long shopManagerId, Long shopAgentId, Byte houseStatus, Date createTime, Byte isActive, String description) {
        this.id = id;
        this.cardTitle = cardTitle;
        this.area = area;
        this.unitPrice = unitPrice;
        this.salePrice = salePrice;
        this.type = type;
        this.hotelId = hotelId;
        this.shopManagerId = shopManagerId;
        this.shopAgentId = shopAgentId;
        this.houseStatus = houseStatus;
        this.createTime = createTime;
        this.isActive = isActive;
        this.description = description;
    }

    public HouseVo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCardTitle() {
        return cardTitle;
    }

    public void setCardTitle(String cardTitle) {
        this.cardTitle = cardTitle == null ? null : cardTitle.trim();
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public Long getShopManagerId() {
        return shopManagerId;
    }

    public void setShopManagerId(Long shopManagerId) {
        this.shopManagerId = shopManagerId;
    }

    public Long getShopAgentId() {
        return shopAgentId;
    }

    public void setShopAgentId(Long shopAgentId) {
        this.shopAgentId = shopAgentId;
    }

    public Byte getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(Byte houseStatus) {
        this.houseStatus = houseStatus;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public HouseTypeVo getHouseTypeVo() {
        return houseTypeVo;
    }

    public void setHouseTypeVo(HouseTypeVo houseTypeVo) {
        this.houseTypeVo = houseTypeVo;
    }

    public HotelVo getHotelVo() {
        return hotelVo;
    }

    public void setHotelVo(HotelVo hotelVo) {
        this.hotelVo = hotelVo;
    }

    public UserVo getUserVo() {
        return userVo;
    }

    public void setUserVo(UserVo userVo) {
        this.userVo = userVo;
    }

    public Date getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }
}