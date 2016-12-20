<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<title>nguoiquantrikythi</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/angular.min.js"></script>

 <script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"></link>
<link rel="stylesheet" hreflang="WebContent/css/jquery-ui.css"></link>
<link rel="stylesheet" href="/resources/demos/style.css"></link>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="WebContent/js/jquery-ui.js"></script>

<script type="text/javascript" lang ="javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js">
	
</script>



</head>
<body ng-app="">

	<%
		HttpSession sess = request.getSession(false);
	%>
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/qlthionline" user="root" password="trungdung29"/>
	<sql:query var="result" dataSource="${data}">  select  * from ThongTin_TatCaUser_View where MaTK ='<%= sess.getAttribute("taikhoan")%>' </sql:query>

	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="background-image: url(img/hinhHeader.png) ; background-repeat: no-repeat; background-size: 100% auto;">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<div class="dropdown" style="color: white">
							<a class="btn btn-lg  glyphicon glyphicon-user"
								style="color: white" data-toggle="dropdown"> <span
								class="caret "></span>
							</a>
							<ul class="dropdown-menu"
								style="background: #EED5D2; text-align: center;">
								<li style="border-bottom: 2px solid #8B795E;"><a href="#"
									id="DoiMatKhau"><strong>Đổi mật khẩu</strong></a></li>
								<li><a href="index.jsp"><strong>Đăng xuất</strong></a></li>
							</ul>
							<span><c:forEach var="row" items="${result.rows}">
                      			<c:out value="${row.TenNguoiDung}"></c:out>
                      		</c:forEach></span>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		</nav>
	</div>
	<!-- header -->
	<div id="content">
		<div class="jumbotron">
			<div class="col-md-2 danhsach">
				<ul class="nav nav-collapse nav-stacked ">
					<li class="active"><a href="#molopthi" data-toggle="tab"><img
							src="img/soan-lambaithi.png" height="40px" width="40px"></img>Mở
								lớp thi</a></li>
					<li><a href="#ThongBao" data-toggle="tab"><img
							src="img/thongbao.png" height="40px" width="40px"></img>Thông báo</a></li>
					<li><a href="#thongtincanhan" data-toggle="tab"><img
							src="img/thongtincanhan.png" height="40px" width="40px"></img>Thông
								tin cá nhân</a></li>
				</ul>
			</div>
			
			<!-- BangLopThi -->
			<div class=" tab-content col-md-10  danhsach1">
				<div class="tab-pane fade in active" id="molopthi">
					<div class="container">
						<ul class="nav navbar-nav danhsach2">
							<li class="active"><a href="#lopthi" data-toggle="tab"><img
									src="img/danhsach.png" height="40px" width="40px"></img>Danh
										sách lớp thi</a></li>
							<li><a href="#taolopthi" data-toggle="tab"><img
									src="img/them.png" height="40px" width="40px"></img>Tạo lớp thi</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="lopthi">
							<br></br>
							<form class="form-inline"
								style="background: #E6E6FA; padding: 20px 20px; color: blue;">

								<div class="form-group col-md-offset-0">
									<div class="form-group">
										<label class="control-label">Tìm kiếm theo:</label> <select
											class="form-control" id="LoaiTimKiem" name="LoaiTimKiem">
											<option value="0">id</option>
											<option value="1">Tên phòng</option>
											<option value="2">Mã đề</option>
											<option value="3">Ngày thi</option>
											<option value="4">Giờ bắt đầu</option>
											<option value="5">Giờ kết thúc</option>
										</select>
									</div>
								</div>

								<div class="form-group col-md-offset-1">
									<div class="input-group">
										<input type="text" id="NhapTuKhoa" class="form-control"
											onkeyup="myFunction()" placeholder="Tìm kiếm..."></input> <SPAN
											class="input-group-btn" style="border: white;"><img
											src="img/Searchicon.png" height="20px" width="20px"></img></SPAN>
									</div>
								</div>
							</form>

							<!-- TimKiemTable_Script -->
							<script type="text/javascript">
								function myFunction() {
									// Declare variables 
									var input, filter, table, tr, td, i;
									input = document
											.getElementById("NhapTuKhoa");
									filter = input.value.toUpperCase();
									table = document.getElementById("myTable");
									tr = table.getElementsByTagName("tr");

									// Loop through all table rows, and hide those who don't match the search query
									for (i = 0; i < tr.length; i++) {
										td = tr[i].getElementsByTagName("td")[$(
												'#LoaiTimKiem').val()];
										if (td) {
											if (td.innerHTML.toUpperCase()
													.indexOf(filter) > -1) {
												tr[i].style.display = "";
											} else {
												tr[i].style.display = "none";
											}
										}
									}
								}
							</script>


							<div id="caibangnguoiquantrikythi"  style="overflow-x: auto;">
								<table style="background: #E6E6FA" 
									class="table table-hover table-striped" id="myTable">
									<thead>
										<tr>
											<th>id</th>
											<th>Tên phòng</th>
											<th>Mã đề</th>
											<th>Ngày thi</th>
											<th>Thời gian bắt đầu</th>
											<th>Thời gian kết thúc</th>
											<th>Chỉnh sửa</th>
											<th>Xóa</th>

										</tr>
									</thead>
									
									<sql:query var="BangLopThi" dataSource="${data }"> select * from Thi order by id desc </sql:query>
									
									<tbody >
										<c:forEach var="row" items="${BangLopThi.rows }">
											<tr>
												<td> ${row.id } </td>
												<td>${row.TenPhong }</td>
												<td>${row.MaDe }</td>
												<td>${row.NgayThi }</td>
												<td>${row.GioBatDau }</td>
												<td>${row.GioKetThuc}</td>
												<td><a href="#FormChinhSuaLopThi" data-id="${row.id }" class="editLopThi" data-toggle="tab"><img
														src="img/sua.png" height="20px" width="20px"></img></a></td>
												<td><a href="XoaLopThi?id=${row.id }"  onclick="return confirm('Bạn thật sự muốn xóa?')" id="xoalopthi"><img
														src="img/xoa.png"  height="20px" width="20px"></img></a></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						
						<!-- Chinhsualopthi_script -->
						<SCRIPT type="text/javascript">
							$(document).ready(function(){
								$(".editLopThi").click(function(){
									var id = $(this).attr("data-id");
									$.get('LayThongTinLopSua',{id : id},function(response){
										$("#idLopThi").val(id);
										$("#MaDeThiChinhSua").val(response.MaDe);
										$("#NhapTenPhongThiChinhSua").val(response.TenPhong);
										$("#NhapNgayThiChinhSua").val(response.NgayThi);
										$("#NhapGioBatDauThiChinhSua").val(response.GioBatDau);
										$("#NhapGioKetThucThiChinhSua").val(response.GioKetThuc);
									});
								});
							});
						</SCRIPT>

						<!-- Autocomplete Text MaDe -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {
								$("#MaDeThiChinhSua").autocomplete({
									minLength : 4,
									source : function(request, response) {
										var $chon = $("#MaDeThiChinhSua").val();
										$.ajax({
											url : "Json_LayMaDe",
											type : "POST",
											data : {
												chuoi : $chon
											},
											dataType : "json",
											success : function(data) {
												response(data);
											}
										});
									}
								});
							});
						</SCRIPT>
		
						<!-- Chinhsualopthi_form -->
						<div class="tab-pane fade" id="FormChinhSuaLopThi"
							style="padding-top: 100px;">
							<form id="FormChinhSuaLopThi11" action="SuaLopThi" method="post">
								<p
									style="background: #E6E6FA; padding: 10px 10px; width: 200px; color: blue;">Chỉnh
									sửa lớp thi:</p>
								<div id="formTaoLichThiChinhSua">
								
									<div class="row" style="padding-top: 15px;">

										<div class="col-sm-2" style="text-align: right; padding-top: 6px;">
											<label class="control-label">Id Lớp thi:</label>
										</div>
										<div class="col-sm-3">
											<input type="text"  class="form-control" id="idLopThi"
												name="idLopThi" readonly="readonly"></input>
										</div>
										<div class="col-sm-2"
											style="text-align: right; padding-top: 6px;">
											<label class="control-label">Mã đề thi:</label>
										</div>
										<div class="col-sm-3">
											<input type="text" class="form-control" id="MaDeThiChinhSua"
												name="MaDeThiChinhSua" value=""></input>
										</div>


									</div>
									<div class="row" style="padding-top: 15px;">
										<div class="col-sm-2 "
											style="text-align: right; padding-top: 6px;">
											<label class="control-label">Phòng thi:</label>
										</div>
										<div class="col-sm-3">
											<input name="Name_NhapTenPhongThiChinhSua"
												ng-model="Model_NhapTenPhongThiChinhSua"
												class="form-control " id="NhapTenPhongThiChinhSua" required></input>
											<span class="ChuaNhapValue"
												ng-show="FormChinhSuaLopThi.Name_NhapTenPhongThiChinhSua.$touched && FormChinhSuaLopThi.Name_NhapTenPhongThiChinhSua.$invalid">Chưa
												nhập tên phòng</span>
										</div>
										<div class="col-sm-2"
											style="text-align: right; padding-top: 6px;">
											<label class="control-label">Nhập ngày thi:</label>
										</div>
										<div class="col-sm-3">
											<input id="NhapNgayThiChinhSua" type="date"
												class="form-control" name="NhapNgayThiChinhSua"></input>
										</div>
									</div>
									<div class="row" style="padding-top: 15px;">

										<div class="col-sm-2" style="text-align: right; padding-top: 6px;">
											<label class="control-label">Giờ thi:</label>
										</div>
										<div class="col-sm-3">
											<input id="NhapGioBatDauThiChinhSua" type="time"
												class="form-control" name="NhapGioBatDauThiChinhSua">
											</input>
										</div>

										<div class="col-sm-2" style="text-align: right; padding-top: 6px;">
											<label class="control-label">Giờ kết thúc:</label>
										</div>	
										<div  class="col-sm-3">
											<input id="NhapGioKetThucThiChinhSua" name="NhapGioKetThucThiChinhSua"
												type="time" class="form-control"></input> 
										</div>
									</div>
									<div class="form-inline col-md-offset-6"
										style="padding-bottom: 30px; padding-top: 30px;">
										<div class="form-group">
											<a class="btn btn-primary" href="#lopthi" data-toggle="tab" id="quaylai">Quay lại</a>
											<button class="btn btn-success" onclick="return confirm('Bạn thật sự muốn lưu?')" id="suathanhcong">Lưu thay đổi</button>
										</div>
									</div>
								</div>
							</form>
						</div>
						
						<!-- LayMaDeTaoLop_Script -->
						<script type="text/javascript">
							$(document).ready(function(){
								$('.editTaoLop').click(function(){
									var MaDe = $(this).attr("data-id");
								 	$('#MaDeThi').attr('value',MaDe); 
								});
							});
						</script>
						
						<div class="tab-pane fade " id="taolopthi">
							<div id="caibangnguoiquantrikythi">
								<p
									style="background: red; width: 390px; padding: 10px 10px; color: white;">Danh
									sách những đề cần cấp ngày thi</p>

								<form class="form-inline"
									style="background: #E6E6FA; padding: 20px 20px; color: blue;">

									<div class="form-group col-md-offset-0">
										<div class="form-group">
											<label class="control-label">Tìm kiếm theo:</label> <select
												class="form-control" id="LoaiTimKiem1" name="LoaiTimKiem1">
												<option value="0">Mã đề</option>
												<option value="1">Môn học</option>
												<option value="2">Số câu</option>
												<option value="3">Thời gian</option>
												<option value="4">Ngày ra</option>
											</select>
										</div>
									</div>

									<div class="form-group col-md-offset-1">
										<div class="input-group">
											<input type="text" id="NhapTuKhoa1" class="form-control"
												onkeyup="myFunction()" placeholder="Tìm kiếm..."></input> <SPAN
												class="input-group-btn" style="border: white;"><img
												src="img/Searchicon.png" height="20px" width="20px"></img></SPAN>
										</div>
									</div>
								</form>

								<!-- TimKiemTable_Script -->
								<script type="text/javascript">
									function myFunction() {
										// Declare variables 
										var input, filter, table, tr, td, i;
										input = document
												.getElementById("NhapTuKhoa1");
										filter = input.value.toUpperCase();
										table = document
												.getElementById("tableDeThi");
										tr = table.getElementsByTagName("tr");

										// Loop through all table rows, and hide those who don't match the search query
										for (i = 0; i < tr.length; i++) {
											td = tr[i]
													.getElementsByTagName("td")[$(
													'#LoaiTimKiem1').val()];
											if (td) {
												if (td.innerHTML.toUpperCase()
														.indexOf(filter) > -1) {
													tr[i].style.display = "";
												} else {
													tr[i].style.display = "none";
												}
											}
										}
									}
								</script>

								<table style="background: #E6E6FA"
									class="table table-hover table-striped" id="tableDeThi">
									<thead>
										<tr>
											<th>Mã đề</th>
											<th>Môn học</th>
											<th>Số câu</th>
											<th>Thời gian</th>
											<th>Ngày ra đề</th>
											<th>Tạo đề</th>
										</tr>
									</thead>

									<sql:query var="BangDeThi" dataSource="${data }"> select * from BangDeThi_view order by NgayRaDe DESC </sql:query>

									<tbody>
										<c:forEach var="row" items="${BangDeThi.rows }">
											<tr>
												<td>${row.MaDe }</td>
												<td>${row.TenMon }</td>
												<td>${row.TongSoCau }</td>
												<td>${row.ThoiGian }</td>
												<td>${row.NgayRaDe }</td>
												<td><a href="#" class="editTaoLop" data-toggle="modal" data-target="#chitietMoLopThi" data-id="${row.MaDe }"
													onclick=""><img src="img/them.png"
														height="20px" width="20px"></img></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<br></br>
					
							<!-- TaoLopThi -->
							<div class="modal fade" id="chitietMoLopThi" role="dialog">
								<div class="modal-dialog">
									<div class="modal-content">

										<form name="FormCapNgayThi" action="TaoLopThi" method="post">
											<div id="formTaoLichThi" style="padding: 20px 20px;">
												
												<div class="form-inline" style="text-align: center;">
													<label class="control-label">Mở lớp thi</label>	
												</div>
												
												<div class="row" style="padding-top: 30px">
													<div class="col-sm-2 col-sm-offset-2">
														<label class="control-label">Mã đề thi:</label> 
													</div>
													<div class="col-sm-5">	
														<input
															type="text" class="form-control" id="MaDeThi"
															name="txtMaDeTao" value="" readonly></input>
													</div>
												</div>
												
												<div class="row" style="padding-top: 15px">
													<div class="col-sm-3 col-sm-offset-1">
														<label class="control-label">Phòng thi:</label>
													</div>
													<div class="col-sm-5">
														<input name="Name_NhapTenPhongThi"
															ng-model="Model_NhapTenPhongThi" class="form-control "
															id="NhapTenPhongThi" required></input>

														<div class="row">
															<span class="ChuaNhapValue"
																ng-show="FormCapNgayThi.Name_NhapTenPhongThi.$touched && FormCapNgayThi.Name_NhapTenPhongThi.$invalid">Chưa
																nhập tên phòng</span>
														</div>
													</div>
												</div>
												
												<div class="row" style="padding-top: 15px;">
													<div class="col-sm-3 col-sm-offset-1" id="datepicker"
														style="padding-right: 20px;">
														<label class="control-label">Ngày thi:</label>
													</div>
													<div class="col-sm-5">
														 <input name="NhapNgayThi"
														 id="NhapNgayThi" type="date"
															class="form-control" required>
														<span
															class="add-on">
														</span>


													</div>
												</div>
												<div class="row"  style="padding-top: 15px;">	
													<div class="col-sm-3 col-sm-offset-1" id="timepicker"
														style="padding-right: 20px;">
														<label class="control-label">Giờ thi:</label> 
													</div>
													<div class="col-sm-5">		
															<input name="NhapGioThi"
															type="time" id="time" onclick="" placeholder="Nhập giờ..." class="form-control" required>
												
													</div>
												</div>
												
												<div class="row"  style="padding-top: 15px;">	
													<div class="col-sm-3 col-sm-offset-1" id="timepicker1"
														style="padding-right: 20px;">
														<label class="control-label">Giờ kết thúc:</label> 
													</div>
													<div class="col-sm-5">		
															<input name="NhapGioKetThuc"
															type="time" id="gioKetThuc" placeholder="Nhập giờ..." class="form-control" required>
													
													</div>
												</div>
												<div class="form-inline col-md-offset-7"
													style="padding-bottom: 30px; padding-top: 30px;">
													<div class="form-group">
														<a id="huybo" class="btn btn-primary" data-dismiss="modal">Hủy bỏ</a>
														<input type="submit" value="Thêm" id="hoanthanhTaoThi" class="btn btn-success"></input>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

						</div>
						
					</div>
				</div>
				
				<!-- ThongBao_Form -->
				<div class="tab-pane fade" id="ThongBao">
					<div class="container">
						<ul class="nav navbar-nav danhsach2">
							<li><a href="#thongbaodagui" data-toggle="tab"><img
									src="img/danhsach.png" height="40px" width="40px"></img>Thông
										báo đã gửi</a></li>
							<li><a href="#vietthongbao" data-toggle="tab"><img
									src="img/them.png" height="40px" width="40px"></img>Viết thông
										báo</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="thongbaodagui">
							<div id="caibangnguoiquantrikythi">
								<table style="background: #E6E6FA"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th>Tiêu đề</th>
											<th>Gửi đến HP</th>
											<th>Thời gian gửi</th>
											<th>chi tiết</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<sql:query var="BangThongBao" dataSource="${data }"> select * from BangThongBao_QTKT where MaNguoiGui = '<%= sess.getAttribute("taikhoan")%>'  </sql:query>
									<tbody>
									<c:forEach var = "row" items="${ BangThongBao.rows}">
										<tr>
											<td>${row.TieuDe }</td>
											<td>${row.MaHocPhan }</td>
											<td>${row.ThoiGian }</td>
											<td><a href="#" data-toggle="modal" data-id ="${row.MaTB }" data-target="#XemChiTietThongBao" id="ChiTiet" class="ChiTietTB">chi
													tiết</a></td>
											<td><a href="#" id="xoathongbao"><img
													src="img/xoa.png" height="20px" width="20px"></img></a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<SCRIPT type="text/javascript">
							$(document).ready(function(){
								$(".ChiTietTB").click(function(){
									var MaTB = $(this).attr("data-id");
									$.get('XemChiTietThongBao',{MaTB : MaTB},function(resp){
										$("#NoiDungTB").text(resp.ChiTietTB);
									});
								});
							});
						</SCRIPT>
						
						
						<div class="tab-pane fade" id="vietthongbao">
							<form action="ThemThongBao" method="post">
								<div class="form-group">
									<label for="tieude">Gửi đến(Mã học phần)</label> 
									<input class="form-control" type="text" name="txtLopTB"></input>
									<input type="text" hidden="" name="txtMaNguoiGui" value="<%= sess.getAttribute("taikhoan")%>"></input>
								</div>

								<div class="form-group">
									<label for="tieude">Tiêu đề</label> <input type="text"
										class="form-control" name="txttieude" id="tieude" placeholder="tiêu đề..."></input>
								</div>
								<div class="form-group ">
									<label for="noidung">nội dung</label>
									<textarea type="text" class="form-control" id="noidung" name="txtnoidung"
										rows="7"> </textarea>
								</div>

								<input type="submit" class="btn-success btn-lg" value="Gửi đi"></input>

							</form>
						</div>
					</div>
				</div>
				
				<div class=" tab-pane fade" id="thongtincanhan"
					style="font-size: 16px;">
					<div class="col-md-5 ">
						<div class=" panel panel-info ">
							<div class="panel-heading">Thông tin cá nhân</div>
							<div class="panel-body">
								<ul>
								<c:forEach var="row" items="${result.rows }">
									<ul class="list-inline">
										<li style="width: 200px;">Mã tài khoản</li>
										<li>: <c:out value="${row.MaTK }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Họ tên</li>
										<li>: <c:out value="${row.TenNguoiDung }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Ngày sinh</li>
										<li>: <c:out value="${row.NgaySinh }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Giới tính</li>
										<li>: <c:choose> <c:when test="${row.GioiTinh == true }"> Nam </c:when> <c:otherwise> Nữ </c:otherwise> </c:choose></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Dân tộc</li>
										<li>: <c:out value="${row.DanToc }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Số CMND</li>
										<li>: <c:out value="${row.SoCMND }"></c:out></li>
									</ul>
									
									<ul class="list-inline">
										<li style="width: 200px;">Thành phố</li>
										<li>: <c:out value="${row.TenTP }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Quốc gia</li>
										<li>: <c:out value="${row.TenQG }"></c:out></li>
									</ul>
										
									<ul class="list-inline">
										<li style="width: 200px;">Loại công viêc</li>
										<li>: <c:out value="${row.TenLoaiCV }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Tình trạng công việc</li>
										<li>: <c:out value="${row.TenTinhTrang }"></c:out></li>
									</ul>
							</c:forEach>
								</ul>
							</div>
						</div>
						
						<div class=" panel panel-info ">
							<div class="panel-heading">Thông tin ngành tham gia</div>
							<div class="panel-body">
							<c:forEach var="row" items="${result.rows }">
								<ul>
									<ul class="list-inline">
										<li style="width: 150px;">Mã Nhành</li>
										<li>: <c:out value="${row.MaKhoa }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 150px;">Tên Ngành</li>
										<li>: <c:out value="${row.TenKhoa }"></c:out></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 150px">Chức vụ</li>
										<li>: <c:out value="${row.TenChucVu }"></c:out></li>
									</ul>
	
							</c:forEach>
								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-md-offset-1">
						<div
							style="width: 146px; border-style: dashed; border-color: blue;"
							class="col-md-offset-4">
							<img src="LoadHinhAnh?id=<%= sess.getAttribute("taikhoan") %>" alt="Ảnh cá nhân" height="200px" width="140px">
						</div>
						<br> <br> <br>
									<div class=" panel panel-danger ">
										<div class="panel-heading">Thông tin liên lạc</div>
										<div class="panel-body">
											<ul>
												<ul class="list-inline">
													<li style="width: 90px;">Điện thoại</li>
													<li>: <c:forEach var="row" items="${result.rows }"> <c:out value="${row.SDT }"></c:out> </c:forEach></li>
												</ul>
												<ul class="list-inline">
													<li style="width: 90px;">Email</li>
													<li>: <c:forEach var="row" items="${result.rows }"> <c:out value="${row.Email }"></c:out> </c:forEach></li>
												</ul>
												<ul class="list-inline">
													<li style="width: 90px">Địa chỉ</li>
													<li>: <c:forEach var="row" items="${result.rows }"> <c:out value="${row.DiaChi }"></c:out> </c:forEach></li>
												</ul>
											</ul>
										</div>
									</div>
					</div>
				</div>
				<!-- thongtincanhan -->
			</div>
		</div>
	</div>
	<!-- contenter -->
	<div style="padding-bottom: 60px">.</div>
	<footer id="footer" class="navbar-fixed-bottom">
	Copyright@TracNghiemOnline.com.vn </footer>
	<!-- footer -->
	
	
	<div class="modal fade" id="XemChiTietThongBao" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p id="TieuDeTP">Nội dung thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2 id="NoiDungTB"></h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="FormDoiMatKhau">
					<div class="modal-header text-center">

						<h2>
							<img src="img/key.png" height="60px" width="60px"></img>Đổi mật
								khẩu
						</h2>
					</div>
					<div class="modal-body "
						style="padding: 20px 20px; background: #E6E6FA;">
						<div class="form-group">
							<label>Nhập mật khẩu cũ: </label> <input name="NhapMatKhauCu"
								size="60px" ng-model="NhapMatKhauCu" type="password"
								class="form-control " required></input> <span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauCu.$touched && FormDoiMatKhau.NhapMatKhauCu.$invalid">Chưa
									nhập mật khẩu cũ</span>
						</div>

						<div class="form-group">
							<label>Nhập mật khẩu mới: </label> <input name="NhapMatKhauMoi"
								size="60px" ng-model="NhapMatKhauMoi" type="password"
								class="form-control " required></input> <span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauMoi.$touched && FormDoiMatKhau.NhapMatKhauMoi.$invalid">Chưa
									nhập mật khẩu mới</span>
						</div>

						<div class="form-group">
							<label>Nhập lại mật khẩu mới: </label> <input type="password"
								size="60px" class="form-control" name="NhapMatKhauMoi1"
								ng-model="NhapMatKhauMoi1" required> </input><span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauMoi1.$touched && FormDoiMatKhau.NhapMatKhauMoi1.$invalid">Chưa
									nhập lại mật khẩu mới</span>
						</div>


					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button id="thanhcong" class="btn btn-success"
							data-dismiss="modal">OK</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Đổi mật khẩu thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-body">
					<p>Thông báo</p>
				</div>
				<div class="modal-header text-center">
					<h2>Đã thêm thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal3" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Bạn có chắc chắn gửi không?</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-lg"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-success btn-lg"
						id="ChacChanGui" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal5" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Sửa thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal6" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header ">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Bạn có chắc chắn xóa không ?</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger btn-lg"
						data-dismiss="modal">Cancel</button>
					<button type="button" id="xoathanhcong"
						class="btn btn-success btn-lg" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="modal fade" id="myModal7" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header ">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">

					<h2>Xóa thành công</h2>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal8" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Đã gửi thành công thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<script>
     $(document).ready(function(){
          $("#DoiMatKhau").click(function(){
            $("#myModal").modal({backdrop:"static"});
          });
          $("#DoiMatKhauThanhCong").click(function(){
            $("#myModal1").modal({backdrop:true});
          });
           $("#hoanthanh").click(function(){
            $("#myModal2").modal({backdrop:true});
         
          });
            $("#guithanhcong").click(function(){
            $("#myModal3").modal({backdrop:true});
          });
              $("#chinhsua").click(function(){
            $("#myModal4").modal({backdrop:"static"});
          });
              $("#suathanhcong").click(function(){
            $("#myModal5").modal({backdrop:true});
          });
           $("#xoalopthi,#xoathongbao").click(function(){
            $("#myModal6").modal({backdrop:true});
          });
             $("#xoalichthi").click(function(){
            $("#myModal6").modal({backdrop:true});
          });
            $("#xoathanhcong").click(function(){
            $("#myModal7").modal({backdrop:true});
          });
             $("#ChacChanGui").click(function(){
            $("#myModal8").modal({backdrop:true});
          });
              $("#ChiTiet").click(function(){
            $("#XemChiTietThongBao").modal({backdrop:true});
          });
     });

		
	</script>
<!-- 	<script type="text/javascript">
	
	
		
				var timepicker = new TimePicker('#time', {
					lang : 'en',
					theme : 'dark'
				});
				
				timepicker.change(function(evt) {

					var value = (evt.hour || '00') + ':' + (evt.minute || '00');
					evt.element.value = value;

				});
				
				
	</script>
	<SCRIPT type="text/javascript">
	var time = new TimePicker('#gioKetThuc',{
		lang : 'en',
		theme : 'dark'
	});
	time.change(function(ev){
		var val =(ev.hour|| '00') + ':' + (ev.minute || '00');
		
		ev.element.value = val;
	});
	</SCRIPT>
 -->
		
</body>
</html>