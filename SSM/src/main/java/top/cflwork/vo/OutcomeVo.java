package top.cflwork.vo;

import java.io.Serializable;
import java.util.Date;



/**
 * 酒店的支出表，记录哪个公司旗下的哪个酒店，的支出明细
 *
 * @author chglee
 * @email xljx_888888@163.com
 * @date 2018-09-11 16:00:27
 */
public class OutcomeVo implements Serializable {
    private static final long serialVersionUID = 1L;
    //排序字段
    private String sort;
    //排序规则
    private String order;

            //支出编号
        private Long id;
            //公司编号
        private Long companyId;
            //酒店编号
        private Long hotelId;
            //支出科目编号
        private Long subjectId;
            //支出名称
        private String outcommeName;
            //支出备注
        private String remark;
            //开始支出时间
        private Date startTime;
            //结束支出时间
        private Date endTime;
            //支出总金额
        private Double money;
            //日支出金额
        private Double dayMoney;
            //支出结算状态
        private Byte outcomeStatus;
            //状态
        private Byte isActive;
            //创建时间
        private Date createTime;
    
    public void setOrder(String order) {
        this.order = order;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

            /**
         * 设置：支出编号
         */
        public void setId(Long id) {
            this.id = id;
        }

        /**
         * 获取：支出编号
         */
        public Long getId() {
            return id;
        }
            /**
         * 设置：公司编号
         */
        public void setCompanyId(Long companyId) {
            this.companyId = companyId;
        }

        /**
         * 获取：公司编号
         */
        public Long getCompanyId() {
            return companyId;
        }
            /**
         * 设置：酒店编号
         */
        public void setHotelId(Long hotelId) {
            this.hotelId = hotelId;
        }

        /**
         * 获取：酒店编号
         */
        public Long getHotelId() {
            return hotelId;
        }
            /**
         * 设置：支出科目编号
         */
        public void setSubjectId(Long subjectId) {
            this.subjectId = subjectId;
        }

        /**
         * 获取：支出科目编号
         */
        public Long getSubjectId() {
            return subjectId;
        }
            /**
         * 设置：支出名称
         */
        public void setOutcommeName(String outcommeName) {
            this.outcommeName = outcommeName;
        }

        /**
         * 获取：支出名称
         */
        public String getOutcommeName() {
            return outcommeName;
        }
            /**
         * 设置：支出备注
         */
        public void setRemark(String remark) {
            this.remark = remark;
        }

        /**
         * 获取：支出备注
         */
        public String getRemark() {
            return remark;
        }
            /**
         * 设置：开始支出时间
         */
        public void setStartTime(Date startTime) {
            this.startTime = startTime;
        }

        /**
         * 获取：开始支出时间
         */
        public Date getStartTime() {
            return startTime;
        }
            /**
         * 设置：结束支出时间
         */
        public void setEndTime(Date endTime) {
            this.endTime = endTime;
        }

        /**
         * 获取：结束支出时间
         */
        public Date getEndTime() {
            return endTime;
        }
            /**
         * 设置：支出总金额
         */
        public void setMoney(Double money) {
            this.money = money;
        }

        /**
         * 获取：支出总金额
         */
        public Double getMoney() {
            return money;
        }
            /**
         * 设置：日支出金额
         */
        public void setDayMoney(Double dayMoney) {
            this.dayMoney = dayMoney;
        }

        /**
         * 获取：日支出金额
         */
        public Double getDayMoney() {
            return dayMoney;
        }
            /**
         * 设置：支出结算状态
         */
        public void setOutcomeStatus(Byte outcomeStatus) {
            this.outcomeStatus = outcomeStatus;
        }

        /**
         * 获取：支出结算状态
         */
        public Byte getOutcomeStatus() {
            return outcomeStatus;
        }
            /**
         * 设置：状态
         */
        public void setIsActive(Byte isActive) {
            this.isActive = isActive;
        }

        /**
         * 获取：状态
         */
        public Byte getIsActive() {
            return isActive;
        }
            /**
         * 设置：创建时间
         */
        public void setCreateTime(Date createTime) {
            this.createTime = createTime;
        }

        /**
         * 获取：创建时间
         */
        public Date getCreateTime() {
            return createTime;
        }
    }
