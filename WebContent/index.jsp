<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	

<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.*"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<title>testonline.com.vn</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style.css"></link>
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
</head>
<body ng-app=""
	style="backgroup: green; background-image: url(img/hinhHeader.png); background-repeat: no-repeat; background-size: 100% auto;">
	<div id="header"></div>
	<!-- header -->

	<div id="content">
		<div class="container">
			<div class="panel panel-success col-md-offset-1">
				<div class="panel-heading text-center ">
					<h2>
						<img src="img/key.png" height="60px" width="60px">ĐĂNG NHẬP
					</h2>
				</div>
				<div class="panel-body">

					<form name="myForm" action="Checklogin" method="post">
						<div class="form-inline">
							<div class="form-group col-md-offset-2">
								<label class=" control-label">Tài khoản: </label> <input
									name="Name_User" type="text" class="form-control input-lg"
									ng-model="Model_User" id="User" tabindex="1" required
									size="50px"> </input><span class="ChuaNhapValue"
									ng-show="myForm.Name_User.$touched && myForm.Name_User.$invalid">Nhập
									tên đăng nhập</span>

							</div>
						</div>
						<div class="form-inline">
							<div class="form-group  col-md-offset-2"
								style="padding-left: 5px">
								<label class=" control-label">Mật khẩu:</label> <input
									name="Name_Pass" type="password" class="form-control input-lg"
									tabindex="2" id="Pass" ng-model="Model_Pass" required
									size="50px"></input> <span class="ChuaNhapValue"
									ng-show="myForm.Name_Pass.$touched && myForm.Name_Pass.$invalid">Chưa
										nhập mật khẩu</span>
							</div>
						</div>
						<p>
							<% if (request.getAttribute("thongbao") != null) 
               			 	{%>
							<p style="color: red" class="col-md-offset-3"><%= request.getAttribute("thongbao") %></p>
							<% }%>
						</p>
						<!--  <div class="form-group col-md-offset-9">
                    <input type="checkbox">
                    <label class="btn-link"> Remember me</label>
                 </div> -->
						<div class="form-group col-md-offset-2"
							style="padding-left: 50px;">
							<div class="input-group ">
								<span class=" radio-inline"> <input type="radio"
									name="optradio" value="0" checked="true">
										<p>Sinh viên</p></span> <span class=" radio-inline">
									<p>
										<input type="radio" name="optradio" value="1">Quản trị
											đề
									</p>
								</span> <span class="radio-inline"> <input type="radio"
									name="optradio" value="2">
										<p>Quản trị kì thi</p></span> <span class=" radio-inline"> <input
									type="radio" name="optradio" value="3">
										<p>Quản trị ngân hàng câu hỏi</p></span> <span class=" radio-inline">

									<input type="radio" name="optradio" value="4">
										<p>Admin</p>
								</span>
							</div>
							<!-- /input-group -->
						</div>

						<input type="submit" value="Đăng nhập" id="btnDangNhap"
							class="btn btn-success col-md-offset-9 btn-lg " role="button">
							<BR />
					</form>



				</div>
				<!-- panel-body-->
			</div>
			<!-- panel-succses-->
		</div>
	</div>

	<div id="footer"></div>
	<!-- footer -->


</body>
</html>