package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;

import service.UserService;
import entity.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public List<User> search(int begin, User user) {
		return userDao.search(begin, user);
	}

	@Override
	public int searchCount() {
		return userDao.searchCount();
	}

	@Override
	public int add(User user) {
		return userDao.insert(user);
	}

	@Override
	public User searchById(int uId) {
		return userDao.searchById(uId);
	}

	@Override
	public int modify(User user) {
		return userDao.update(user);
	}

	@Override
	public int delete(int uId) {
		return userDao.delete(uId);
	}

	@Override
	public User searchByCondition(User user) {
		return userDao.searchByCondition(user);
	}
	

}
