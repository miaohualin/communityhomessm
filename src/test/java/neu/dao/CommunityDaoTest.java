package neu.dao;

import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import neu.entity.Community;

@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:spring-mybatis.xml" })
public class CommunityDaoTest {
	@Autowired
	private CommunityDao communityDao;

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testAddCommunity() {
		Community community = new Community();
		community.setEmail("@1660");
		community.setIntroduce("这是一个好社团");
		community.setName("棉花社");
		community.setPicture("images/h.jpg");
		community.setSchool("学校");
		community.setType("艺术");
		communityDao.addCommunity(community);
	}

	public void testDeleteCommunity() {
		fail("Not yet implemented");
	}

	public void testQueryByType() {
		fail("Not yet implemented");
	}

	public void testQueryByName() {
		fail("Not yet implemented");
	}

	public void testQueryById() {
		fail("Not yet implemented");
	}

}
