import java.util.Date;

import com.example.model.Course;
import com.example.model.Department;
import com.example.model.Lesson;
import com.example.model.Student;
import com.example.model.Teacher;
import com.example.model.User;
import com.example.service.CourseService;
import com.example.service.DepartmentService;
import com.example.service.LessonService;
import com.example.service.StudentService;
import com.example.service.TeacherService;
import com.example.service.UserService;
import com.example.utility.PasswordCodification;

public class Main {

	public static void main(String[] args) {

		Date d1 = new Date(12 / 7 / 1980);
		Date d2 = new Date(17 / 9 / 1990);
		Date d3 = new Date(18 / 11 / 1977);
		Date d4 = new Date(28 / 13 / 1980);
		User u = new User("admin", "admin1234","admin","admin", "admin", d1);
		Student s = new Student("sara", "sansone12","sara","sansone", "student", d2);
		Student s4= new Student("sina", "s12345678","sina","ahadi", "student", d2);
		Student s1 = new Student("sahar", "afshar123", "sahar", "afshar","student", d4);
		Teacher t = new Teacher("maria", "ivano2345", "maria","famiani","teacher", d3, 1400);
		Teacher t1 = new Teacher("marco", "12345678","marco","toserani", "teacher", d1, 2500);
		Lesson l = new Lesson("mathematic",10);
		Lesson l2 = new Lesson("algorithm",6);
		Course c = new Course("software",180);
		Course c1 = new Course("network",180);
		Course c2 = new Course("Biology",180);
		Department dp = new Department("computer");
		Department dp1 = new Department("chemistry");
		UserService userService=new UserService();
		LessonService lService=new LessonService();
		StudentService studentService=new StudentService();
		CourseService courseService=new CourseService();
		DepartmentService departmentService=new DepartmentService();
		TeacherService ts=new TeacherService();
	
		
		s.setCourse(c);
		c.addStudent(s);
		s.setDepartment(dp);
		dp.addStudent(s);
		s1.setCourse(c1);
		c1.addStudent(s1);
		s1.setDepartment(dp);
		dp.addStudent(s1);
		t.addDepartmet(dp1);
		dp1.addTeacher(t);
		t.addCourses(c);
		t.addCourses(c1);
		c.addTeacher(t);
		c1.addTeacher(t);
		c2.addTeacher(t1);
		t1.addCourses(c2);
		c.addLessons(l);
		l.addCourses(c);
		l2.addCourses(c2);
		c2.addLessons(l2);
		c2.setDepartment(dp1);
		dp1.addCourse(c2);
		dp.addCourse(c);
		c.setDepartment(dp);
		dp.addCourse(c1);
		c1.setDepartment(dp);
		
		
	
//		departmentService.createDepartment(dp);
//		departmentService.createDepartment(dp1);
//		lService.createLesson(l);
//		lService.createLesson(l2);
//		courseService.createCourse(c);
//		courseService.createCourse(c1);
//		courseService.createCourse(c2);
//		userService.createUser(u);
//		userService.createUser(s);
//		userService.createUser(s1);
//		userService.createUser(t);
//		userService.createUser(t1);
		User u5=userService.getUserByUserName("admin");
		u5.setPassword(PasswordCodification.codificatePass("12345678"));
		userService.updateUser(u5);
//s4.setCourse(c);
//s4.setDepartment(dp1);
//c.addStudent(s4);
//dp.addStudent(s4);
//courseService.updateCourse(c);
//departmentService.updateDepartment(dp1);
//		studentService.getAllStudent().stream().forEach(g->System.out.println(g.getName()));
//		ts.getListOfCoursesForTeacher(5).stream().forEach(y->System.out.println(y.getCourseName()));
		
		}
	

}
