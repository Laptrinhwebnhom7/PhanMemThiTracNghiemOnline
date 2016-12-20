<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>
<title>nguoiradethi</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"></link>
<link rel="stylesheet" hreflang="WebContent/css/jquery-ui.css"></link>
<link rel="stylesheet" href="/resources/demos/style.css"></link>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="WebContent/js/jquery-ui.js"></script>

<script type="text/javascript" lang="javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js">
  </script>
  
</head>
<body ng-app="">

	<%
		HttpSession sess = request.getSession(false);
	%>
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline" user="root"
		password="trungdung29" />
	<sql:query var="result" dataSource="${data}">  select  * from ThongTin_TatCaUser_View where MaTK = '<%=sess.getAttribute("taikhoan")%>' </sql:query>

	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="background-image: url(img/hinhHeader.png); background-repeat: no-repeat; background-size: 100% auto;">
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
										id="myNopBai"><strong>Đổi mật khẩu</strong></a></li>
									<li><a href="index.jsp"><strong>Đăng xuất</strong></a></li>
								</ul>
								<span> <c:forEach var="row" items="${result.rows }">
										<c:out value="${row.TenNguoiDung }"></c:out>
									</c:forEach>
								</span>
							</div>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>
	</div>
	<!-- header -->
	<br></br>
	<div id="content">
		<div class="jumbotron">

			<div class="col-md-2 danhsach">
				<ul class="nav  nav-stacked ">
					<li class="active"><a href="#soandethi" data-toggle="tab"><img
							src="img/soan-lambaithi.png" height="40px" width="40px"></img>
							Soạn đề thi</a></li>
					<li><a href="#thongtincanhan" data-toggle="tab"><img
							src="img/thongtincanhan.png" height="40px" width="40px"></img>
							Thông tin cá nhân</a></li>
				</ul>
			</div>
			<div class=" tab-content col-md-10  danhsach1">
				<div class="tab-pane fade in active" id="soandethi">
					<div class="container">
						<ul class="nav navbar-nav danhsach2">
							<li class="active"><a href="#dethi" data-toggle="tab"><img
									src="img/danhsach.png" height="40px" width="40px"></img> Danh
									sách đề thi</a></li>
							<li><a href="#taodethi" data-toggle="tab"><img
									src="img/them.png" height="40px" width="40px"></img> Tạo đề thi</a></li>
						</ul>
					</div>

					
					

					<!-- BangDeThi_form -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="dethi" style="padding-top: 30px">
							<div class="container">
								<form class="form-inline"
									style="background: #E6E6FA; padding: 20px 20px; color: blue;">

									<div class="form-group col-md-offset-0">
										<div class="form-group">
											<label class="control-label">Tìm kiếm theo:</label> <select
												class="form-control" id="LoaiTimKiem" name="LoaiTimKiem">
												<option value="0">Mã đề</option>
												<option value="1">Môn học</option>
												<option value="2">Số câu</option>
												<option value="3">Thời gian</option>
												<option value="4">Số đề con</option>
												<option value="5">Ngày ra</option>
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
							</div>
							
							
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

							
							<div id="caibangnguoiradethi" style="overflow-x: auto;">
								<table style="background: #E6E6FA"
									class="table table-hover table-striped" id="myTable">
									<thead>
										<tr>
											<th>Mã đề chính</th>
											<th>Môn học</th>
											<th>Số câu</th>
											<th>Thời gian</th>
											<th>Số đề con</th>
											<th>Ngày ra</th>
											<th>Nội Dung</th>
											<th>Chỉnh sửa</th>
											<th>Xóa</th>
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
												<td>${row.SoLuongMaDePhatSinh }</td>
												<td>${row.NgayRaDe }</td>
												<td><a href="NoiDungDe.jsp?id=${row.MaDe }" class="btn btn-link">Chi tiết</a></td>
												<td><a href="#" data-id="${row.MaDe }" class="editDeThi" data-toggle="tab" data-target="#ChinhSuaDeThi"><img
														src="img/sua.png" height="20px" width="20px"></img> </a></td>
												<td><a href="XoaDeThi?id=${row.MaDe }" id="" onclick="return confirm('Bạn thật sự muốn xóa?')"><img
														src="img/xoa.png" height="20px" width="20px"></img> </a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>


						<!-- DropdownList_ChinhSua_KHOA_BOMON_MON_LOP_CHUDE_Script start -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {
							$('#ChonKhoaSua').change(function(event) {
								var Khoa = $("select#ChonKhoaSua").val();
								$.get('Json_Khoa_BoMon',
								{
									MaKhoa : Khoa},function(response) {
										var select = $('#ChonBoMonSua');
										select.find('option').remove();
										$.each(response,function(key,value) {
											$('<option>').val(key).text(value).appendTo(select);
											var BoMon = $("select#ChonBoMonSua").val();
											$.get('Json_BoMon_Mon',{MaBoMon : BoMon},function(response) {
												var select1 = $('#ChonMonSua');
												select1.find('option').remove();
												$.each(response,function(key,value) {
													$('<option>').val(key).text(value).appendTo(select1);
													var Mon = $("select#ChonMonSua").val();
													$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
														var select1 = $('#ChonLopSua');
														select1.find('option').remove();
														$.each(response,function(key,value) {
															$('<option>').val(key).text(value).appendTo(select1);
															});
														});
													});
												});
											});
										});
								});
							$('#ChonBoMonSua').change(function(event) {
								var BoMon = $("select#ChonBoMonSua").val();
								$.get('Json_BoMon_Mon',{MaBoMon : BoMon},function(response) {
									var select1 = $('#ChonMonSua');
									select1.find('option').remove();
									$.each(response,function(key,value) {$('<option>').val(key).text(value).appendTo(select1);
									var Mon = $("select#ChonMonSua").val();
									$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
										var select1 = $('#ChonLopSua');
										select1.find('option').remove();
										$.each(response,function(key,value) {
											$('<option>').val(key).text(value).appendTo(select1);
											});
										});
									});
									});
								});
							$('#ChonMonSua').change(function(event) {
								var Mon = $("select#ChonMonSua").val();
								$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
									var select1 = $('#ChonLopSua');
									select1.find('option').remove();
									$.each(response,function(key,value) {
										$('<option>').val(key).text(value).appendTo(select1);
										});
									});
								});
							});
						</SCRIPT>
						<!-- DropdownList_ChinhSua_KHOA_BOMON_MON_LOP_CHUDE_Script end -->


						<!-- ChonLopThiChinhSua_Script -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {$('#ChonLopSua').click(function() {
								var currentVal = $('#ChonLopSua').val();
								$('<option>').val(currentVal).text(currentVal).appendTo('#DanhSachLopSua');
								});
							$('#DanhSachLopSua').click(function() {
								var currentVal = $('#DanhSachLopSua option:selected');
								currentVal.remove();
								/* $('#DanhSachLop').find('option[value='+currentVal+']').remove(); */
								});
							$('#ChonHetDSLopSua').click(function() {
								$('#DanhSachLopSua option').each(function() {
									$(this).attr('selected',true);
									});
								});
							});
						</SCRIPT>
						
							<!-- Chinhsuade_script -->
							<SCRIPT type="text/javascript">
								$(document).ready(function(){
									$('.editDeThi').click(function(){
										var MaDe = $(this).attr('data-id');	
										$("#txtMaDeSua").attr("value",MaDe);
										$.post('LayLopThiChinhSua',{MaDe : MaDe},function(response){
											$.each(response,function(key,value){
												$('<option>').val(key).text(value).appendTo('#DanhSachLopSua');	
											});
										});
										$.post('Json_LayTTDeThi',{MaDe:MaDe},function(response){
											
											$("#selThoiGianSua").attr("selected",false);
											$("#selThoiGianSua").find('option[value='+response.ThoiGian+']').attr("selected",true);
										});
										/* $('#DanhSachLop').find('option[value='+currentVal+']').remove(); */
									});
								});
							</SCRIPT>
						
						<!-- Chinhsuadethi_form -->
						<div class="tab-pane fade " id="ChinhSuaDeThi">
							<form name="FormChinhSuaDeThi_ALL" action="SuaDSLopThi" method="post">
								<div class="row" style="padding-left: 15px">
									<div id="formChonDanhSachLopThi" class="col-sm-3"
										style="background: #E6E6FA;padding-top: 15px; color: #0000CC">
										<label class="control-label">Chỉnh sửa đề thi</label>
									</div>
								</div>
								<div  id="formChonDanhSachLopThi"
									style="background: #E6E6FA;  color: #0000CC">
									
									<div class="col-sm-offset-1">
									<sql:query var="Khoa" dataSource="${data }"> select MaKhoa,TenKhoa from Khoa_Nganh where MaKhoa != -1 </sql:query>

										<div class="row" style="padding-top: 20px;">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Mã đề:</label>
											</div>

											<div class="col-sm-4">
												<input name="txtMaDeSua" id= "txtMaDeSua" type="text" readonly="readonly"
												 value="" class="form-control" style="text-align: center"></input>
											</div>
										</div>
										
										<div class="row" style="padding-top: 10px;">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Thời gian:</label>
											</div>

											<div class="col-sm-4">
												<select name="selThoiGianSua" id= "selThoiGianSua" 
												class="form-control">
													<option value="45">45</option>
													<option value="60">60</option>
													<option value="90">90</option>
												</select>
											</div>
										</div>
										
										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Khoa:</label>
											</div>
											
											<div class="col-sm-4">
												<select class="form-control" id="ChonKhoaSua">
													<option value="-1">Chọn khoa</option>
													<c:forEach var="row" items="${Khoa.rows}">
														<option value="${row.MaKhoa }"><c:out
																value="${row.TenKhoa }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Bộ môn:</label>
											</div>
											<div class="col-sm-4">
												<select class="form-control" id="ChonBoMonSua">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>


										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Môn học:</label>
											</div>
											<div class="col-sm-4 ">
												<select class="form-control" id="ChonMonSua" name="selChonMon">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Chọn lớp thi:</label>
											</div>
											<div class="col-sm-4">
												<select multiple size="4" class="form-control" id="ChonLopSua"
													name="selChonLopSua">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label for="formDanhSachLopDaChon">Danh sách đã chọn:</label>
											</div>
											<div class="col-sm-4 ">
												<select multiple size="4" class="form-control"
													id="DanhSachLopSua" name="selDanhSachLopSua">
												</select>

											</div>
										</div>
										<div class="row">
											<div class="col-sm-4 col-sm-offset-2"
												style="text-align: center;">
												<a id="ChonHetDSLopSua" class="btn btn-default">Chọn hết
													danh sách</a>
											</div>
										</div>
									</div>

								</div>

								<div class="form-group"
									style="background: #E6E6FA; padding: 25px 25px; color: #0000CC">
									<div class="form-inline col-sm-offset-4">
										<a class="btn btn-primary" type="button" id="huybo"
											data-toggle="tab" data-target="#dethi"
											onclick="resetFunction()">quay lại</a> <input type="submit"
											value="Lưu thay đổi" class="btn btn-success" id="LuuThayDoi"></input>
									</div>
								</div>
							</form>
						</div>

						<!-- DropdownList_KHOA_BOMON_MON_LOP_CHUDE_Script start -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {
							$('#ChonKhoa').change(function(event) {
								var Khoa = $("select#ChonKhoa").val();
								$.get('Json_Khoa_BoMon',
								{
									MaKhoa : Khoa},function(response) {
										var select = $('#ChonBoMon');
										select.find('option').remove();
										$.each(response,function(key,value) {
											$('<option>').val(key).text(value).appendTo(select);
											var BoMon = $("select#ChonBoMon").val();
											$.get('Json_BoMon_Mon',{MaBoMon : BoMon},function(response) {
												var select1 = $('#ChonMon');
												select1.find('option').remove();
												$.each(response,function(key,value) {
													$('<option>').val(key).text(value).appendTo(select1);
													var Mon = $("select#ChonMon").val();
													$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
														var select1 = $('#ChonLop');
														select1.find('option').remove();
														$.each(response,function(key,value) {
															$('<option>').val(key).text(value).appendTo(select1);
															});
														});
													$.get('Json_Mon_ChuDe',{MaMon : Mon},function(response) {
														var select2 = $('#ChonCD1');
														select2.find('option').remove();
														$.each(response,function(key,value) {
															$('<option>').val(key).text(value).appendTo(select2);
															var select3 = $('#ChonCD2');
															select3.find('option').remove();
															$.each(response,function(key,value) {
																$('<option>').val(key).text(value).appendTo(select3);
																});
															var select4 = $('#ChonCD3');
															select4.find('option').remove();
															$.each(response,function(key,value) {
																$('<option>').val(key).text(value).appendTo(select4);
																});
															});
														});
													});
												});
											});
										});
								});
							$('#ChonBoMon').change(function(event) {
								var BoMon = $("select#ChonBoMon").val();
								$.get('Json_BoMon_Mon',{MaBoMon : BoMon},function(response) {
									var select1 = $('#ChonMon');
									select1.find('option').remove();
									$.each(response,function(key,value) {$('<option>').val(key).text(value).appendTo(select1);
									var Mon = $("select#ChonMon").val();
									$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
										var select1 = $('#ChonLop');
										select1.find('option').remove();
										$.each(response,function(key,value) {
											$('<option>').val(key).text(value).appendTo(select1);
											});
										});
									$.get('Json_Mon_ChuDe',{MaMon : Mon},function(response) {
										var select2 = $('#ChonCD1');
										select2.find('option').remove();
										$.each(response,function(key,value) {
											$('<option>').val(key).text(value).appendTo(select2);
											var select3 = $('#ChonCD2');
											select3.find('option').remove();
											$.each(response,function(key,value) {
												$('<option>').val(key).text(value).appendTo(select3);
												});
											var select4 = $('#ChonCD3');
											select4.find('option').remove();
											$.each(response,function(key,value) {
												$('<option>').val(key).text(value).appendTo(select4);
												});
											});
										});
									});
									});
								});
							$('#ChonMon').change(function(event) {
								var Mon = $("select#ChonMon").val();
								$.get('Json_Mob_HocPhan',{MaMon : Mon},function(response) {
									var select1 = $('#ChonLop');
									select1.find('option').remove();
									$.each(response,function(key,value) {
										$('<option>').val(key).text(value).appendTo(select1);
										});
									});
								});
							$('#ChonMon').change(function() {
								var Mon = $('select#ChonMon').val();
								$.get('Json_Mon_ChuDe',{MaMon : Mon},function(response) {
									var select2 = $('#ChonCD1');
									select2.find('option').remove();
									$.each(response,function(key,value) {
										$('<option>').val(key).text(value).appendTo(select2);});
									var select3 = $('#ChonCD2');
									select3.find('option').remove();
									$.each(response,function(key,value) {
										$('<option>').val(key).text(value).appendTo(select3);
										});
									var select4 = $('#ChonCD3');
									select4.find('option').remove();
									$.each(response,function(key,value) {
										$('<option>').val(key).text(value).appendTo(select4);
										});
									});
								});
							});
						</SCRIPT>
						<!-- DropdownList_KHOA_BOMON_MON_LOP_CHUDE_Script end -->


						<!-- ChonLopTHi_Script -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {$('#ChonLop').click(function() {
								var currentVal = $('#ChonLop').val();
								$('<option>').val(currentVal).text(currentVal).appendTo('#DanhSachLop');
								});
							$('#DanhSachLop').click(function() {
								var currentVal = $('#DanhSachLop option:selected');
								currentVal.remove();
								/* $('#DanhSachLop').find('option[value='+currentVal+']').remove(); */
								});
							$('#ChonHetDSLop').click(function() {
								$('#DanhSachLop option').each(function() {
									$(this).attr('selected',true);
									});
								});
							});
						</SCRIPT>

						<!-- XacDinhSocauchon/tongcau -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {
								var TongCau = $('#formTongSoCauHoi').val();
								$('#txtTongSoCau').attr('value', TongCau);
								$('#formTongSoCauHoi').change(function() {
									TongCau = $('#formTongSoCauHoi option:selected').val()
									$('#txtTongSoCau').attr('value',TongCau);
									});
								var temp1 = 0, temp2 = 0, temp3 = 0, Tong = 0;
								$('#SoCauDaChon').attr("value",Tong);
								$('#choSC1').blur(function() {
									SC1 = $(this).val();
									if (SC1.trim() == "") {
										SC1 = 0;
										Tong = parseInt(SC1)- parseInt(temp1)+ parseInt(Tong);
										temp1 = parseInt(SC1);
										$('#SoCauDaChon').attr("value",Tong);
										} else {
											Tong = parseInt(SC1)- parseInt(temp1)+ parseInt(Tong);
											temp1 = parseInt(SC1);
											$('#SoCauDaChon').attr("value",Tong);
											}
									});
								$('#choSC2').blur(function() {
									SC2 = $(this).val();
									if (SC2.trim() == "") {
										SC2 = 0;
										Tong = parseInt(SC2)- parseInt(temp2)+ parseInt(Tong);
										temp2 = parseInt(SC2);
										$('#SoCauDaChon').attr("value",Tong);
										} else {
											Tong = parseInt(SC2)- parseInt(temp2)+ parseInt(Tong);
											temp2 = parseInt(SC2);
											$('#SoCauDaChon').attr("value",Tong);
											}});
								$('#choSC3').blur(function() {
									SC3 = $(this).val();
									if (SC3.trim() == "") {
										SC3 = 0;
										Tong = parseInt(SC3)- parseInt(temp3)+ parseInt(Tong);
										temp3 = parseInt(SC3);
										$('#SoCauDaChon').attr("value",Tong);
										} else {
											Tong = parseInt(SC3)- parseInt(temp3)+ parseInt(Tong);
											temp3 = parseInt(SC3);
											$('#SoCauDaChon').attr("value",Tong);
											}});
								});
						</SCRIPT>

						<!-- Autocomplete Text MaDe -->
						<SCRIPT type="text/javascript">
							$(document).ready(function() {
								$("#TenDeChinh").autocomplete({
									minLength : 4,
									source : function(request, response) {
										var $chon = $("#TenDeChinh").val();
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

						<!-- Taodethi_form start -->
						<div class="tab-pane fade " id="taodethi">
							<form name="FormTaoDeThi_ALL" action="TaoDeThi" method="post">
								<div id="formChonDanhSachLopThi"
									style="background: #E6E6FA; padding: 20px 25px; color: #0000CC">

									<sql:query var="Khoa" dataSource="${data }"> select MaKhoa,TenKhoa from Khoa_Nganh where MaKhoa != -1 </sql:query>

									<div class="col-sm-offset-1">
										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Khoa:</label>
											</div>
											<div class="col-sm-4">
												<select class="form-control" id="ChonKhoa">
													<option value="-1">Chọn khoa</option>
													<c:forEach var="row" items="${Khoa.rows}">
														<option value="${row.MaKhoa }"><c:out
																value="${row.TenKhoa }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Bộ môn:</label>
											</div>
											<div class="col-sm-4">
												<select class="form-control" id="ChonBoMon">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>


										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Môn học:</label>
											</div>
											<div class="col-sm-4 ">
												<select class="form-control" id="ChonMon" name="selChonMon">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label class="control-label">Chọn lớp thi:</label>
											</div>
											<div class="col-sm-4">
												<select multiple size="4" class="form-control" id="ChonLop"
													name="selChonLop">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>

										<div class="row" style="padding-top: 10px">
											<div class="col-sm-2"
												style="padding-top: 6px; text-align: right;">
												<label for="formDanhSachLopDaChon">Danh sách:</label>
											</div>
											<div class="col-sm-4 ">
												<select multiple size="4" class="form-control"
													id="DanhSachLop" name="selDanhSachLop">
												</select>
												
											</div>
										</div>
										<div class="row" >
											<div class="col-sm-4 col-sm-offset-2" style="text-align: center;">
												<a id="ChonHetDSLop" class="btn btn-default" >Chọn
													hết danh sách</a>
											</div>
										</div>
									</div>
								</div>


								<div
									style="background: #E6E6FA; padding: 30px 25px 10px 25px; color: #0000CC">
									<div class="col-sm-offset-1">
										<div class="row">
											<div class="col-sm-3">
												<label class="control-label">Nhập mã đề chính</label>
											</div>
											<div class="col-sm-2">
												<label class="control-label">Số câu hỏi</label>
											</div>
											<div class="col-sm-2">
												<label class="control-label">Thời gian</label>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-3">
												<input type="text" class="form-control"
													name="Name_TenDeChinh" id="TenDeChinh"
													ng-model="Model_TenDeChinh" required></input> <span
													class="ChuaNhapValue"
													ng-show="FormTaoDeThi_ALL.Name_TenDeChinh.$touched && FormTaoDeThi_ALL.Name_TenDeChinh.$invalid">Chưa
													nhập mã</span>
											</div>
											<div class="col-sm-2">
												<select class="form-control" id="formTongSoCauHoi"
													name="selTongSoCauHoi">
													<option value="20">20</option>
													<option value="30">30</option>
													<option value="40">40</option>
													<option value="40">50</option>
													<option value="40">60</option>
												</select>
											</div>
											<div class="col-sm-2">
												<select class="form-control" id="formThoiGian"
													name="selThoiGian">
													<option value="45">45</option>
													<option value="60">60</option>
													<option value="90">90</option>
												</select>
											</div>
										</div>
									</div>

								</div>


								<div id="danhsachcauhoi"
									style="background: #E6E6FA; padding: 25px 25px; color: #0000CC">
									<div class="col-sm-offset-1">
										<div class="form-group" style="padding-bottom: 20px;"
											id="formChuDe">

											<div class="row" style="padding-bottom: 10px;">
												<div class="col-sm-3">
													<label class="control-label ">Chọn chủ đề</label>
												</div>
												<div class="col-sm-2">
													<label class="control-label ">Chọn mức độ</label>
												</div>
												<div class="col-sm-2">
													<label class="control-label ">Nhập số câu</label>
												</div>
											</div>

											<div class="row" style="padding-bottom: 10px;">

												<div class="col-sm-3">
													<select class="form-control" style="padding-right: 90px;"
														id="ChonCD1" name="ChonCD1">
														<option value="-1">Chọn</option>
													</select>
												</div>
												<div class="col-sm-2">
													<select class="form-control" id="ChonMD1" name="ChonMD1">
														<OPTION value="1">Dễ</OPTION>
														<OPTION value="2">Trung Bình</OPTION>
														<OPTION value="3">Khó</OPTION>
													</select>
												</div>
												<div class="col-sm-2">
													<input name="choSC1" id="choSC1" type="text"
														ng-model="Model_choSC1" class="form-control" required></input>
												</div>
												<div class="col-sm-2" style="padding-top: 6px">
													<span class="ChuaNhapValue"
														ng-show="FormTaoDeThi_ALL.choSC1.$touched && FormTaoDeThi_ALL.choSC1.$invalid">Chưa
														nhập số</span>
												</div>
											</div>

											<div class="row" style="padding-bottom: 10px;">
												<div class="col-sm-3">
													<select class="form-control" style="padding-right: 90px;"
														id="ChonCD2" name="ChonCD2">
														<option value="-1">Chọn</option>
													</select>
												</div>
												<div class="col-sm-2">
													<select class="form-control" id="ChonMD2" name="ChonMD2">
														<OPTION value="1">Dễ</OPTION>
														<OPTION value="2">Trung Bình</OPTION>
														<OPTION value="3">Khó</OPTION>
													</select>
												</div>
												<div class="col-sm-2">
													<input name="choSC2" id="choSC2" type="text"
														class="form-control" ng-model="Model_choSC2" required></input>
												</div>
												<div class="col-sm-2" style="padding-top: 6px">
													<span class="ChuaNhapValue"
														ng-show="FormTaoDeThi_ALL.choSC2.$touched && FormTaoDeThi_ALL.choSC2.$invalid">Chưa
														nhập số</span>
												</div>
											</div>

											<div class="row">
												<div class="col-sm-3">
													<select class="form-control" style="padding-right: 90px;"
														id="ChonCD3" name="ChonCD3">
														<option value="-1">Chọn</option>
													</select>
												</div>
												<div class="col-sm-2">
													<select class="form-control" id="ChonMD3" name="ChonMD3">
														<OPTION value="1">Dễ</OPTION>
														<OPTION value="2">Trung Bình</OPTION>
														<OPTION value="3">Khó</OPTION>
													</select>
												</div>
												<div class="col-sm-2">
													<input name="choSC3" id="choSC3" type="text"
														class="form-control" ng-model="Model_choSC3" required></input>
												</div>
												<div class="col-sm-2" style="padding-top: 6px">
													<span class="ChuaNhapValue"
														ng-show="FormTaoDeThi_ALL.choSC3.$touched && FormTaoDeThi_ALL.choSC3.$invalid">Chưa
														nhập số</span>
												</div>
											</div>
										</div>

										<div class="form-inline">
											<label class="control-label">Số câu hỏi đã chọn/Tổng
												số:</label> <input
												style="border: 0; text-align: center; color: black;"
												type="text" class="control-label" disabled="disabled"
												id="SoCauDaChon" name="" value="" size="1px"></input>/<input
												style="border: 0; text-align: center; color: black;"
												type="text" disabled="disabled" class="control-label"
												id="txtTongSoCau" name="" value="" size="1px"></input>
										</div>

										<br></br>

										<div class="form-inline">
											<label class="control-label ">Số lượng mã đề thi </label> <input
												type="text" size="3px" class="form-control "
												id="ChonSoLuongDeThi" name="Name_SoLuongMaDeThi"
												ng-model="Model_SoLuongMaDeThi" required></input> <span
												class="ChuaNhapValue"
												ng-show="FormTaoDeThi_ALL.Name_SoLuongMaDeThi.$touched && FormTaoDeThi_ALL.Name_SoLuongMaDeThi.$invalid">Chưa
												nhập số</span>
										</div>
									</div>

									<div class="row col-sm-offset-5">
										<div id="btnChoDanhSachCauHoi" class="form-group"
											style="background: #E6E6FA; padding: 25px 25px; color: #0000CC">
											<input type="button" id="huybo" class="btn btn-primary"
												onclick="resetFunction()" value="Hủy bỏ"></input> <input
												type="submit" value="Hoàn
												tất" id="hoanthanh"
												class="btn btn-success"></input>
										</div>
									</div>

								</div>

							</form>
						</div>
					</div>
				</div>
				<!-- Taodethi_form end -->


				<!-- ThongTinCaNhan_form -->
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
											<li style="width: 200px;">Học tên</li>
											<li>: <c:out value="${row.TenNguoiDung }"></c:out></li>
										</ul>
										<ul class="list-inline">
											<li style="width: 200px;">Ngày sinh</li>
											<li>: <c:out value="${row.NgaySinh }"></c:out></li>
										</ul>
										<ul class="list-inline">
											<li style="width: 200px;">Giới tính</li>
											<li>: <c:choose>
													<c:when test="${row.GioiTinh == true }"> Nam </c:when>
													<c:otherwise> Nữ </c:otherwise>
												</c:choose></li>
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
									</c:forEach>


									<ul class="list-inline">
										<li style="width: 200px;">Loại công viêc</li>
										<li>: <c:forEach var="row" items="${result.rows}">
												<c:out value="${row.TenLoaiCV }"></c:out>
											</c:forEach>
										</li>
									</ul>
									<ul class="list-inline">
										<li style="width: 200px;">Tình trạng công việc</li>
										<li>: <c:forEach var="row" items="${result.rows}">
												<c:out value="${row.TenTinhTrang }"></c:out>
											</c:forEach></li>
									</ul>
								</ul>
							</div>
						</div>
						<div class=" panel panel-info ">
							<div class="panel-heading">Thông tin ngành tham gia</div>
							<div class="panel-body">
								<ul>
									<ul class="list-inline">
										<li style="width: 150px;">Mã Nghành</li>
										<li>: <c:forEach var="row" items="${result.rows}">
												<c:out value="${row.MaKhoa }"></c:out>
											</c:forEach></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 150px;">Tên Ngành</li>
										<li>: <c:forEach var="row" items="${result.rows}">
												<c:out value="${row.TenKhoa }"></c:out>
											</c:forEach></li>
									</ul>

									<ul class="list-inline">
										<li style="width: 150px;">Chức vụ</li>
										<li>: <c:forEach var="row" items="${result.rows}">
												<c:out value="${row.TenChucVu }"></c:out>
											</c:forEach></li>
									</ul>

								</ul>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-md-offset-1">
						<div
							style="width: 146px; border-style: dashed; border-color: blue;"
							class="col-md-offset-4">
							<img src="LoadHinhAnh?id=<%= sess.getAttribute("taikhoan") %>" alt="Ảnh cá nhân" height="200px" width="140px"></img>
						</div>
						<br>
						<br>
						<br>
						<div class=" panel panel-danger ">
							<div class="panel-heading">Thông tin liên lạc</div>
							<div class="panel-body">
								<ul>
									<ul class="list-inline">
										<li style="width: 90px;">Điện thoại</li>
										<li>: <c:forEach var="row" items="${result.rows }">
												<c:out value="${row.SDT }"></c:out>
											</c:forEach>
										</li>
									</ul>
									<ul class="list-inline">
										<li style="width: 90px;">Email</li>
										<li>: <c:forEach var="row" items="${result.rows }">
												<c:out value="${row.Email }"></c:out>
											</c:forEach></li>
									</ul>
									<ul class="list-inline">
										<li style="width: 90px">Địa chỉ</li>
										<li>: <c:forEach var="row" items="${result.rows }">
												<c:out value="${row.DiaChi }"></c:out>
											</c:forEach></li>
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
	<!-- content -->
	<div style="padding-bottom: 60px">.</div>
	<div id="footer" class="navbar-fixed-bottom">
		Copyright@TracNghiemOnline.com.vn</div>
	<!-- footer -->
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
								class="form-control " required></input><span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauCu.$touched && FormDoiMatKhau.NhapMatKhauCu.$invalid">Chưa
								nhập mật khẩu cũ</span>
						</div>

						<div class="form-group">
							<label>Nhập mật khẩu mới: </label> <input name="NhapMatKhauMoi"
								size="60px" ng-model="NhapMatKhauMoi" type="password"
								class="form-control " required></input><span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauMoi.$touched && FormDoiMatKhau.NhapMatKhauMoi.$invalid">Chưa
								nhập mật khẩu mới</span>
						</div>

						<div class="form-group">
							<label>Nhập lại mật khẩu mới: </label> <input type="password"
								size="60px" class="form-control" name="NhapMatKhauMoi1"
								ng-model="NhapMatKhauMoi1" required></input><span
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
					<button class="btn btn-success" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Đã thêm thành công</h2>
				</div>
				<div class="modal-footer">

					<button type="button" id="themdethithanhcong"
						onclick="resetFunction()" class="btn btn-success"
						data-dismiss="modal">OK</button>
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
					<h2>Đã Sửa thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal6" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Bạn có chắc chắn xóa không</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<button type="button" id="xoathanhcong" class="btn btn-success"
						data-dismiss="modal">OK</button>

				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal7" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Đã xóa thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("#myNopBai").click(function() {
				$("#myModal").modal({
					backdrop : true
				});
			});
			$("#thanhcong").click(function() {
				$("#myModal1").modal({
					backdrop : true
				});
			});
			$("#LuuThayDoi").click(function() {
				$("#myModal5").modal({
					backdrop : true
				});
			});
			$("#xoadethi").click(function() {
				$("#myModal6").modal({
					backdrop : true
				});
			});
			$("#xoathanhcong").click(function() {
				$("#myModal7").modal({
					backdrop : true
				});
			});

		});
	</script>
	<script>
		function resetFunction() {
			document.getElementById("formNhapMaDeThi").reset();
		}
	</script>
</body>
</html>