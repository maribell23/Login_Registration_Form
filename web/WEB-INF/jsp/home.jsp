<%-- 
    Document   : home
    Created on : 6 Νοε 2018, 6:23:47 μμ
    Author     : Bella
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="${pageContext.request.contextPath}/bgmycss.css" rel="stylesheet">
        <script type="text/javascript" language="javascript">
            var check = function () {
                if (document.getElementById('password').value ===
                        document.getElementById('confirmpassword').value) {
                    document.getElementById('message').style.color = 'green';
                    document.getElementById('message').innerHTML = 'matching';
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'not matching';
                }
            };
        </script>
    </head>

    <body>
        <div class="container register">
            <div class="row">
                <div class="col-md-3 register-left">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                    <h3>Welcome</h3>
                    <p>You are 30 seconds away from signing up or signing in with your account!</p>

                </div>
                <div class="col-md-9 register-right">
                    <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="register-tab" data-toggle="tab" href="#register" role="tab" aria-controls="register" aria-selected="true">Register</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="false">Login</a>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div     class="tab-pane fade show active" id="register" role="tabpanel" aria-labelledby="register-tab">
                            <h3 class="register-heading">Registration Form</h3>
                            <spring:form modelAttribute="user" action="${pageContext.request.contextPath}/user/register.htm" method="POST">
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <spring:input path="firstName" type="text" class="form-control" placeholder="First Name *" value="" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <spring:input path="lastName" type="text" class="form-control" placeholder="Last Name *" value="" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <spring:input path="email" type="email" class="form-control" required="required" placeholder="Your Email *" value="" />
                                        </div>

                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <spring:input path="username" type="text" class="form-control" placeholder="Username *" value="" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <spring:input path="password" id="password" type="password" class="form-control" placeholder="Password *" value="" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <spring:input path="confirmpassword" id="confirmpassword" type="password" class="form-control"  placeholder="Confirm Password *" value="" onkeyup='check();' required="required" />
                                            <span id='message'></span>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>

                                    </div>
                                    <h1> ${msg} </h1>
                                </spring:form>
                            </div>
                        </div>

                        <div class="tab-pane fade show" id="login" role="tabpanel" aria-labelledby="login-tab">
                            <h3  class="register-heading">Login</h3>
                            <form action="${pageContext.request.contextPath}/user/login.htm" method="POST" >
                                <div class="row register-form">

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input name = "username" type="text" class="form-control" placeholder="Username *" value="" required="required" />
                                        </div>

                                        <div class="form-group">
                                            <input name = "password" type="password" class="form-control" placeholder="Password *" value="" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <input type="checkbox" name="terms" required = "required" /> I accept the <u>Terms and Conditions</u>
                                        </div>
                                        <input type="submit" class="btnLogin"  value="Login"/>

                                    </div>
                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</body>
</html>

