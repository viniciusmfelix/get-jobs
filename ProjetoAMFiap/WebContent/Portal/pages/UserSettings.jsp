<%@page import="com.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
session = request.getSession(true);
String email = (String) session.getAttribute("email");
String name;
UserDAO userdao = new UserDAO(); 
name = userdao.retrieveName(email);
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sniper Contractor - User Settings</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="../favicon.ico" type="image/x-icon" />

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/dist/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/icon-kit/dist/css/iconkit.min.css">
    <link rel="stylesheet" href="../plugins/mohithg-switchery/dist/switchery.min.css">
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
                            <div class="nav-item">
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
                                <a href="pages/"><i class="ik ik-award"></i><span>Analytics</span></a>
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

                        <div class="col-12">
                            <div class="card">
                                <ul class="nav nav-pills custom-pills" id="pills-tab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="pills-profile-tab" data-toggle="pill"
                                            href="#notifications" role="tab" aria-controls="pills-notifications"
                                            aria-selected="false">Notifications</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pills-account-tab" data-toggle="pill" href="#account"
                                            role="tab" aria-controls="pills-account" aria-selected="false">Account</a>
                                    </li>
                                </ul>

                                <div class="tab-content" id="pills-tabContent">
                                    <!--Profile-->
                                    <div class="tab-pane fade show active" id="notifications" role="tabpanel"
                                        aria-labelledby="pills-profile-tab">
                                        <div class="card-body">
                                            <div class="row mb-5 pb-5">
                                                <div class="col-12">
                                                    <h5>Notifications</h5>
                                                    <hr class="mt-0 pt-0">
                                                </div>
                                                <div class="col-12">
                                                    <form name="formNotifications" action="" method="post">
                                                        <div class="form-group">
                                                            <h6>General </h6>
                                                            <input type="checkbox" class="js-small" checked />
                                                        </div>
                                                        <button type="submit"
                                                            class="btn btn-success float-right">Save</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="account" role="tabpanel"
                                        aria-labelledby="pills-profile-tab">
                                        <div class="card-body">
                                            <div class="row mb-5 pb-5">
                                                <div class="col-12">
                                                    <h5>Password</h5>
                                                    <hr class="mt-0 pt-0">
                                                </div>

                                                <div class="col-12">
                                                    <form name="formPassword" action="" method="post">

                                                        <div class="form-group">
                                                            <label for="password">New password</label>
                                                            <input id="password" class="form-control" type="password"
                                                                name="password" required>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="password">Confirm password</label>
                                                            <input id="password" class="form-control" type="password"
                                                                name="password" required>
                                                        </div>
                                                        <br>
                                                        <button type="submit"
                                                            class="btn btn-success float-right">Save</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <!--Education-->
                                    <div class="tab-pane fade" id="education" role="tabpanel"
                                        aria-labelledby="pills-profile-tab">
                                        <div class="card-body">
                                            <div class="row mb-5 pb-5">
                                                <div class="col-12">
                                                    <h5>Education</h5>
                                                    <hr class="mt-0 pt-0">
                                                </div>
                                                <div class="col-12">
                                                    <form name="education" action="" method="post">

                                                        <div id="accordion">
                                                            <div class="card card-with-border mb-3">
                                                                <div class="card-header " id="headingOne">
                                                                    <div class="col-6">
                                                                        <h5 class="mb-0">(Not specified)</h5>
                                                                        <small>start date - end date</small>
                                                                    </div>
                                                                    <div class="col-6 d-flex justify-content-end">
                                                                        <button type="button"
                                                                            class="btn btn-link btn-cardJob pr-0"
                                                                            data-toggle="collapse"
                                                                            data-target="#collapseOne"
                                                                            aria-expanded="true"
                                                                            aria-controls="collapseOne">
                                                                            <i class="fa fa-sort"
                                                                                aria-hidden="true"></i>
                                                                        </button>
                                                                        <button type="button"
                                                                            class="btn btn-link btn-cardJob pr-0">
                                                                            <i class="fa fa-trash-alt"
                                                                                aria-hidden="true"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>

                                                                <div id="collapseOne" class="collapse show"
                                                                    aria-labelledby="headingOne"
                                                                    data-parent="#accordion">
                                                                    <div class="card-body">
                                                                        <div class="experience1">
                                                                            <div class="form-row">
                                                                                <div class="form-group col-md-6">
                                                                                    <label for="school">School</label>
                                                                                    <input id="school"
                                                                                        class="form-control" type="text"
                                                                                        name="school">
                                                                                </div>
                                                                                <div class="form-group col-md-6">
                                                                                    <label for="degree">Degree</label>
                                                                                    <input id="degree"
                                                                                        class="form-control" type="text"
                                                                                        name="degree">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-row">
                                                                                <div class="form-group col-6 pr-1">
                                                                                    <label for="startDate">Start
                                                                                        Date</label>
                                                                                    <input id="startDate"
                                                                                        class="form-control" type="date"
                                                                                        name="startDate">
                                                                                </div>
                                                                                <div class="form-group col-6 pl-0">
                                                                                    <div class="form-group">
                                                                                        <label for="endDate">End
                                                                                            Date</label>
                                                                                        <input id="endDate"
                                                                                            class="form-control"
                                                                                            type="date" name="endDate">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-row">
                                                                                <div class="form-group col-12">
                                                                                    <label
                                                                                        for="educationDescription">Description</label>
                                                                                    <textarea class="form-control"
                                                                                        name="educationDescription"
                                                                                        id="educationDescription"
                                                                                        rows="5"></textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <button type="button" name="" id=""
                                                            class="btn btn-outline-secondary btn-block"><i
                                                                class="fa fa-plus" aria-hidden="true"></i> add
                                                            More</button>
                                                        <br>
                                                        <button type="submit"
                                                            class="btn btn-success float-right">Save</button>
                                                    </form>
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
    <script src="../plugins/mohithg-switchery/dist/switchery.min.js"></script>
    <script src="../dist/js/theme.js"></script>
    <script src="../js/swithes.js"></script>
</body>

</html>