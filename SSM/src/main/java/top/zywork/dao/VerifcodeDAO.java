package top.zywork.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import top.zywork.query.StatusQuery;
import top.zywork.vo.Verifcode;

/**
 * Created by aQiu.
 */
@Repository
public interface VerifcodeDAO extends  BaseDAO<Verifcode> {
    String queryByCode(String mobile);
    void updateCodeStatus(StatusQuery statusQuery);
}
