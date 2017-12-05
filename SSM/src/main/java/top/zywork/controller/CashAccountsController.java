package top.zywork.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zywork.common.Message;
import top.zywork.common.PagingBean;
import top.zywork.enums.ActiveStatusEnum;
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.CashAccountsService;
import top.zywork.service.EmployeeService;
import top.zywork.service.HotelService;
import top.zywork.vo.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Controller
@RequestMapping("cashAccounts")
public class CashAccountsController {

    @Resource
    private CashAccountsService cashAccountsService;
    @Resource
    private HotelService hotelService;
    @Resource
    private EmployeeService employeeService;
    @RequestMapping("cashAccountsList")
    @ResponseBody
    public PagingBean cashAccountsList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        //获取该用户所属的酒店id
        HotelVo hotelVo = hotelService.findHotel(userVo.getId());
        //分页参数
        PagingBean pagingBean = new PagingBean();
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        //赋值给pagequery对象
        PageQuery pageQuery = new PageQuery();
        pageQuery.setHotelId(hotelVo.getId());
        pageQuery.setCompanyId(userVo.getCompanyId());
        pageQuery.setSearchVal(searchVal);
        pageQuery.setPageSize(pagingBean.getPageSize());
        pageQuery.setPageNo(pagingBean.getStartIndex());
        pagingBean.setTotal(cashAccountsService.count(pageQuery));
        pagingBean.setrows(cashAccountsService.listPage(pageQuery));
        return pagingBean;
    }
    @RequestMapping("/cashAccountsAddSave")
    @ResponseBody
    public Message addSavecashAccounts(CashAccountsVo cashAccounts,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
            //如果是店长新增现金流水账目
            if(userRoleVo.getRoleVo().getTitle().equals("店长")){
                HotelVo hotelVo = hotelService.findHotel(userVo.getId());
                cashAccounts.setHotelId(hotelVo.getId());
                cashAccounts.setShopManagerId(userVo.getId());
            }else if(userRoleVo.getRoleVo().getTitle().equals("录入员")){
                EmployeeVo employeeVo = employeeService.getHotelId(userVo.getId());
                cashAccounts.setHotelId(employeeVo.getHotelId());
                cashAccounts.setShopManagerId(employeeVo.getUserId());
            }
            cashAccounts.setRemark("暂无批注");
            cashAccounts.setIsCash((byte) 0);
            cashAccounts.setCashStatus((byte)0);
            cashAccounts.setReason("未审核");
            cashAccounts.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            cashAccounts.setCompanyId(userVo.getCompanyId());
            cashAccountsService.save(cashAccounts);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/getSubject")
    @ResponseBody
    public List<Select2Vo> getSubject(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        List<Select2Vo> subjectList = cashAccountsService.getSubject(userVo.getCompanyId());
        return  subjectList;
    }
    @RequestMapping("/findCashAccounts/{id}")
    @ResponseBody
    public CashAccountsVo findcashAccounts(@PathVariable("id") long id){
        CashAccountsVo cashAccounts = cashAccountsService.getById(id);
        return cashAccounts;
    }
    @RequestMapping("/cashAccountsShenHe")
    @ResponseBody
    public Message cashAccountsShenHe(CashAccountsVo cashAccounts,HttpSession session) throws  Exception{
        try{
            UserVo user = (UserVo) session.getAttribute("userVo");
            UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
            if(userRoleVo.equals("录入员")){
                return Message.fail("审核失败，你无权限!");
            }else{
                if(cashAccounts.getCashStatus()==1){
                    cashAccounts.setIsCash((byte)1);
                }else{
                    cashAccounts.setIsCash((byte)0);
                }
                cashAccounts.setHander(user.getId());
                cashAccountsService.updateCashStatus(cashAccounts);
                return  Message.success("审核成功!");
            }

        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("审核失败!");
        }
    }
    @RequestMapping("/cashAccountsUpdateSave")
    @ResponseBody
    public Message updatecashAccounts(CashAccountsVo cashAccounts) throws  Exception{
        try{
            cashAccountsService.update(cashAccounts);
            return  Message.success("修改成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/cashAccountsUpdateRemark")
    @ResponseBody
    public Message cashAccountsUpdateRemark(CashAccountsVo cashAccounts) throws  Exception{
        try{
            cashAccountsService.updateRemark(cashAccounts);
            return  Message.success("批注成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("批注失败!");
        }
    }
    @RequestMapping("/deleteManyCashAccounts")
    @ResponseBody
    public Message deleteManycashAccounts(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                cashAccountsService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteCashAccounts/{id}")
    @ResponseBody
    public Message deletecashAccounts(@PathVariable("id") long id) throws  Exception{
        try{
            cashAccountsService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/cashAccountsPage")
    public String table() throws  Exception{
        return "moneyItems/cashAccountsList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            cashAccountsService.updateStatus(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            return  Message.fail("fail");
        }
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
