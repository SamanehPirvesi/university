<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">University</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
               
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<%=request.getContextPath()%>/doLogOut.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="<%=request.getContextPath()%>/userPortal/adminHome.jsp"><i class="fa fa-home fa-fw"></i> Home</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Students<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/student/registerStudent.jsp">create new student</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/student/listOfStudents.jsp">student's list</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Teachers<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/teacher/registerTeacher.jsp">create new teacher</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/teacher/listOfTeachers.jsp">teacher's list</a>
                                </li>
                           </ul>
                          </li>
                           <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Courses<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/registerContact.jsp">create new course</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/listOfContacts.jsp">course's list</a>
                                </li>
                          </ul>
                        
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Department<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/registerContact.jsp">create new department</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/listOfContacts.jsp">department's list</a>
                                </li>
                                
                            </ul>
                        </li>
                         <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Lessons<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/registerContact.jsp">create new lesson</a>
                                </li>
                                <li>
                                    <a href="<%=request.getContextPath()%>/phonebook/listOfContacts.jsp">lesson's list</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
    