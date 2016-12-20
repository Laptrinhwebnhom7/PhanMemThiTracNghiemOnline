<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.logging.ConsoleHandler"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'>
</meta>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"></meta>

<title>quantringanhangcauhoi</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>
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

	<% HttpSession sess = request.getSession(false); %>
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline" user="root"
		password="trungdung29" />
	<sql:query var="result" dataSource="${data}">  select  * from ThongTin_TatCaUser_View where MaTK  = '<%= sess.getAttribute("taikhoan")%>' </sql:query>

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
								<span><c:forEach var="row" items="${result.rows}">
										<c:out value="${row.TenNguoiDung}"></c:out>
									</c:forEach> </span>
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
				<ul class="nav nav-collapse nav-stacked ">
					<li class="active"><a href="#khocauhoi" data-toggle="tab"><img
							src="img/quanly.png" height="40px" width="40px"></img> Quản lý
							kho câu hỏi</a></li>
					<li><a href="#themcauhoivaokho" data-toggle="tab"><img
							src="img/soan-lambaithi.png" height="40px" width="40px"></img>
							Thêm câu hỏi</a></li>

					<li><a href="#thongtincanhan" data-toggle="tab"><img
							src="img/thongtincanhan.png" height="40px" width="40px"></img>
							Thông tin cá nhân</a></li>

				</ul>
			</div>

			<!-- Khocauhoi -->
			<div class=" tab-content col-md-10 danhsach1 ">
				<div class="tab-pane fade in active" id="khocauhoi">
					<div class="tab-pane fade in active">
						<div class="container">
							<form class="form-inline"
								style="background: #E6E6FA; padding: 20px 20px; color: blue;">

								<div class="form-group col-md-offset-0">
										<div class="form-group">
											<label class="control-label">Tìm kiếm theo:</label> <select
												class="form-control" id="LoaiTimKiem"
												name="LoaiTimKiem">
												<option value="0">Bộ môn</option>
												<option value="1">Môn học</option>
												<option value="2">Chủ đề</option>
												<option value="3">Mã câu hỏi</option>
												<option value="5">Mức độ</option>
												<option value="6">Ngày ra</option>
											</select>
										</div>
								</div>

								<div class="form-group col-md-offset-1">

									<div class="input-group">
										<input type="text" id="NhapTuKhoa" class="form-control" onkeyup="myFunction()" placeholder="Tìm kiếm..."></input>
										<SPAN class="input-group-btn" style=" border: white;  "><img
											src="img/Searchicon.png" height="20px" width="20px"></img></SPAN>
									</div>
								</div>
								
							</form>
						</div>

						<!-- TimKiemCauHoiTheoTuKhoa -->
						<script type="text/javascript">
							function myFunction() {
								// Declare variables 
								var input, filter, table, tr, td, i;
								input = document.getElementById("NhapTuKhoa");
								filter = input.value.toUpperCase();
								table = document.getElementById("myTable");
								tr = table.getElementsByTagName("tr");

								// Loop through all table rows, and hide those who don't match the search query
								for (i = 0; i < tr.length; i++) {
									td = tr[i].getElementsByTagName("td")[$(
											'#LoaiTimKiem').val()];
									if (td) {
										if (td.innerHTML.toUpperCase().indexOf(
												filter) > -1) {
											tr[i].style.display = "";
										} else {
											tr[i].style.display = "none";
										}
									}
								}
							}
						</script>

						<div id="caibangnganhangcauhoi" style="overflow-x:auto;">
							<table style="background: #E6E6FA;"
								class="table table-hover table-striped" id="myTable"  >

								<thead>
									<tr>
										<th>Bộ môn</th>
										<th>Môn học</th>
										<th>Chủ đề</th>
										<th>Mã câu hỏi</th>
										<th>Nội dung câu hỏi</th>
										<th>Mức độ</th>
										<th>Ngày ra câu hỏi</th>
										<th>Chỉnh sửa</th>
										<th>Xóa</th>
									</tr>
								</thead>
								
								<sql:query var="khocauhoi" dataSource="${data }">
								select * from View_XemChiTietCauHoiTheoKhoa_QLKCH_QTCH group by MaCauHoi DESC</sql:query>
								
								<c:forEach var="row" items="${khocauhoi.rows }">
									<tbody>
										<tr>
											<td>${row.TenBoMon }</td>
											<td>${row.TenMon }</td>
											<td>${row.TenChuDe }</td>
											<td >${row.MaCauHoi}</td>
											<td><a data-id="${row.MaCauHoi}" data-toggle="modal" data-target="#chitietcauhoi" style="cursor: pointer" class="detail">Chi
													tiết</a></td>
													
											<td>${row.TenMucDo }</td>
											<td>${row.NgayRa }</td>
											<td><a data-id="${row.MaCauHoi}" style="cursor: pointer" data-toggle="tab" data-target="#ChinhSuaCauHoi" class="edit"><img
													src="img/sua.png" height="20px" width="20px"></img> </a></td>
											<td><a href="XoaCauHoi?id=${row.MaCauHoi}" style="cursor: pointer" onclick="return confirm('Bạn thật sự muốn xóa?')" ><img
													src="img/xoa.png" height="20px" width="20px"></img> </a></td>
										</tr>

									</tbody>
								</c:forEach>
							</table>

						</div>
					</div>
				</div>
				
				<!-- xemchitietcauhoi_Script-->
				<SCRIPT type="text/javascript">
					$(document).ready(function(){
						$('.detail').click(function(){							
							var id = $(this).attr("data-id")
							$.get('XemChiTietCauHoi',{ id : id},function(response){
								$('#NoiDungCau').text( response.NoiDung);
								$('#CauANoiDung').val(response.CauA);
								$('#CauBNoiDung').val(response.CauB);
								$('#CauCNoiDung').val(response.CauC);
								$('#CauDNoiDung').val(response.CauD);
								$('#DapAn').val(response.DapAn);
							});
						});
					});
				</SCRIPT>
				
				<div class="modal fade" id="chitietcauhoi" role="dialog">
					<input type="text" hidden="hidden" class="MaCau" value="55"></input>

					<div class="modal-dialog">

						<div class="modal-content">

							<div class="modal-header">
								<h3>Nội dung chi tiết</h3>
							</div>
							
							<div class="modal-body ">
				
								<div style="padding: 10px 20px; background: #E6E6FA; color: #0000CC;">

										<div class="form-group">
											<label class="control-label">Nội dung câu hỏi</label>
											<textarea id="NoiDungCau" class="form-control" rows="3" readonly="readonly"> </textarea>
										</div>
										
										<div class="form-group">
											<label class="control-label">Câu A:</label> <input id="CauANoiDung"
												type="text" class="form-control" value=""
												readonly="readonly"></input>
										</div>
										<div class="form-group">
											<label class="control-label">Câu B:</label> <input
												id= "CauBNoiDung"type="text" class="form-control" value=""
												readonly="readonly"> </input>
										</div>
										<div class="form-group">
											<label class="control-label">Câu C:</label> <input
												id= "CauCNoiDung" type="text" class="form-control" value=""
												readonly="readonly"></input>
										</div>
										<div class="form-group">
											<label class="control-label">Câu D:</label> <input
												id= "CauDNoiDung" type="text" class="form-control" value=""
												readonly="readonly"></input>
										</div>
										<div class="form-group">
											<label class="control-label">Đáp án:</label> <input
												id= "DapAn" type="text" size="3px;" class="form-control"
												value="" readonly="readonly"></input>
										</div>
									
								
								</div>
								

							</div>

							<div class="modal-footer">
								<button class="btn btn-info" data-dismiss="modal">OK</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- TimMonchinhsua_Script -->				
				<SCRIPT type="text/javascript">
					$(document).ready(function() {
						$("#NhapMonChinhSua").autocomplete({
							minLength : 2,
							source : function(request, response) {
								var $chon = $("#NhapMonChinhSua").val();
								$.ajax({
									url : "LayTenMonHoc",
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
						
						$('#NhapMonChinhSua').blur(function(event){
							
							var TenMon = $("#NhapMonChinhSua").val();
							$.post('LoadChuDeTheoTenMon',{TenMon : TenMon},function(result){
								var select = $('#ChonChuDeSua');
								 select.find('option').remove();
								$.each(result, function(key, value) {
							          $('<option>').val(key).text(value).appendTo(select);
								});
							});
							
						});
					});
				</SCRIPT>
				
				<!-- Chinhsuacauhoi_Script -->
				<SCRIPT type="text/javascript">
					$(document).ready(function(){
						$('.edit').click(function(){
							var id = $(this).attr("data-id");
							
							$.get('XemChiTietCauHoi',{ id : id},function(response){
								
								 $('#NhapMaCauChinhSua').val(response.MaCauHoi);
								/* $('#NhapMaCauChinhSua').find('option').remove();
								$('#NhapMaCauChinhSua').append($('<option>',{
										value: response.MaCauHoi,
										text: response.MaCauHoi
								})); */
								
								$('#NoiDungCauHoiChinhSua').text( response.NoiDung);
								$('#NhapCauAChinhSua').val(response.CauA);
								$('#NhapCauBChinhSua').val(response.CauB);
								$('#NhapCauCChinhSua').val(response.CauC);
								$('#NhapCauDChinhSua').val(response.CauD);
								
								var DapAn = response.DapAn;
								if(DapAn=="A"){
									$('#ChonDapAnChinhSua option[value="A"]').attr( "selected","selected");
								}else if(DapAn =="B"){
									$('#ChonDapAnChinhSua option[value="B"]').attr( "selected","selected");
								}else if(DapAn =="C"){
									$('#ChonDapAnChinhSua option[value="C"]').attr( "selected","selected");
								}else if(DapAn =="D"){
									$('#ChonDapAnChinhSua option[value="D"]').attr( "selected","selected");
								}
								
									$('#ChonChuDeSua').find('option').remove();
									$('#ChonChuDeSua').append($('<option>',{
										value: response.MaChuDe,
										text: response.TenChuDe
									}));
								
								$('#NhapMonChinhSua').val(response.TenMon);
								
								$('#ChonChuDeSua').dblclick(function(){
									var TenMon = $('#NhapMonChinhSua').val() ;
									$.post('LoadChuDeTheoTenMon',{TenMon : TenMon},function(result){
										var select = $('#ChonChuDeSua');
										select.find('option').remove();
										$.each(result, function(key, value) {
									          $('<option>').val(key).text(value).appendTo(select);
										});
									});
								});
								
								var MaMucDo = response.MaMucDo;
								if(MaMucDo == "1"){
									$('#ChonMucDoChihSua option[value="1"]').attr( "selected",true);
								}else if(MaMucDo == "2"){
									$('#ChonMucDoChihSua option[value="2"]').attr( "selected",true);
								}else if(MaMucDo == "3"){
									$('#ChonMucDoChihSua option[value="3"]').attr( "selected",true);
								};
							});
						});
					});
				</SCRIPT>


				<!-- Chinhsuacauhoi -->
				<div class="tab-pane fade" id="ChinhSuaCauHoi">
					<div class="form-inline">
						<p class="col-md-3"
						style="padding: 10px 20px; background: #E6E6FA; color: #0000CC;">Chỉnh sửa câu hỏi</p> 
					</div>
						
					<br> </br>
					<form id="formThemTungCauChinhSua" name="ThemTungCauChinhSua" action="LuuCauHoiDaSua" method="post">
						<div
							style="padding: 20px 20px; background: #E6E6FA; color: #0000CC;">

							<div class="row" style="padding: 20px 0px 0px 0px;">
								<div class="col-sm-2" style="text-align: right;">
									<label class="control-label">Mã câu sửa:</label>
								</div>
								<div class="col-sm-3">
									 <input
										class="form-control" id="NhapMaCauChinhSua" size="5px"  readonly="readonly" type="text" name="MaCauChinhSua">
									</input>
								</div>
							</div>	

							<div class="row" style="padding: 20px 0px 0px 0px;">
								<div class="col-sm-2 " style="text-align: right;">
									<label>Môn học: </label>
								</div>
								<div class="col-sm-3 ">
									 <input id="NhapMonChinhSua"
										class="form-control" value=""></input> 
								</div>
							</div>

							<div class="row" style="padding: 20px 0px 0px 0px;">

								<div class="col-sm-2 " style="text-align: right;">
									<label class="control-label">Chọn chủ đề:</label>
								</div>
								<div class="col-sm-3">	
									 <select
										class="form-control" id="ChonChuDeSua" name="ChuDeSua">
									</select>
								</div>
							</div>

							<div class="row" style="padding: 20px 0px 0px 0px;">
								<div class="col-sm-2" style="text-align: right;">
									<label class="control-label">Chọn mức độ:</label>
								</div>
								<div class="col-sm-3">
									<select class="form-control" id="ChonMucDoChihSua"
										name="MucDoChinhSua">
										<OPTION value="1">Dễ</OPTION>
										<OPTION value="2">Trung Bình</OPTION>
										<OPTION value="3">Khó</OPTION>
									</select>
								</div>
							</div>
							<br></br>
						</div>
						
						<br></br>
						<div id="formNhapNoiDungCauHoiChinhSua">
							<div
								style="padding: 10px 20px; background: #E6E6FA; color: #0000CC;">
								<div class="form-group">
									<label class="control-label">Nội dung câu hỏi</label>
									<textarea class="form-control"
										name="Name_NoiDungCauHoiChinhSua"
										ng-model="Model_NoiDUngCauHoiChinhSua"
										id="NoiDungCauHoiChinhSua" rows="3" required></textarea>
									<span style="color: red"
										ng-show="ThemTungCauChinhSua.Name_NoiDungCauHoiChinhSua.$touched && ThemTungCauChinhSua.Name_NoiDungCauHoiChinhSua.$invalid">Chưa
										nhập câu hỏi</span>
								</div>
								<div class="form-group">
									<label class="control-label">Nhập câu A:</label> <input
										type="text" id="NhapCauAChinhSua" class="form-control"
										name="Name_NhapCauAChinhSua" ng-model="Model_NhapCauAChinhSua"
										required> </input> <span style="color: red"
										ng-show="ThemTungCauChinhSua.Name_NhapCauAChinhSua.$touched && ThemTungCauChinhSua.Name_NhapCauAChinhSua.$invalid">Chưa
										nhập câu A</span>
								</div>
								<div class="form-group">
									<label class="control-label">Nhập câu B:</label> <input
										type="text" id="NhapCauBChinhSua" class="form-control"
										name="Name_NhapCauBChinhSua" ng-model="Model_NhapCauBChinhSua"
										required> </input> <span style="color: red"
										ng-show="ThemTungCauChinhSua.Name_NhapCauBChinhSua.$touched && ThemTungCauChinhSua.Name_NhapCauBChinhSua.$invalid">Chưa
										nhập câu B</span>
								</div>
								<div class="form-group">
									<label class="control-label">Nhập câu C:</label> <input
										type="text" id="NhapCauCChinhSua" class="form-control"
										name="Name_NhapCauCChinhSua" ng-model="Model_NhapCauCChinhSua"
										required> </input> <span style="color: red"
										ng-show="ThemTungCauChinhSua.Name_NhapCauCChinhSua.$touched && ThemTungCauChinhSua.Name_NhapCauCChinhSua.$invalid">Chưa
										nhập câu C</span>
								</div>
								<div class="form-group">
									<label class="control-label">Nhập câu D:</label> <input
										type="text" id="NhapCauDChinhSua" class="form-control"
										name="Name_NhapCauDChinhSua" ng-model="Model_NhapCauDChinhSua"
										required> </input> <span style="color: red"
										ng-show="ThemTungCauChinhSua.Name_NhapCauDChinhSua.$touched && ThemTungCauChinhSua.Name_NhapCauDChinhSua.$invalid">Chưa
										nhập câu D</span>
								</div>
								<div class="form-group">
									<label class="control-label">Đáp án:</label> <select
										class="form-control" id="ChonDapAnChinhSua" name="selectDapAnChinhSua">
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
									</select>
								</div>
								<div class="form-group"
									style="padding: 30px 20px; background: #E6E6FA;">
									<a data-toggle="tab" class="btn btn-primary" data-target="#khocauhoi" id="QuayLai">Quay lại</a>
									<input type="submit" class="btn btn-success" id="LuuThayDoi" value="Lưu thay đổi" onclick="return confirm('Bạn thật sự muốn sửa?')"></input>
								</div>
							</div>
						</div>
					</form>
				</div>
				
				
				<!-- LoadKhoa_BoMon_Mon_Script -->
				<SCRIPT type="text/javascript">
							$(document).ready(function() {
			
								$('#ChonKhoa').change(function(event) {
										
								        var Khoa = $("select#ChonKhoa").val();
								        $.get('Json_Khoa_BoMon', {
								                MaKhoa : Khoa
								        }, function(response) {
			
								        var select = $('#ChonBoMon');
								        select.find('option').remove();
								          $.each(response, function(key, value) {
								          $('<option>').val(key).text(value).appendTo(select);
									  
								          var BoMon = $("select#ChonBoMon").val();
									        $.get('Json_BoMon_Mon', {
									                MaBoMon : BoMon
									        }, function(response) {
				
									        var select1 = $('#ChonMon');
									        select1.find('option').remove();
									          $.each(response, function(key, value) {
									          $('<option>').val(key).text(value).appendTo(select1);
									          
									          var Mon = $("select#ChonMon").val();
										        $.get('Json_Mon_ChuDe', {
										                MaMon : Mon
										        }, function(response) {
					
										        var select1 = $('#ChonChuDe');
										        select1.find('option').remove();
										          $.each(response, function(key, value) {
										          $('<option>').val(key).text(value).appendTo(select1);
										     	 });
										        });
									     	 });
									        });
								     	 });
								      });
								}); 
								 $('#ChonBoMon').change(function(event) {											 
								        var BoMon = $("select#ChonBoMon").val();
								        $.get('Json_BoMon_Mon', {
								                MaBoMon : BoMon
								        }, function(response) {
			
								        var select1 = $('#ChonMon');
								        select1.find('option').remove();
								          $.each(response, function(key, value) {
								          $('<option>').val(key).text(value).appendTo(select1);
								          
								          var Mon = $("select#ChonMon").val();
									        $.get('Json_Mon_ChuDe', {
									                MaMon : Mon
									        }, function(response) {
				
									        var select1 = $('#ChonChuDe');
									        select1.find('option').remove();
									          $.each(response, function(key, value) {
									          $('<option>').val(key).text(value).appendTo(select1);
									     	 });
									        });
								     	 });
								        });
									});
								 
								 $('#ChonMon').change(function(event) {											 
								        var Mon = $("select#ChonMon").val();
								        $.get('Json_Mon_ChuDe', {
								                MaMon : Mon
								        }, function(response) {
			
								        var select1 = $('#ChonChuDe');
								        select1.find('option').remove();
								          $.each(response, function(key, value) {
								          $('<option>').val(key).text(value).appendTo(select1);
								     	 });
								        });
									});		
							});
				</SCRIPT>
								
				
				
				<!-- Themcauhoi_TungCau -->
				<div class="tab-pane fade" id="themcauhoivaokho">
					<div class="container">
						<ul class="nav navbar-nav danhsach2">
							<li><a href="#themtungcau" data-toggle="tab"><img
									src="img/them.png" height="40px" width="40px"></img>thêm từng
									câu</a></li>
							<li><a href="#themfile" data-toggle="tab"><img
									src="img/themfile.png" height="40px" width="40px"></img>Thêm
									file</a></li>
						</ul>
					</div>
					
					<!-- ThemCauHoi_form -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="themtungcau">
							<form id="formThemTungCau" name="ThemTungCau" action="ThemCauHoi_"
								method="post">

								<div
									style="padding: 20px 20px; background: #E6E6FA; color: #0000CC;">
								<sql:query var="TenKhoa" dataSource="${data }" > select MaKhoa,TenKhoa from Khoa_Nganh where MaKhoa !=-1</sql:query>
									<div class="row">
										<div class="col-sm-2" style="text-align: right;">
											<label class="control-label">Khoa:</label>
										</div>
										<div class="col-sm-3">
											<select class="form-control" id="ChonKhoa" required>
												<option value="-1">Chọn khoa</option>
												<c:forEach var="row" items="${TenKhoa.rows}">
													<option value="${row.MaKhoa }"><c:out
															value="${row.TenKhoa }"></c:out>
													</option>
												</c:forEach>
											</select>

										</div>
									</div>

									<div style="padding: 10px 0px 0px 0px;">
										<div class="row">
											<div class="col-sm-2" style="text-align: right;">
												<label class="control-label">Bộ môn:</label>
											</div>
											<div class="col-sm-3">
												 <select
													class="form-control" id="ChonBoMon">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>
									</div>

									<div style="padding: 10px 0px 0px 0px;">
										<div class="row">
											<div class="col-sm-2" style="text-align: right;">
												<label class="control-label">Môn học:</label>
											</div>
											<div class="col-sm-3">
												 <select
													class="form-control" id="ChonMon">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>
									</div>


									<div style="padding: 10px 0px 0px 0px;">
										<div class="row ">
											<div class="col-sm-2" style="text-align: right;">
												<label class="control-label">Chọn chủ đề:</label>
											</div>
											<div class="col-sm-3">
												<select class="form-control" id="ChonChuDe" name="ChuDe">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>
									</div>

									<div class="row" style="padding: 10px 0px 0px 0px;">
										<sql:query var="DoKho" dataSource="${data }"> select * from MucDo</sql:query>
										<div class="col-sm-2" style="text-align: right;">
											<label class="control-label">Chọn mức độ:</label>
										</div>
										<div class="col-sm-3">
											<select class="form-control" id="ChonMucDo" name="MucDo">
												<c:forEach var="row" items="${DoKho.rows}">
													<option value="${row.MaMucDo }"><c:out
															value="${row.TenMucDo }"></c:out>
													</option>
												</c:forEach>
											</select>
										</div>
									</div>

								</div>

								<br></br>
								<div id="formNhapNoiDungCauHoi">
									<div
										style="padding: 10px 20px; background: #E6E6FA; color: #0000CC;">
										<div class="form-group">
											<label class="control-label">Nội dung câu hỏi</label>
											<textarea class="form-control" name="Name_NoiDungCauHoi"
												ng-model="Model_NoiDUngCauHoi" id="NoiDungCauHoi" rows="3"
												required></textarea>
											<span style="color: red"
												ng-show="ThemTungCau.Name_NoiDungCauHoi.$touched && ThemTungCau.Name_NoiDungCauHoi.$invalid">Chưa
												nhập câu hỏi</span>
										</div>
										<div class="form-group">
											<label class="control-label">Nhập câu A:</label> <input
												type="text" id="NhapCauA" class="form-control"
												name="Name_NhapCauA" ng-model="Model_NhapCauA" required>
											</input> <span style="color: red"
												ng-show="ThemTungCau.Name_NhapCauA.$touched && ThemTungCau.Name_NhapCauA.$invalid">Chưa
												nhập câu A</span>
										</div>
										<div class="form-group">
											<label class="control-label">Nhập câu B:</label> <input
												type="text" id="NhapCauB" class="form-control"
												name="Name_NhapCauB" ng-model="Model_NhapCauB" required>
											</input> <span style="color: red"
												ng-show="ThemTungCau.Name_NhapCauB.$touched && ThemTungCau.Name_NhapCauB.$invalid">Chưa
												nhập câu B</span>
										</div>
										<div class="form-group">
											<label class="control-label">Nhập câu C:</label> <input
												type="text" id="NhapCauC" class="form-control"
												name="Name_NhapCauC" ng-model="Model_NhapCauC" required>
											</input> <span style="color: red"
												ng-show="ThemTungCau.Name_NhapCauC.$touched && ThemTungCau.Name_NhapCauC.$invalid">Chưa
												nhập câu C</span>
										</div>
										<div class="form-group">
											<label class="control-label">Nhập câu D:</label> <input
												type="text" id="NhapCauD" class="form-control"
												name="Name_NhapCauD" ng-model="Model_NhapCauD" required>
											</input> <span style="color: red"
												ng-show="ThemTungCau.Name_NhapCauD.$touched && ThemTungCau.Name_NhapCauD.$invalid">Chưa
												nhập câu D</span>
										</div>
										<div class="form-group" >
											<label class="control-label">Đáp án:</label> <select 
												class="form-control" id="ChonDapAn" name="DapAn">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
											</select>
										</div>
										
										<div class="form-group" 
											style="padding: 30px 20px; background: #E6E6FA; color: #0000CC;">
											<button class="btn btn-primary" id="HuyCauHoi"
												onclick="reset(),AnCauHoi()">hủy</button>
											<input type="submit"  class="btn btn-success"
												value="Thêm câu hỏi"></input>

										</div>
									</div>

								</div>
							</form>

						</div>
						<!-- themtungcau -->
						
						
						
						<!-- Themcauhoi_BangFile -->
						<div class="tab-pane fade text-center col-md-7 col-md-offset-3"
							id="themfile">
							<form action="ThemCauHoiBangFile" method="post" enctype="multipart/form-data">
								<div class="form-inline"
								style="background: #E6E6FA; padding: 20px 40px; color: #0000CC; border: 2px solid blue;">
								<label class="control-label">Chọn tệp từ máy:</label> <input
									type="file" class="form-control" name="fileCauHoi"></input>
								<input type="submit" class="btn btn-primary" value="OK"></input>
							</div>
							</form>
						</div>
						<!-- themfile -->
					</div>
				</div>

				<div class="modal fade" id="FormThemChuDeMoi" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<form name="FormThemChuDeMoi">

								<div class="modal-header">
									<h2>
										<img src="img/them.png" height="60px" width="60px"></img> Thêm
										chủ đề

									</h2>
								</div>

								<div class="modal-body"
									style="padding: 10px 20px; background: #E6E6FA; color: #0000CC;">
									<div class="form-group">
										<div class="form-inline">
											<div class="form-group">
												<label class="control-label">Khoa:</label> <select
													class="form-control" id="ChonKhoa">
													<option value="-1">Chọn Khoa</option>
													<c:forEach var="row" items="${TenKhoa.rows}">
														<option value="${row.MaKhoa }"><c:out
																value="${row.TenKhoa }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div style="padding: 10px 0px 0px 0px;">
											<div class="form-inline">
												<div class="form-group">
													<label class="control-label">Bộ môn:</label> <select
														class="form-control" id="ChonBoMon">
														<option value="-1">Chọn</option>
													</select>
												</div>
											</div>
										</div>

										<div style="padding: 10px 0px 0px 0px;">
											<div class="form-inline">
												<div class="form-group">
													<label class="control-label">Môn học:</label> <select
														class="form-control" id="ChonMon">
														<option value="-1">Chọn</option>
													</select>
												</div>
											</div>
										</div>
										<div style="padding: 10px 0px 0px 0px;">

											<div class="form-group ">
												<label class="control-label">Chọn chủ đề:</label> <select
													class="form-control" id="ChonChuDe">
													<option value="-1">Chọn</option>
												</select>
											</div>
										</div>

										<label class="control-label"> Chủ đề muốn thêm: </label>
										<textarea type="text" id="ThemChuDe" class="form-control"
											name="Name_ThemChuDe" ng-model="Model_ThemChuDe" rows="3px"
											required></textarea>
										<span style="color: red"
											ng-show="FormThemChuDeMoi.Name_ThemChuDe.$touched && FormThemChuDeMoi.Name_ThemChuDe.$invalid">Chưa
											nhập chủ đề</span>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">cancel</button>
									<button type="button" class="btn btn-success"
										id="ThemChuDeThanhCong" data-dismiss="modal">OK</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				
				
				<!-- Thongtincanhan -->
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

										<ul class="list-inline">
											<li style="width: 200px;">Loại công viêc</li>
											<li>: <c:out value="${row.TenLoaiCV }"></c:out></li>
										</ul>
										<ul class="list-inline">
											<li style="width: 200px;">Tình trạng học</li>
											<li>: <c:out value="${row.TenTinhTrang }"></c:out></li>
										</ul>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class=" panel panel-info ">
							<div class="panel-heading">Thông tin ngành tham gia</div>
							<div class="panel-body">
								<ul>
									<c:forEach var="row" items="${result.rows }">
										<ul class="list-inline">
											<li style="width: 150px;">Mã khoa làm việc</li>
											<li>: <c:out value="${row.MaKhoa }"></c:out></li>
										</ul>
										<ul class="list-inline">
											<li style="width: 150px;">Tên khoa làm việc</li>
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
											</c:forEach></li>
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
	<footer id="footer" class="navbar-fixed-bottom">
		Copyright@TracNghiemOnline.com.vn </footer>

	
	
	<!-- Doimatkhau -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form name="FormDoiMatKhau">
					<div class="modal-header text-center">

						<h2>
							<img src="img/key.png" height="60px" width="60px"></img>/Đổi mật
							khẩu
						</h2>
					</div>
					<div class="modal-body "
						style="padding: 20px 20px; background: #E6E6FA;">
						<div class="form-group">
							<label>Nhập mật khẩu cũ: </label> <input name="NhapMatKhauCu"
								size="60px" ng-model="NhapMatKhauCu" type="password"
								class="form-control " required> </input> <span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauCu.$touched && FormDoiMatKhau.NhapMatKhauCu.$invalid">Chưa
								nhập mật khẩu cũ</span>
						</div>

						<div class="form-group">
							<label>Nhập mật khẩu mới: </label> <input name="NhapMatKhauMoi"
								size="60px" ng-model="NhapMatKhauMoi" type="password"
								class="form-control " required> </input> <span
								class="ChuaNhapValue"
								ng-show="FormDoiMatKhau.NhapMatKhauMoi.$touched && FormDoiMatKhau.NhapMatKhauMoi.$invalid">Chưa
								nhập mật khẩu mới</span>
						</div>

						<div class="form-group">
							<label>Nhập lại mật khẩu mới: </label> <input type="password"
								size="60px" class="form-control" name="NhapMatKhauMoi1"
								ng-model="NhapMatKhauMoi1" required> </input> <span
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
					<h3>Thông báo</h3>
				</div>
				<div class="modal-body text-center">
					<p>Đổi mật khẩu thành công</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<h3>Thông báo</h3>
				</div>
				<div class="modal-body text-center">
					<h2>Thêm thành công</h2>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-success btn-lg"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Thongbaosua -->
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<h3>Thông báo</h3>
				</div>
				<div class="modal-body text-center">
					<h2>Sửa thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Thongbaoxoa -->
	<div class="modal fade" id="myModal5" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<h3>Thông báo</h3>
				</div>
				<div class="modal-body text-center">
					<h2>Bạn có chắc chắn xóa không?</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
					<a href="#" id="xoathanhcong" class="btn btn-success"
						data-dismiss="modal">OK</a>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal6" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<h3>Thông báo</h3>
				</div>
				<div class="modal-body text-center">
					<h2>Đã xóa thành công</h2>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		
     $(document).ready(function(){
          $("#myNopBai").click(function(){
            $("#myModal").modal({backdrop:"static"});
          });
          $("#thanhcong").click(function(){
            $("#myModal1").modal({backdrop:"static"});
          });
           $("#themcauhoi,#themfilevao,#ThemChuDeThanhCong").click(function(){
            $("#myModal2").modal({backdrop:"static"});
          });
            
             $("#suathanhcong").click(function(){
            $("#myModal4").modal({backdrop:"static"});
          });
            $("#xoa").click(function(){
            $("#myModal5").modal({backdrop:"static"});
          });
             $("#xoathanhcong").click(function(){
            $("#myModal6").modal({backdrop:"static"});
          });
              $("#ThemChuDeMoi,#ThemChuDeMoiChinhSua").click(function(){
            $("#FormThemChuDeMoi").modal({backdrop:"static"});
          });

            
     });
   </script>
   
	<script type="text/javascript">
   		$("#kiemTraMaNhapCauHoi").click(function(){
   			$("#formNhapNoiDungCauHoi :input").attr("disabled",false);
   		});
   </script>
	<script type="text/javascript">
   	function reset(){
   		document.getElementById(formThemTungCau).reset();
   	}
   </script>
</body>
</html>