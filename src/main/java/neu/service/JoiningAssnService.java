package neu.service;

import neu.dao.JoiningAssnDao;
import neu.entity.JoiningAssn;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 黄宇航 on 2017/9/20.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class JoiningAssnService {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private JoiningAssnDao joiningassndao;

    public JoiningAssn queryById(long id) {
        log.info("通过id:" + id + "查询加入社团类");
        return joiningassndao.queryById(id);
    }

    public List<JoiningAssn> queryByUserid(long userid) {
        log.info("通过用户id:" + userid + "查询加入社团类");
        return joiningassndao.queryByUserid(userid);
    }

    public List<JoiningAssn> queryByAssnid(long assnid) {
        log.info("通过社团id:" + assnid + "查询加入社团类");
        return joiningassndao.queryByAssnid(assnid);
    }

    public List<JoiningAssn> queryByTime(Timestamp createtime) {
        log.info("通过创建时间:" + createtime + "查询加入社团类");
        return joiningassndao.queryByTime(createtime);
    }

    public int add(JoiningAssn joiningassn) {
        log.info("添加加入社团审核类");

        if (queryById(joiningassn.getId()) != null) {
            return -2;
        }

        return joiningassndao.add(joiningassn);
    }

    public boolean deleteById(long id) {
        log.info("通过id:" + id + "删除加入社团类");
        return joiningassndao.deleteById(id);
    }

    public boolean update(JoiningAssn joiningassn) {
        log.info("修改id为:" + joiningassn.getId() + "的加入社团类");
        return joiningassndao.update(joiningassn);
    }
}
