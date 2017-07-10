package service;

import java.util.List;

import entity.User;

public interface UserService {

	public List<User> search(int begin,User user);
	
	public int searchCount();

	public int add(User user);

	public User searchById(int uId);

	public int modify(User user);

	public int delete(int uId);

	public User searchByCondition(User user);

}
