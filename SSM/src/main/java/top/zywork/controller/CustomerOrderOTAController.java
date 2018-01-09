package top.zywork.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.zywork.common.*;
import top.zywork.enums.MIMETypeEnum;
import top.zywork.query.PageQuery;
import top.zywork.service.CustomerOrderOTAService;
import top.zywork.service.ExcelImportService;
import top.zywork.vo.CustomerOrderOTAVO;
import top.zywork.vo.UserVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

/**
 * OTA订单控制器 <br/>
 *
 * @author 王振宇
 * @version 1.0
 */
@Controller
@RequestMapping("customerOrderOta")
public class CustomerOrderOTAController {

    @Autowired
    private CustomerOrderOTAService customerOrderOTAService;
    @Autowired
    private ExcelImportService excelImportService;

    @PostMapping("/saveCustomerOrderOta")
    @ResponseBody
    public Message saveCustomerOrderOta(HttpServletRequest request, HttpSession session ,MultipartFile otaImportFile) throws  Exception {
        // UserVo userVo = (UserVo) session.getAttribute("userVo");
        String newFileName = FileUtils.getFileNameWithoutExt(otaImportFile.getOriginalFilename(), MIMETypeEnum.XLSX.getExt())
                + System.currentTimeMillis() + MIMETypeEnum.XLSX.getExt();
        String filePath = FileUtils.uploadPath(request, "/WEB-INF/ota-files") + "/" + newFileName;
        otaImportFile.transferTo(new File(filePath));
        ExcelUtils excelUtils = new ExcelUtils();
        List<Object> orders = excelImportService.imports(excelUtils.readExcel(filePath),
                ExcelExportUtils.buildImportDTO(new FileInputStream(FileUtils.getClasspath() + "/report/ota-order-import.json")));
        for (Object obj : orders) {
            CustomerOrderOTAVO order = (CustomerOrderOTAVO) obj;
            order.setCompanyId(1L);
        }
        customerOrderOTAService.batchSave(orders);
        return Message.success("OTA订单数据导入成功！");
    }

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
