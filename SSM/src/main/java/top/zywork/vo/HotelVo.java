package top.zywork.vo;

import java.util.Date;

public class HotelVo {
    private Long id;

    private Long companyId;

    private Long contractId;

    private Long hotelManagerId;

    private String title;

    private String tel;

    private Date createTime;

    private Byte isActive;

    private ContractVo contractVo;

    private CompanyVo companyVo;

    private UserVo userVo;

    public HotelVo(Long id, Long companyId, Long contractId, Long hotelManagerId, String title, String tel, Date createTime, Byte isActive) {
        this.id = id;
        this.companyId = companyId;
        this.contractId = contractId;
        this.hotelManagerId = hotelManagerId;
        this.title = title;
        this.tel = tel;
        this.createTime = createTime;
        this.isActive = isActive;
    }

    public HotelVo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getHotelManagerId() {
        return hotelManagerId;
    }

    public void setHotelManagerId(Long hotelManagerId) {
        this.hotelManagerId = hotelManagerId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
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

    public ContractVo getContractVo() {
        return contractVo;
    }

    public void setContractVo(ContractVo contractVo) {
        this.contractVo = contractVo;
    }

    public CompanyVo getCompanyVo() {
        return companyVo;
    }

    public void setCompanyVo(CompanyVo companyVo) {
        this.companyVo = companyVo;
    }

    public UserVo getUserVo() {
        return userVo;
    }

    public void setUserVo(UserVo userVo) {
        this.userVo = userVo;
    }
}