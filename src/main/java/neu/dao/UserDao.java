package neu.dao;

import neu.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by 黄宇航 on 2017/9/20.
 * 对User表的数据操作
 */
@Repository
public interface UserDao {
    User queryById(long id);

    User queryByUsername(String username);

    User queryByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    int add(User user);

    boolean deleteById(long id);

    boolean update(User user);
}
