package top.zywork.service;


import top.zywork.query.StatusQuery;
import top.zywork.vo.Verifcode;

public interface VerifcodeService extends BaseService<Verifcode>{
    String queryByCode(String mobile);
    void updateCodeStatus(StatusQuery statusQuery);
}
