package top.zywork.controller;

import com.sun.net.httpserver.HttpsServer;
import com.sun.tools.internal.xjc.reader.xmlschema.bindinfo.BIConversion;
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
import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.service.ContractMasterService;
import top.zywork.vo.ContractMasterVo;
import top.zywork.vo.Select2Vo;
import top.zywork.vo.UserVo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by chenfeilong on 2017/11/16.
 */
@Controller
@RequestMapping("contractMaster")
public class ContractMasterController {

    @Resource
    private ContractMasterService contractMasterService;
    @RequestMapping("contractMasterList")
    @ResponseBody
    public PagingBean contractMasterList(int pageSize, int pageIndex, HttpSession session,String searchVal) throws  Exception{
        UserVo user = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(contractMasterService.counts(user.getCompanyId(),new PageQuery(searchVal)));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(contractMasterService.listPages(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal),user.getCompanyId()));
        return pagingBean;
    }
    @RequestMapping("/contractMasterAddSave")
    @ResponseBody
    public Message addSaveContractMaster(ContractMasterVo contractMaster,HttpSession session) throws  Exception {
        try{
            UserVo user = (UserVo) session.getAttribute("userVo");
            contractMaster.setIsActive(0);
            contractMasterService.save(contractMaster);
            return  Message.success("新增成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("新增失败!");
        }

    }
    @RequestMapping("/findContractMaster/{id}")
    @ResponseBody
    public ContractMasterVo findcontractMaster(@PathVariable("id") long id){
        ContractMasterVo contractMaster = contractMasterService.getById(id);
        return contractMaster;
    }
    @RequestMapping("/contractMasterUpdateSave")
    @ResponseBody
    public Message updatecontractMaster(ContractMasterVo contractMaster) throws  Exception{
        try{
            contractMasterService.update(contractMaster);
            return  Message.success("修改成功!");
        }catch (Exception e){
            return Message.fail("修改失败!");
        }
    }
    @RequestMapping("/deleteManyContractMaster")
    @ResponseBody
    public Message deleteManycontractMaster(@Param("manyId") String manyId) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
                contractMasterService.removeById(Long.parseLong(s));
            }
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("删除失败!");
        }
    }
    @RequestMapping("/deleteContractMaster/{id}")
    @ResponseBody
    public Message deletecontractMaster(@PathVariable("id") long id) throws  Exception{
        try{
            contractMasterService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }
    @RequestMapping("/contractMasterListPage")
    public String table() throws  Exception{
        return "house/contractMasterList";
    }
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
            contractMasterService.updateStatus(new StatusQuery(id,status));
            return Message.success("ok");
        }catch (Exception e){
            return  Message.fail("fail");
        }
    }
    @RequestMapping("findAll")
    @ResponseBody
    public List<Select2Vo> findAll(HttpSession session){
        UserVo user = (UserVo) session.getAttribute("userVo");
        List<Select2Vo> contractMasterVoList = contractMasterService.listAlls(user.getCompanyId());
        return contractMasterVoList;
    }
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
