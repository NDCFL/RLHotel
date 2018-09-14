package top.cflwork.vo;
import lombok.Data;
import java.util.Date;
/**
*
*酒店的收入表，记录哪个公司旗下的哪个酒店，的收入明细

*
*/
@Data
public class IncomeVo{

    private Long id;
    private Long companyId;
    private Long hotelId;
    private Long subjectId;
    private String incommeName;
    private String remark;
    private Date startTime;
    private Date endTime;
    private Double money;
    private Double dayMoney;
    private Integer incomeStatus;
    private Byte isActive;
    private Date createTime;
}
