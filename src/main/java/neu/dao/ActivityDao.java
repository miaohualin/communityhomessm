package neu.dao;

import java.util.Date;
import java.util.List;

import neu.entity.Activity;
import neu.entity.User;


/**
 * ��������ص����ݿ�
 * @author ��ү
 *
 */
public interface ActivityDao {
	/**
	 * 
	 * @param activity ����Ļ
	 * @return ����Ӱ�������
	 */
	int addActivity(Activity activity);
	/**
	 * 
	 * @param id ɾ����id
	 * @return Ӱ�������
	 */
	int deleteActivity(int id);
	/**
	 * ʱ����Ϊ���ƣ�����ѯ�����ѯ2017/7/1 ֮������еĻ
	 * @param startTime	��ʼʱ��
	 * @param commID ����id Լ�����id��ֵΪ-1��Ϊ�����������ŵĻ
	 * @return �������������ж�̬
	 */
	List<Activity> queryByTime(int commID,Date startTime);
	/**
	 * 
	 * @param commID ����id Լ�����id��ֵΪ-1��Ϊ�����������ŵĻ
	 * @return �������ڸ����ŵĻ
	 */
	public List<Activity> queryAll(int commID);
	/**
	 * 
	 * @param theme ���Ҹ��������
	 * @return ���и��������
	 */
	public List<Activity> queryByTheme(String theme);
	/**
	 * ���Ҹû�������û�
	 * @param id ���id
	 * @return ���е��û�
	 */
	public List<User> queryAllUsers(int id);
	/**
	 * 
	 * @param id ���id
	 * @param user �������û�
	 * @return Ӱ�������
	 */
	public int addUser(int id,int user_id);
	/**
	 * 
	 * @param id ���id
	 * @return ����
	 */
	Activity queryById(int id);
}
