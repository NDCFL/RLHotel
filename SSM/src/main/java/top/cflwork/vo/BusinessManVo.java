package top.cflwork.vo;

import java.io.Serializable;
import java.util.Date;

public class BusinessManVo implements Serializable {
    private Long id;
    private String name="未填写";//'姓名',
    private String phone="未填写";//'联系方式',
    private String tel="未填写";//'酒店联系方式',
    private String nickname="未填写";//'微信名称',
    private String hotelSinName="未填写";//'酒店简称',
    private String hotelName="未填写";//'酒店全称',
    private String wxopenid;//'微信的openid',
    private String remark="未填写";//'酒店的签名',
    private Integer type;
    private Byte isActive;//'酒店状态',
    private Date endTime;
    private Date createTime;//'酒店创建时间'
    private String password;//密码
    private String faceImg;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getHotelSinName() {
        return hotelSinName;
    }

    public void setHotelSinName(String hotelSinName) {
        this.hotelSinName = hotelSinName;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getWxopenid() {
        return wxopenid;
    }

    public void setWxopenid(String wxopenid) {
        this.wxopenid = wxopenid;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Byte getIsActive() {
        return isActive;
    }

    public void setIsActive(Byte isActive) {
        this.isActive = isActive;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFaceImg() {
        return faceImg;
    }

    public void setFaceImg(String faceImg) {
        this.faceImg = faceImg;
    }
}
