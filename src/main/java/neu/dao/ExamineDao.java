package neu.dao;

import neu.entity.Examine;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 黄宇航 on 2017/9/20.
 * 对创建社团审核的数据操作
 */
@Repository
public interface ExamineDao {
    Examine queryByid(long id);

    List<Examine> queryByUserid(long userid);

    List<Examine> queryAll();

    int add(Examine examine);

    boolean deleteById(long id);

    boolean update(Examine examine);
}
