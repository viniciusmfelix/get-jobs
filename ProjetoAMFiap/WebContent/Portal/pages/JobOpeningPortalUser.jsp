<%@page import="java.util.List"%>
<%@page import="com.dao.JobOpeningDAO"%>
<%@page import="com.model.JobOpening"%>
<%@page import="com.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
session = request.getSession(true);
String email = (String) session.getAttribute("email");
String name;
UserDAO userdao = new UserDAO(); 
name = userdao.retrieveName(email);
JobOpeningDAO jobopeningdao = new JobOpeningDAO();
List<JobOpening> job_list = jobopeningdao.retrieveJobOpening();
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sniper Contractor - User Job Openings</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="../favicon.ico" type="image/x-icon" />

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/dist/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/icon-kit/dist/css/iconkit.min.css">
    <link rel="stylesheet" href="../dist/css/theme.min.css">
    <script src="../src/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

    <div class="wrapper">
        <header class="header-top" header-theme="dark">
            <div class="container-fluid">
                <div class="d-flex justify-content-between">
                    <div class="top-menu d-flex align-items-center">
                        <button type="button" class="btn-icon mobile-nav-toggle d-lg-none"><span></span></button>
                        <div class="header-search">
                            <div class="input-group">
                                <span class="input-group-addon search-close"><i class="ik ik-x"></i></span>
                                <input type="text" class="form-control">
                                <span class="input-group-addon search-btn"><i class="ik ik-search"></i></span>
                            </div>
                        </div>
                        <button type="button" id="navbar-fullscreen" class="nav-link"><i
                                class="ik ik-maximize"></i></button>
                    </div>
                    <div class="top-menu d-flex align-items-center">
                        <div class="dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="notiDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
                                    class="ik ik-bell"></i><span class="badge bg-danger">3</span></a>
                            <div class="dropdown-menu dropdown-menu-right notification-dropdown"
                                aria-labelledby="notiDropdown">
                                <h4 class="header">Notifications</h4>
                                <div class="notifications-wrap">
                                    <a href="#" class="media">
                                        <span class="d-flex">
                                            <i class="ik ik-check"></i>
                                        </span>
                                        <span class="media-body">
                                            <span class="heading-font-family media-heading">Invitation accepted</span>
                                            <span class="media-content">Your have been Invited ...</span>
                                        </span>
                                    </a>
                                    <a href="#" class="media">
                                        <span class="d-flex">
                                            <img src="../img/users/1.jpg" class="rounded-circle" alt="">
                                        </span>
                                        <span class="media-body">
                                            <span class="heading-font-family media-heading">Steve Smith</span>
                                            <span class="media-content">I slowly updated projects</span>
                                        </span>
                                    </a>
                                    <a href="#" class="media">
                                        <span class="d-flex">
                                            <i class="ik ik-calendar"></i>
                                        </span>
                                        <span class="media-body">
                                            <span class="heading-font-family media-heading">To Do</span>
                                            <span class="media-content">Meeting with Nathan on Friday 8 AM ...</span>
                                        </span>
                                    </a>
                                </div>
                                <div class="footer"><a href="javascript:void(0);">See all activity</a></div>
                            </div>
                        </div>
                        <div class="dropdown">
                            <a class="dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><img class="avatar" src="../img/user.jpg"
                                    alt=""></a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="UserProfile.jsp"><i class="ik ik-user dropdown-icon"></i>
                                    Profile</a>
                                <a class="dropdown-item" href="UserSettings.jsp"><i class="ik ik-settings dropdown-icon"></i>
                                    Settings</a>
                                <a class="dropdown-item" href="../../Logout.jsp"><i class="ik ik-power dropdown-icon"></i>
                                    Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="page-wrap">
            <div class="app-sidebar colored">
                <div class="sidebar-header">
                    <a class="header-brand" href="../UserPage.jsp">
                        <div class="logo-img">
                            <i class="fas fa-crosshairs"></i>
                        </div>
                        <span class="text">Sniper Contractor</span>
                    </a>
                    <button type="button" class="nav-toggle"><i data-toggle="expanded"
                            class="ik ik-toggle-right toggle-icon"></i></button>
                    <button id="sidebarClose" class="nav-close"><i class="ik ik-x"></i></button>
                </div>

                <div class="sidebar-content">
                    <div class="nav-container">
                        <nav id="main-menu-navigation" class="navigation-main">
                            <div class="nav-lavel">General</div>
                            <div class="nav-item">
                                <a href="../UserPage.jsp"><i class="ik ik-bar-chart-2"></i><span>Start</span></a>
                            </div>
                            <div class="nav-lavel">Job Openings</div>
                            <div class="nav-item active">
                                <a href="JobOpeningPortalUser.jsp"><i class="ik ik-book-open"></i><span>My Job Openings</span></a>
                            </div>
                            <div class="nav-item">
                                <a href="UserJobOpeningApplied.jsp"><i class="ik ik-book"></i><span>Applies</span></a>
                            </div>
                            <div class="nav-lavel">Resume</div>
                            <div class="nav-item">
                                <a href="UserProfile.jsp"><i class="ik ik-user"></i><span>Profile</span></a>
                            </div>
                            <div class="nav-item">
                                <a href="UserFeedbacks.jsp"><i class="ik ik-award"></i><span>Feedbacks</span></a>
                            </div>
                            <div class="nav-lavel">Support</div>
                            <div class="nav-item">
                                <a href="javascript:void(0)"><i class="ik ik-help-circle"></i><span>Remove Doubts</span></a>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-2 clearfix">
                                <a class="btn pt-0 pl-0 d-md-none d-lg-none" data-toggle="collapse"
                                    href="#displayOptions" role="button" aria-expanded="true"
                                    aria-controls="displayOptions">
                                    Display Options
                                    <i class="ik ik-chevron-down align-middle"></i>
                                </a>
                                <div class="collapse d-md-block display-options" id="displayOptions">
                                    <span class="mr-3 d-inline-block float-md-left dispaly-option-buttons">
                                        <a href="#" class="mr-1 view-list">
                                            <i class="ik ik-menu view-icon"></i>
                                        </a>
                                        <a href="#" class="mr-1 view-thumb  active">
                                            <i class="ik ik-list view-icon"></i>
                                        </a>
                                    </span>
                                    <div class="d-block d-md-inline-block">
                                        <div class="btn-group float-md-left mr-1 mb-1">
                                            <button class="btn btn-outline-dark btn-xs dropdown-toggle" type="button"
                                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Order By
                                                <i class="ik ik-chevron-down mr-0 align-middle"></i>
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Another action</a>
                                            </div>
                                        </div>
                                        <div class="search-sm d-inline-block float-md-left mr-1 mb-1 align-top">
                                            <form action="">
                                                <input type="text" class="form-control" placeholder="Search.." required>
                                                <button type="submit" class="btn btn-icon"><i
                                                        class="ik ik-search"></i></button>
                                                <button type="button" id="adv_wrap_toggler"
                                                    class="adv-btn ik ik-chevron-down dropdown-toggle"
                                                    data-toggle="dropdown" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"></button>
                                                <div class="adv-search-wrap dropdown-menu dropdown-menu-right"
                                                    aria-labelledby="adv_wrap_toggler">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" placeholder="Full Name">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" placeholder="Email">
                                                    </div>
                                                    <button class="btn btn-theme">Search</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="float-md-right">
                                        <span class="text-muted text-small mr-2">Displaying 1-10 of 210 items </span>
                                        <button class="btn btn-outline-dark btn-xs dropdown-toggle" type="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            20
                                            <i class="ik ik-chevron-down mr-0 align-middle"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="#">10</a>
                                            <a class="dropdown-item" href="#">20</a>
                                            <a class="dropdown-item" href="#">30</a>
                                            <a class="dropdown-item" href="#">50</a>
                                            <a class="dropdown-item" href="#">100</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="separator mb-20"></div>

                            <div class="row layout-wrap" id="layout-wrap">
                            <%for(JobOpening job : job_list){ %>
                                <div class="col-12 list-item list-item-thumb">
                                    <div class="card d-flex flex-row mb-3">
                                        <a class="d-flex card-img" href="#editLayoutItem" data-toggle="modal"
                                            data-target="#editLayoutItem">
                                            <img src="../img/portfolio-1.jpg"
                                                alt="Donec sit amet est at sem iaculis aliquam."
                                                class="list-thumbnail responsive border-0">
                                            <span
                                                class="badge badge-pill badge-primary position-absolute badge-top-left">New</span>
                                        </a>
                                        <div class="d-flex flex-grow-1 min-width-zero card-content">
                                            <div
                                                class="card-body align-self-center d-flex flex-column flex-md-row justify-content-between min-width-zero align-items-md-center">
                                                <a class="list-item-heading mb-1 truncate w-40 w-xs-100"
                                                    href="#editLayoutItem" data-toggle="modal"
                                                    data-target="#editLayoutItem">
                                                    <%=job.getTitle()%> - n� <%=job.getJo_code() %>
                                                </a>
                                                <p class="mb-1 text-muted text-small category w-15 w-xs-100">Art</p>
                                                <p class="mb-1 text-muted text-small date w-15 w-xs-100">02.04.2018</p>
                                                <div class="w-15 w-xs-100">
                                                    <span class="badge badge-pill badge-secondary">On Hold</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade edit-layout-modal" id="editLayoutItem" tabindex="-1" role="dialog"
                aria-labelledby="editLayoutItemLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editLayoutItemLabel">Job Opening n�: <%=job.getJo_code() %> - <%=job.getTitle() %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <p class="lead"><%=job.getOverview() %></p>
                            <div class="row">
                                <div class="col-md-6"><img src="../img/portfolio-1.jpg" class="img-fluid" alt=""></div>
                                <div class="col-md-6"><img src="../img/portfolio-8.jpg" class="img-fluid" alt=""></div>
                            </div>
                            <div class="jumbotron pt-30 pb-30 mt-30">
                                <h2 class="mt-0">Location: <%=job.getCity() %> - <%=job.getCountry() %></h2>
                                <p class="lead"><%=job.getAddress() %></p>
                            </div>
                            <p><%=job.getDescription() %></p>
                        </div>
                        <div class="modal-footer">
                        <%session.setAttribute("jobid", job.getJo_code()); %>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="ApplyToJob.jsp" class="btn btn-success">Candidatar-se</a>
                        </div>
                    </div>
                </div>
            </div>
<%} %>
            <footer class="footer">
                <div class="w-100 clearfix">
                    <span class="text-center text-sm-left d-md-inline-block">Copyright � 2018 ThemeKit v2.0. All Rights
                        Reserved.</span>
                    <span class="float-none float-sm-right mt-1 mt-sm-0 text-center">Crafted with <i
                            class="fa fa-heart text-danger"></i> by <a href="http://lavalite.org/" class="text-dark"
                            target="_blank">Lavalite</a></span>
                </div>
            </footer>

        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../src/js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
    <script src="../plugins/popper.js/dist/umd/popper.min.js"></script>
    <script src="../plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="../plugins/screenfull/dist/screenfull.js"></script>
    <script src="../plugins/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../plugins/summernote/dist/summernote-bs4.min.js"></script>
    <script src="../dist/js/theme.js"></script>
    <script src="../js/layouts.js"></script>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
    <script>
            (function (b, o, i, l, e, r) {
                b.GoogleAnalyticsObject = l; b[l] || (b[l] =
                    function () { (b[l].q = b[l].q || []).push(arguments) }); b[l].l = +new Date;
                e = o.createElement(i); r = o.getElementsByTagName(i)[0];
                e.src = 'https://www.google-analytics.com/analytics.js';
                r.parentNode.insertBefore(e, r)
            }(window, document, 'script', 'ga'));
        ga('create', 'UA-XXXXX-X', 'auto'); ga('send', 'pageview');
    </script>
</body>

