package com.example.utility;

import com.example.model.User;

public class AuthUtility {
	
	public static boolean canUserProceed(String uri,User u) {
		 return (     (u!=null && u.isLoggedIn()== true) &&
    			 (
    			 isCorrectPath(uri,u,"/adminPortal","admin") ||
    			 isCorrectPath(uri,u,"/studentPortal","student")||
    			 isCorrectPath(uri,u,"/teacherPortal","teacher")
    			 )
    	 );
	}
	
	public static boolean isCorrectPath(String uri,User u,String path,String userType) {
		return uri.contains(path) && u.getType().toLowerCase().equals(userType);
	}

}
