package neu.dao;


import java.sql.Timestamp;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import neu.entity.Activity;


@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class ActivityDaoTest {
	@Autowired
	private ActivityDao activityDao;
	@Before
	public void setUp() throws Exception {
	}

	
	public void testAddActivity() {
		Activity activity = new Activity();
		activity.setCommID(1000);
		activity.setContent("微笑");
		activity.setEndtime(Timestamp.valueOf("2017-07-23 00:00:00"));
		activity.setIntroduction("哈哈哈哈哈");
		activity.setPhone("1008611");
		activity.setPicture("image/i.jpg");
		activity.setCreatetime(Timestamp.valueOf("2017-07-20 00:00:00"));
		activity.setStarttime(Timestamp.valueOf("2017-07-20 00:00:00"));
		activity.setTheme("微笑");
		activity.setName("aa");
		activityDao.addActivity(activity);
	}

	
	public void testDeleteActivity() {
		activityDao.deleteActivity(1000);
	}

	
	public void testQueryByTime() {

	}

	
	public void testQueryAll() {
		List<Activity> activities = activityDao.queryAll(1000);
		for (Activity activity : activities) {
			System.out.println(activity);
		}
	}

	@Test
	public void testQueryByTheme() {
		List<Activity>activities = activityDao.queryByTheme("微笑");
		for (Activity activity : activities) {
			System.out.println(activity);
		}
	}

	
	public void testQueryAllUsers() {
		
	}

	
	public void testAddUser() {
		
	}

	
	public void testQueryById() {
		
	}

}
