package top.zywork.service;

import top.zywork.vo.CompanyVo;

/**
 * Created by chenfeilong on 2017/11/15.
 */
public interface CompanyService extends BaseService<CompanyVo>{
    int checkName(String name,long id);
}
