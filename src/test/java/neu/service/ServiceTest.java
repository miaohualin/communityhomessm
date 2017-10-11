package neu.service;

/**
 * Created by 黄宇航 on 2017/9/20.
 */
import neu.entity.Examine;
import neu.entity.JoiningAssn;
import neu.entity.User;
import org.junit.runner.RunWith;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.*;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.ResolvableType;
import org.springframework.core.env.Environment;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import java.sql.Timestamp;

import static org.testng.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring-mvc.xml", "classpath*:/spring-mybatis.xml"})
public class ServiceTest extends AbstractTransactionalTestNGSpringContextTests{
    @Autowired
    private UserService userservice;
    @Autowired
    private ExamineService examineservice;
    @Autowired
    private JoiningAssnService joiningassnservice;


    /* pass */
    @Test
    //@Rollback(false)
    public void testUserService(){
        User user = userservice.queryByUserid(1000);

        assertNotNull(user);
        System.out.println(user);

        assertTrue(userservice.add(user) == -2);
        user.setPassword("1");

        assertTrue(userservice.add(user) == -2);
        assertTrue(userservice.update(user));
        assertTrue(userservice.queryByUserid(1000).getPassword().equals("1"));

        assertTrue(userservice.deleteByUserid(1001));
        assertNull(userservice.queryByUserid(1001));

        user.setUsername("hyh");
        assertTrue(userservice.add(user) == 1);
        assertNotNull(userservice.queryByUsername("hyh"));

        assertNotNull(userservice.queryByUsernameAndPassword("test1", "pssword"));
        assertNull(userservice.queryByUsernameAndPassword("test1", "passwo1rd"));
        assertNull(userservice.queryByUsernameAndPassword("test", "password"));
    }

    /* pass */
    @Test
    public void testExamineService(){
        Examine examine = examineservice.queryByid(1000);

        assertNotNull(examine);
        assertNull(examineservice.queryByid(5));
        assertNotNull(examineservice.queryByUserid(1000));
        assertTrue(examineservice.queryByUserid(1000).size() == 2);
        assertTrue(examineservice.queryByUserid(1005).size() == 0);
        assertTrue(examineservice.queryAll().size() == 2);

        assertTrue(examineservice.deleteById(1001));
        assertNull(examineservice.queryByid(1001));

        examine.setName("waa");
        assertTrue(examineservice.update(examine));
        assertTrue(examineservice.queryByid(1000).getName().equals("waa"));

        examine.setId(0L);
        examine.setName("1sc");
        assertTrue(examineservice.add(examine) == 1);
        assertNotNull(examineservice.queryByid(1002));
        assertTrue(examineservice.queryByid(1002).getName().equals("1sc"));
    }

    /* pass */
    @Test
    public void testJoiningAssnService(){
        JoiningAssn js = joiningassnservice.queryById(1);

        assertNotNull(js);
        assertTrue(joiningassnservice.queryByUserid(1).size() == 1);
        assertTrue(joiningassnservice.queryByAssnid(1).size() == 2);
        assertTrue(joiningassnservice.queryByTime(Timestamp.valueOf("2017-7-21 10:00:01")).size() == 2);

        assertTrue(joiningassnservice.deleteById(2));
        assertNull(joiningassnservice.queryById(2));

        js.setAssnid(124);
        assertTrue(joiningassnservice.update(js));
        assertTrue(joiningassnservice.queryById(1).getAssnid() == 124);

        js.setId(0);
        js.setAssnid(12451);
        assertTrue(joiningassnservice.add(js) == 1);
        assertTrue(joiningassnservice.queryById(3).getAssnid() == 12451);
    }
}
