package com.example.service;

import java.io.Serializable;
import java.util.List;

import com.example.dao.UserDao;
import com.example.model.User;

public class UserService implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserDao udao = new UserDao();

	public boolean createUser(User u) {
		return udao.createUser(u);
	}

	public User getUserById(long id) {
		return udao.getUserById(id);

	}

	public User getUserByUserName(String username) {
		return udao.getUserByUserName(username);
	}

	public List<User> getAllUser() {
		return udao.getAllUser();
	}

	public List<User> getListOfUsersByType(String type) {
		return udao.getListOfUsersByType(type);
	}

	public boolean updateUser(User u) {
		return udao.updateUser(u);
	}

	public boolean updateUserById(long id, String name) {
		return udao.updateUserById(id, name);
	}

	public boolean updatePasswordByUsername(String username, String password) {
		return udao.updatePasswordByUsername(username, password);
	}

	public boolean deleteUser(User u) {
		return udao.deleteUser(u);
	}
	public void fillUserBean( User userdb,User userBean) {
		 udao.fillUserBean(userdb, userBean);
	}
}
	