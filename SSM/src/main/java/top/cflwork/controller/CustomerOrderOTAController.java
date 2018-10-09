package top.cflwork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.cflwork.common.*;
import top.cflwork.enums.MIMETypeEnum;
import top.cflwork.query.PageQuery;
import top.cflwork.service.CustomerOrderOTAService;
import top.cflwork.vo.CustomerOrderOTAVO;
import top.cflwork.vo.UserVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

/**
 * OTA订单控制器 <br/>
 *
 * @author 陈飞龙
 * @version 1.0
 */
@Controller
@RequestMapping("customerOrderOta")
public class CustomerOrderOTAController {

    @Autowired
    private CustomerOrderOTAService customerOrderOTAService;
    @RequestMapping("customerOrderOtaList")
    @ResponseBody
    public PagingBean customerOrderOtaList(int pageSize, int pageIndex, String searchVal, HttpSession session) {
        UserVo userVo = (UserVo) session.getAttribute("userVo");
        PagingBean pagingBean = new PagingBean();
        pagingBean.setPageSize(pageSize);
        pagingBean.setCurrentPage(pageIndex);
        PageQuery pageQuery = new PageQuery();
        pageQuery.setCompanyId(userVo.getCompanyId());
        pageQuery.setSearchVal(searchVal);
        pageQuery.setPageSize(pagingBean.getPageSize());
        pageQuery.setPageNo(pagingBean.getStartIndex());
        pagingBean.setTotal(customerOrderOTAService.count(pageQuery));
        pagingBean.setrows(customerOrderOTAService.listPage(pageQuery));
        return pagingBean;
    }

}
