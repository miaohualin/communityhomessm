package neu.service;

import neu.dao.ExamineDao;
import neu.entity.Examine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 黄宇航 on 2017/9/20.
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ExamineService {
    private Logger log = Logger.getLogger(this.getClass());
    @Autowired
    private ExamineDao examinedao;

    public Examine queryByid(long id) {
        log.info("通过id:" + id + "查询社团审核类");
        return examinedao.queryByid(id);
    }

    public List<Examine> queryByUserid(long userid) {
        log.info("通过用户id:" + userid + "查询社团审核类");

        List<Examine> temp = examinedao.queryByUserid(userid);

        return temp.size() == 0 ? null : temp;
    }

    public List<Examine> queryAll() {
        log.info("查询所有社团审核类");

        List<Examine> temp = examinedao.queryAll();

        return temp.size() == 0 ? null : temp;
    }

    public int add(Examine examine) {
        log.info("增加社团审核类");

        if (queryByid(examine.getId()) != null){
            return -2;
        }

        return examinedao.add(examine);
    }

    public boolean deleteById(long id) {
        log.info("通过id:" + id + "删除社团审核类");
        return examinedao.deleteById(id);
    }

    public boolean update(Examine examine) {
        log.info("修改id:" + examine.getId() + "的社团审核类内容");
        return examinedao.update(examine);
    }
}
