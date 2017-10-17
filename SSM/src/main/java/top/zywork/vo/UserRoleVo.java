package top.zywork.vo;

import java.util.Date;

public class UserRoleVo {
    private Long id;

    private Long userId;

    private Long roleId;

    private Date createTime;

    private Byte isActive;

    public UserRoleVo(Long id, Long userId, Long roleId, Date createTime, Byte isActive) {
        this.id = id;
        this.userId = userId;
        this.roleId = roleId;
        this.createTime = createTime;
        this.isActive = isActive;
    }

    public UserRoleVo() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
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