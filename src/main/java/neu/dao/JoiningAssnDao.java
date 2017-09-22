package neu.dao;

import neu.entity.JoiningAssn;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 黄宇航 on 2017/9/20.
 * 对申请加入社团的数据操作
 */
@Repository
public interface JoiningAssnDao {
    JoiningAssn queryById(long id);

    List<JoiningAssn> queryByUserid(long userid);

    List<JoiningAssn> queryByAssnid(long assnid);

    List<JoiningAssn> queryByTime(Timestamp createtime);

    int add(JoiningAssn examine);

    boolean deleteById(long id);

    boolean update(JoiningAssn examine);
}
