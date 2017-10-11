package neu.dao;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import neu.entity.CommDynamic;

@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring-mybatis.xml" })
public class CommDynamicDaoTest {
	@Autowired
	private CommDynamicDao commDynamicDao;

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testAddDynamic() {
		CommDynamic commDynamic = new CommDynamic();
		commDynamic.setInformation("一个社团");
		commDynamic.setCommId(1000);
		commDynamicDao.addDynamic(commDynamic);
	}

	public void testDeleDynamic() {
		fail("Not yet implemented");
	}

	public void testQueryById() {
		fail("Not yet implemented");
	}

	public void testQueryByTime() {
		fail("Not yet implemented");
	}

	public void testQueryAll() {
		fail("Not yet implemented");
	}

}
