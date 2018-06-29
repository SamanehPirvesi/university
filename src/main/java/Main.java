import java.util.Date;

import com.example.model.Course;
import com.example.model.Department;
import com.example.model.Lesson;
import com.example.model.Student;
import com.example.model.Teacher;
import com.example.model.University;
import com.example.model.User;
import com.example.service.CourseService;
import com.example.service.DepartmentService;
import com.example.service.LessonService;
import com.example.service.StudentService;
import com.example.service.UniversityService;
import com.example.service.UserService;

public class Main {

	public static void main(String[] args) {

		Date d1 = new Date(12 / 7 / 1980);
		Date d2 = new Date(17 / 9 / 1990);
		Date d3 = new Date(18 / 11 / 1977);
		Date d4 = new Date(28 / 13 / 1980);
		User u = new User("admin", "admin1234", "admin", d1);
		Student s = new Student("sara", "sansone12", "student", d2);
		Student s1 = new Student("sahar", "afshar123", "student", d4);
		Teacher t = new Teacher("maria", "ivano2345", "teacher", d3, 1400);
		Teacher t1 = new Teacher("marco", "12345678", "teacher", d1, 2500);
		Lesson l = new Lesson("mathematic",10);
		Lesson l2 = new Lesson("algorithm",6);
		Course c = new Course("software",180);
		Course c1 = new Course("network",180);
		Course c2 = new Course("Biology",180);
		Department dp = new Department("computer");
		Department dp1 = new Department("chemistry");
		University uni = new University("politecnic turin");
		UserService userService=new UserService();
		LessonService lService=new LessonService();
		StudentService studentService=new StudentService();
		CourseService courseService=new CourseService();
		DepartmentService departmentService=new DepartmentService();
		UniversityService universityService=new UniversityService();
		
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
		uni.addDepartment(dp1);
		uni.addDepartment(dp);
		dp1.setUniversity(uni);
		dp.setUniversity(uni);
		
		universityService.createUniversity(uni);
		departmentService.createDepartment(dp);
		departmentService.createDepartment(dp1);
		lService.createLesson(l);
		lService.createLesson(l2);
		courseService.createCourse(c);
		courseService.createCourse(c1);
		courseService.createCourse(c2);
		userService.createUser(u);
		userService.createUser(s);
		userService.createUser(s1);
		userService.createUser(t);
		userService.createUser(t1);

		}

}
