package com.example.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "USER_TYPE", discriminatorType = DiscriminatorType.STRING)
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long userId;
	@Column(unique = true)
	@NotNull(message = "username cannot be null")
	@NotBlank()
	private String userName;
	@NotNull(message = "password cannot be null")
	@Size(min = 8, max = 32, message = "password must be between 8 and 32 characters")
	@NotBlank()
	private String password;
	@NotNull(message = "Name cannot be null")
	@NotBlank()
	private String name;
	@NotNull(message = "surName cannot be null")
	@NotBlank()
	private String surName;
	private String type;
	private boolean loggedIn;
	private Date birthday = new Date();

	public User() {

	}

	public User( String userName,String password,String name, String surName, String type, Date birthday) {
		super();
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.surName = surName;
		this.type = type;
		this.birthday = birthday;
		this.loggedIn=false;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isLoggedIn() {
		return loggedIn;
	}

	public void setLoggedIn(boolean logeIn) {
		this.loggedIn = logeIn;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

}
