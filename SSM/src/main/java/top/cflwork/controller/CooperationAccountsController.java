package top.cflwork.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.cflwork.common.Message;
import top.cflwork.common.PagingBean;
import top.cflwork.enums.ActiveStatusEnum;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.service.CooperationAccountsService;
import top.cflwork.service.EmployeeService;
import top.cflwork.service.HotelService;
import top.cflwork.service.UserRoleService;
import top.cflwork.vo.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/10/21.
 */
@Controller
@RequestMapping("cooperationAccounts")
public class CooperationAccountsController {

    @Resource
    private CooperationAccountsService cooperationAccountsService;
    @Resource
    private HotelService hotelService;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private UserRoleService userRoleService;
    @RequestMapping("cooperationAccountsList")
    @ResponseBody
    public PagingBean cooperationAccountsList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
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
        pagingBean.setTotal(cooperationAccountsService.count(pageQuery));
        pagingBean.setrows(cooperationAccountsService.listPage(pageQuery));
        return pagingBean;
    }
    @RequestMapping("/cooperationAccountsAddSave")
    @ResponseBody
    public Message addSavecooperationAccounts(CooperationAccountsVo cooperationAccounts,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
            //如果是店长新增现金流水账目
            if(userRoleVo.getRoleVo().getTitle().equals("店长")){
                HotelVo hotelVo = hotelService.findHotel(userVo.getId());
                cooperationAccounts.setHotelId(hotelVo.getId());
                cooperationAccounts.setShopManagerId(userVo.getId());
            }else if(userRoleVo.getRoleVo().getTitle().equals("录入员")){
                EmployeeVo employeeVo = employeeService.getHotelId(userVo.getId());
                cooperationAccounts.setHotelId(employeeVo.getHotelId());
                cooperationAccounts.setShopManagerId(employeeVo.getUserId());
            }
            cooperationAccounts.setRemark("暂无批注");
            cooperationAccounts.setIsCash((byte) 0);
            cooperationAccounts.setCashStatus((byte)0);
            cooperationAccounts.setReason("未审核");
            cooperationAccounts.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
            cooperationAccounts.setCompanyId(userVo.getCompanyId());
            cooperationAccountsService.save(cooperationAccounts);
            return  Message.success("新增成功!");
        }catch (Exception E){
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/getSubject")
    @ResponseBody
    public List<Select2Vo> getSubject(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        List<Select2Vo> subjectList = cooperationAccountsService.getSubject(userVo.getCompanyId());
        return  subjectList;
    }
    @RequestMapping("/getCooperationCompany")
    @ResponseBody
    public List<Select2Vo> getCooperationCompany(HttpSession session) throws  Exception {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
        EmployeeVo employeeVo = employeeService.getHotelId(userVo.getId());
        PageQuery pageQuery = new PageQuery();
        if(userRoleVo.getRoleVo().getTitle().equals("店长")){
            HotelVo hotelVo = hotelService.findHotel(userVo.getId());
            pageQuery.setHotelId(hotelVo.getId());
        }else if(userRoleVo.getRoleVo().getTitle().equals("录入员")){
            pageQuery.setHotelId(employeeVo.getHotelId());
        }
        pageQuery.setCompanyId(userVo.getCompanyId());
        List<Select2Vo> subjectList = cooperationAccountsService.getCooperationCompany(pageQuery);
        return  subjectList;
    }
    @RequestMapping("/findCooperationAccounts/{id}")
    @ResponseBody
    public CooperationAccountsVo findcooperationAccounts(@PathVariable("id") long id){
        CooperationAccountsVo cooperationAccounts = cooperationAccountsService.getById(id);
        return cooperationAccounts;
    }
    @RequestMapping("/cooperationAccountsShenHe")
    @ResponseBody
    public Message cooperationAccountsShenHe(CooperationAccountsVo cooperationAccounts,HttpSession session) throws  Exception{
        try{
            UserVo user = (UserVo) session.getAttribute("userVo");
            UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
            if(userRoleVo.equals("录入员")){
                return Message.fail("审核失败，你无权限!");
            }else{
                if(cooperationAccounts.getCashStatus()==1){
                    cooperationAccounts.setIsCash((byte)1);
                }else{
                    cooperationAccounts.setIsCash((byte)0);
                }
                cooperationAccounts.setHander(user.getId());
                cooperationAccountsService.updateCashStatus(cooperationAccounts);
                return  Message.success("审核成功!");
            }

        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("审核失败!");
        }
    }
    @RequestMapping("/checkerCooperationAccounts")
    @ResponseBody
    public Message checkerCooperationAccounts(CooperationAccountsVo cooperationAccounts,HttpSession session,String manyId) throws  Exception{
        try{
            List<CooperationAccountsVo> cooperationAccountsVoList = new ArrayList<>();
            UserVo user = (UserVo) session.getAttribute("userVo");
            UserRoleVo userRoleVo = (UserRoleVo) session.getAttribute("userRole");
            String accounts[] =  manyId.split(",");
            if(userRoleVo.equals("录入员")){
                return Message.fail("审核失败，你无权限!");
            }else{
                for (String str:accounts) {
                    CooperationAccountsVo cooperationAccountsVo = new CooperationAccountsVo();
                    cooperationAccountsVo.setReason(cooperationAccounts.getReason());
                    cooperationAccountsVo.setCashStatus(cooperationAccounts.getCashStatus());
                    cooperationAccountsVo.setReason(cooperationAccounts.getReason());
                    if(cooperationAccounts.getCashStatus()==1){
                        cooperationAccountsVo.setIsCash((byte)1);
                    }else{
                        cooperationAccountsVo.setIsCash((byte)0);
                    }
                    cooperationAccountsVo.setHander(user.getId());
                    if(!str.equals("")){
                        cooperationAccountsVo.setId(Long.parseLong(str));
                    }
                    cooperationAccountsVoList.add(cooperationAccountsVo);
                }
                cooperationAccountsService.checkerManyCashAccount(cooperationAccountsVoList);
                return  Message.success("批量审核成功!");
            }

        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("批量审核失败!");
        }
    }
    @RequestMapping("/cooperationAccountsUpdateSave")
    @ResponseBody
    public Message updatecooperationAccounts(CooperationAccountsVo cooperationAccounts) throws  Exception{
        try{
            cooperationAccountsService.update(cooperationAccounts);
            return  Message.success("修改成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/cooperationAccountsUpdateRemark")
    @ResponseBody
    public Message cooperationAccountsUpdateRemark(CooperationAccountsVo cooperationAccounts) throws  Exception{
        try{
            cooperationAccountsService.updateRemark(cooperationAccounts);
            return  Message.success("批注成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("批注失败!");
        }
    }
    @RequestMapping("/deleteManyCooperationAccounts")
    @ResponseBody
    public Message deleteManycooperationAccounts(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                cooperationAccountsService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteCooperationAccounts/{id}")
    @ResponseBody
    public Message deletecooperationAccounts(@PathVariable("id") long id) throws  Exception{
        try{
            cooperationAccountsService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/cooperationAccountsPage")
    public String table() throws  Exception{
        return "moneyItems/cooperationAccountsList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            cooperationAccountsService.updateStatus(new StatusQuery(id,status));
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
