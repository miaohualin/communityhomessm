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
    JoiningAssn queryByid(int id);

    List<JoiningAssn> queryByUserid(int userid);

    List<JoiningAssn> queryByAssnid(int assnid);

    List<JoiningAssn> queryByTime(Timestamp createtime);

    int add(JoiningAssn examine);

    boolean deleteById(int id);

    boolean update(JoiningAssn examine);
}
