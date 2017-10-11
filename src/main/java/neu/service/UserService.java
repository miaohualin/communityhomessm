package neu.service;

import neu.dao.UserDao;
import neu.entity.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by 黄宇航 on 2017/9/20.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private UserDao userdao;

    public User queryByUserid(long userid) {
        log.info("通过用户id:" + userid + "查询用户");
        return userdao.queryById(userid);
    }

    public User queryByEmail(String mailbox) {
        log.info("通过邮箱:" + mailbox + "查询用户");
        return userdao.queryByEmail(mailbox);
    }

    public User queryByUsername(String username) {
        log.info("通过用户名:" + username + "查询用户");
        return userdao.queryByUsername(username);
    }

    public User queryByUsernameAndPassword(String username, String password) {
        log.info("匹配用户" + username);
        return userdao.queryByUsernameAndPassword(username, password);
    }

    public int add(User user){
        log.info("增加用户");

        if (queryByUsername(user.getUsername()) != null){
            log.info("用户名为:" + user.getUsername() + "的账号已存在");
            return -2;
        }

        return userdao.add(user);
    }

    public boolean deleteByUserid(long userid){
        log.info("通过用户id:" + userid + "注销用户");
        return userdao.deleteById(userid);
    }

    public boolean update(User user){
        log.info("更新id为" + user.getId() + "的用户资料");
        return userdao.update(user);
    }
}
