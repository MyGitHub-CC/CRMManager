package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {

	public List<User> search(@Param(value="begin")int begin, 
			@Param(value="user") User user);
	
	public int searchCount();

	public int insert(User user);

	public User searchById(int uId);

	public int update(User user);

	public int delete(int uId);

	public User searchByCondition(User user);
	
}
