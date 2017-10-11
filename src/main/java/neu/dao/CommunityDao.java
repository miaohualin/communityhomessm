package neu.dao;

import java.util.List;

import neu.entity.Community;
import neu.entity.User;

public interface CommunityDao {
	/**
	 * @param community
	 *            增加社团
	 * @return 影响的行数
	 */
	int addCommunity(Community community);

	/**
	 * 
	 * @param user
	 *            增加user到社团
	 * @return 影响的行数
	 */
	int addUser(int commID, int userID);

	/***
	 * 
	 * @param id
	 *            删除社团
	 * @return 影响的行数
	 */
	int deleteCommunity(int id);

	/**
	 * 
	 * @param type
	 *            类型
	 * @return 该类型的社团
	 */
	List<Community> queryByType(String type);

	/**
	 * 
	 * @param communityID
	 *            找到该社团的所有用户
	 * @return 所有的社团的用户
	 */
	List<User> queryAllUser(int communityID);

	/**
	 * 
	 * @param name
	 *            社团的名字
	 * @return 改名字的社团
	 */
	Community queryByName(String name);

	/**
	 * 
	 * @param name
	 *            名字
	 * @return 与输入名字相近的社团
	 */
	List<Community> queryByNameLike(String name);

	/**
	 * 
	 * @return 所有的社团
	 */
	List<Community> queryAll();

	/**
	 * 
	 * @param id
	 *            查找的id
	 * @return 这个社团
	 */
	Community queryById(int id);

	/**
	 * 
	 * @param userID
	 *            用户id
	 * @param CommID
	 *            社团id
	 * @return 是否为管理员
	 */
	boolean isManager(int userID, int CommID);

	/**
	 * 
	 * @param commID
	 *            社团id
	 * @param community
	 *            修改后的社团信息
	 * @return 影响的行数
	 */
	int updateCommunity(int commID, Community community);
}