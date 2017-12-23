package top.zywork.service;

import top.zywork.query.PageQuery;
import top.zywork.query.StatusQuery;
import top.zywork.vo.HouseOthersItemVo;
import top.zywork.vo.Select2Vo;

import java.util.List;

/**
 * Created by chenfeilong on 2017/12/12.
 */
public interface HouseOthersItemService extends BaseService<HouseOthersItemVo> {
    List<Select2Vo> subjectList(Long companyId);
    List<HouseOthersItemVo> listPages(PageQuery pageQuery);
    Long counts(PageQuery pageQuery);
}
