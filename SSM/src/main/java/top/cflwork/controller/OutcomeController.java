package top.cflwork.controller;


import com.xiaoleilu.hutool.date.DateUnit;
import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import top.cflwork.vo.CooperationAccountsVo;
import top.cflwork.vo.OutcomeVo;
import top.cflwork.service.OutcomeService;
import top.cflwork.common.Message;
import top.cflwork.common.PagingBean;
import top.cflwork.enums.ActiveStatusEnum;
import top.cflwork.query.PageQuery;
import top.cflwork.query.StatusQuery;
import top.cflwork.vo.UserVo;
import javax.servlet.http.HttpSession;
import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import java.util.Date;
import org.springframework.web.bind.annotation.InitBinder;
/**
 * 酒店的支出表，记录哪个公司旗下的哪个酒店，的支出明细
 * 
 * @author chglee
 * @email xljx_888888@163.com
 * @date 2018-09-11 16:00:27
 */
 
@Controller
@RequestMapping("/outcome")
public class OutcomeController {
	@Resource
	private OutcomeService outcomeService;

    /**
    *
	* @param pageSize 分页大小
	* @param pageIndex 当前页
	* @param searchVal 搜索条件
	* @param session 当前的登录用户对象
	* @return  返回分页结果
	* @throws Exception
	*/
    @RequestMapping("outcomeList")
    @ResponseBody
    public PagingBean outcomeList(int pageSize, int pageIndex, String searchVal, HttpSession session) throws  Exception{
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setTotal(outcomeService.count(new PageQuery(searchVal,userVo.getCompanyId())));
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        pagingBean.setrows(outcomeService.listPage(new PageQuery(pagingBean.getStartIndex(),pagingBean.getPageSize(),searchVal,userVo.getCompanyId())));
        return pagingBean;
    }

    @RequestMapping("findOutcomeList")
    @ResponseBody
    public PagingBean findOutcomeList(int pageSize, int pageIndex,HttpSession session,OutcomeVo outcomeVo) throws  Exception{
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
            //分页参数
            PagingBean pagingBean = new PagingBean();
            pagingBean.setPageSize(pageSize);
            pagingBean.setCurrentPage(pageIndex);
            //赋值给pagequery对象
            PageQuery pageQuery = new PageQuery();
            pageQuery.setCompanyId(userVo.getCompanyId());
            pageQuery.setPageSize(pagingBean.getPageSize());
            pageQuery.setPageNo(pagingBean.getStartIndex());
            pagingBean.setTotal(outcomeService.counts(pageQuery,outcomeVo));
            pagingBean.setrows(outcomeService.listPages(pageQuery,outcomeVo));
            return pagingBean;
        }catch (Exception e){
            e.printStackTrace();
            return  null;
        }
    }

    /**
    *
	* param  接收前段的组件
	* @param session 当前用户的对象
	* @return  返回操作结果
	* @throws Exception
	*/
    @RequestMapping("/outcomeAddSave")
    @ResponseBody
    @Validated
    public Message outcomeAddSave(OutcomeVo outcomeVo,HttpSession session) throws  Exception {
        try{
            UserVo userVo = (UserVo) session.getAttribute("userVo");
			outcomeVo.setIsActive(ActiveStatusEnum.ACTIVE.getValue().byteValue());
			outcomeVo.setCompanyId(userVo.getCompanyId());
			outcomeVo.setStartTime(DateUtil.parse(outcomeVo.getTemp().split(" - ")[0],"yyyy-MM-dd"));
            outcomeVo.setEndTime(DateUtil.parse(outcomeVo.getTemp().split(" - ")[1],"yyyy-MM-dd"));
            long betweenDay = DateUtil.between(outcomeVo.getStartTime(), outcomeVo.getEndTime(), DateUnit.DAY);
            outcomeVo.setDayMoney(outcomeVo.getMoney()/betweenDay);
			outcomeService.save(outcomeVo);
            return  Message.success("新增成功!");
        }catch (Exception E){
            E.printStackTrace();
            return Message.fail("新增失败!");
        }

    }

    /**
    * 按编号去查找用户
	* @param id 编号
	* @return  返回查询结果
	*/
    @RequestMapping("/findOutcome/{id}")
    @ResponseBody
    public OutcomeVo findOutcome(@PathVariable("id") long id){
		OutcomeVo outcomeVo = outcomeService.getById(id);
        return outcomeVo;
    }

    /**
    * 修改操作
	* param  接受对象
	* @return  返回更新结果集
	* @throws Exception
	*/
    @RequestMapping("/outcomeUpdateSave")
    @ResponseBody
    public Message outcomeUpdateSave(OutcomeVo outcomeVo) throws  Exception{
        try{
            outcomeVo.setStartTime(DateUtil.parse(outcomeVo.getTemp().split(" - ")[0],"yyyy-MM-dd"));
            outcomeVo.setEndTime(DateUtil.parse(outcomeVo.getTemp().split(" - ")[1],"yyyy-MM-dd"));
            long betweenDay = DateUtil.between(outcomeVo.getStartTime(), outcomeVo.getEndTime(), DateUnit.DAY);
            outcomeVo.setDayMoney(outcomeVo.getMoney()/betweenDay);
			outcomeService.update(outcomeVo);
            return  Message.success("修改成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("修改失败!");
        }
    }

    /**
    * 批量删除
	* @param manyId 多选的编号
	* @param status 状态
	* @return  返回删除的结果集
	* @throws Exception
	*/
    @RequestMapping("/deleteManyOutcome")
    @ResponseBody
    public Message deleteManyOutcome(@Param("manyId") String manyId,Integer status) throws  Exception{
        try{
            String str[] = manyId.split(",");
            for (String s: str) {
				outcomeService.updateStatus(new StatusQuery(Long.parseLong(s),status));
            }
            return Message.success("批量修改状态成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.fail("批量修改状态失败!");
        }
    }

    /**
    * 根据编号删除数据
	* @param id 编号
	* @return 返回删除的结果集
	* @throws Exception
	*/
    @RequestMapping("/deleteOutcome/{id}")
    @ResponseBody
    public Message deleteOutcome(@PathVariable("id") long id) throws  Exception{
        try{
			outcomeService.removeById(id);
            return Message.success("删除成功!");
        }catch (Exception e){
            e.printStackTrace();
            return Message.fail("删除失败!");
        }
    }

    /**
    * 跳转到列表页面
	* @return 文件地址
	* @throws Exception
	*/
    @RequestMapping("/outcomePage")
    public String table() throws  Exception{
        return "outcome/outcomeList";
    }

    /**
    * 修改状态
	* @param id 编号
	* @param status 状态
	* @return 返回结果
	* @throws Exception
	*/
    @RequestMapping("updateStatus/{id}/{status}")
    @ResponseBody
    public Message updateStatus(@PathVariable("id") long id,@PathVariable("status") int status) throws  Exception{
        try{
			outcomeService.updateStatus(new StatusQuery(id,status));
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
