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
<title>Admin</title>
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

<script type="text/javascript" lang="javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js">
  </script>

</head>
<body ng-app="">

	<%
		HttpSession sess = request.getSession(false);
	%>
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline?useUnicode=true&characterEncoding=UTF-8" user="root"
		password="trungdung29" />
	<sql:query var="result" dataSource="${data}">   select  * from ThongTin_TatCaUser_View where MaTK  = '<%=sess.getAttribute("taikhoan")%>' 
	</sql:query>

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
								<span> <c:forEach var="row" items="${result.rows}">
										<c:out value="${row.TenNguoiDung}"></c:out>
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
	<br>
	<div id="content">
		<div class="jumbotron">
			<div class="col-md-2 danhsach">
				<ul class="nav nav-collapse nav-stacked ">
					<li class="active"><a href="#molopthi" data-toggle="tab"><img
							src="img/quanly.png" height="40px" width="40px"></img> Quản lý</a></li>
					<li><a href="#thongtincanhan" data-toggle="tab"><img
							src="img/thongtincanhan.png" height="40px" width="40px"></img>Thông
							tin cá nhân</a></li>
				</ul>
			</div>

			<div class=" tab-content col-md-10  danhsach1">

				<!-- active_form -->
				<div class="tab-pane fade in active" id="molopthi">
					<div class="container">
						<ul class="nav navbar-nav danhsach2">
							<li><a href="#lopthi" data-toggle="tab"><img
									src="img/danhsach.png" height="40px" width="40px"></img>Danh
									sách thành viên</a></li>
							<li><a href="#ThemThanhVien" data-toggle="tab"><img
									src="img/them.png" height="40px" width="40px"></img>Thêm thành
									viên</a></li>
							<li><a href="#ThemThanhVienFile" data-toggle="tab"><img
									src="img/themfile.png" height="40px" width="40px"></img>Thêm
									thành viên(FILE)</a></li>
						</ul>
					</div>


					<div class="tab-content">
						<!-- active_form -->
						<div class="tab-pane fade in active" id="lopthi">
							<br/>
							<form class="form-inline"
								style="background: #E6E6FA; padding: 20px 20px; color: blue;">

								<div class="form-group col-md-offset-0">
									<div class="form-group">
										<label class="control-label">Tìm kiếm theo:</label> <select
											class="form-control" id="LoaiTimKiem" name="LoaiTimKiem">
											<option value="0">Mã TK</option>
											<option value="1">Tên TK</option>
											<option value="2">Năm sinh</option>
											<option value="3">Giới tính</option>
											<option value="5">Quyền</option>
											<option value="6">Mật khẩu</option>
											<option value="7">Ngày giờ thêm</option>
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

							<!-- TimKiemSinhVienTheoTuKhoa -->
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

							<sql:query var="BangThanhVien" dataSource="${data }"> select * from BangThanhVien_view; </sql:query>

							<div id="caibangAdmin" style="overflow-x: auto;">
								<table style="background: #E6E6FA;"
									class="table table-hover table-striped" id="myTable">
									<thead>
										<tr>
											<th>Mã thành viên</th>
											<th>Tên thành viên</th>
											<th>Năm sinh</th>
											<th>Giới tính</th>
											<th>Quyền truy cập</th>
											<th>Mật khẩu</th>
											<th>Ngày giờ thêm</th>
											<th>Sửa</th>
											<th>Xóa</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${BangThanhVien.rows }">
											<tr>
												<td>${row.MaTK }</td>
												<td>${row.TenNguoiDung }</td>
												<td>${row.NgaySinh }</td>
												<td><c:choose>
														<c:when test="${row.GioiTinh==true }">Nam</c:when>
														<c:otherwise> Nữ </c:otherwise>
													</c:choose></td>
												<td>${row.TenQuyen}</td>
												<td>${row.MatKhau }</td>
												<td>${row.NgayBatDau }</td>
												<td><a href="" data-id="${row.MaTK }"
													class="editThanhVien" data-toggle="tab"
													data-target="#ThemThanhVienChinhSua"><img
														src="img/sua.png" height="20px" width="20px"></img></a></td>
												<td><a href="XoaThanhVien?id=${row.MaTK }" id=""
													onclick="return confirm('Bạn thật sự muốn xóa')"><img
														src="img/xoa.png" height="20px" width="20px"></img></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>


						<!-- Chinhsuathanhvien_script -->
						<SCRIPT type="text/javascript">
								$(document).ready(function(){
									$(".editThanhVien").click(function(){
										var MaTK = $(this).attr("data-id");
										
										$.post('LayThongTinTV',{MaTK: MaTK},function(response){
											/*var select = $("#selQuyenSua");
											select.find("option:selected").prop("selected",false);
											select.find('option[value=0]').attr("selected",true); */
											$("#selQuyenSinhVienCS").find("option[value="+response.MaQuyen+"]").attr("selected",true);
											$("#txtMaTVSua").val(MaTK);
											$("#txtTenTVSua").val(response.TenNguoiDung); 
											$("#txtNgaySinhSua").val(response.NgaySinh);
											$("#txtGioiTinhSua").find("option[value="+response.GioiTinh+"]").attr("selected",true);
											$("#txtDanTocSua").val(response.DanToc); 
											$("#txtCMNDSua").val(response.SoCMND);
											$("#txtEmailSua").val(response.Email);
											$("#txtSDTSua").val(response.SDT); 
											$("#txtDiaChiSua").val(response.DiaChi);
											$("#txtThanhPhoSua").find("option[value="+response.MaTP+"]").attr("selected",true);
											$("#txtQuocGiaSua").find("option[value="+response.MaQG+"]").attr("selected",true);
											$("#selMaKhoaSua").find("option[value="+response.MaKhoa+"]").attr("selected",true);
											$("#selMaChucVuSua").find("option[value="+response.MaChucVu+"]").attr("selected",true);
											if(response.MaLop != "-1"){
												$("#txtMaLopHocSua").val(response.MaLop); 
											}
											$("#txtTinhTrangHVSua").find("option[value="+response.MaTinhTrangHV+"]").attr("selected",true);
											$("#txtLoaiCongViecSua").find("option[value="+response.MaLoaiCV+"]").attr("selected",true);
											$("#txtTinhTrangCVSua").val(response.MaTinhTrangCV); 
											$("#txtMatKhauSua").val(response.MatKhau);
											$('#HinhLoadSua').attr('src','LoadHinhAnhSua?idSua='+MaTK+'');
										});
									});
								});
							
							</SCRIPT>


						<!-- ChinhSuaThanhVien_form -->
						<div class="tab-pane fade " id="ThemThanhVienChinhSua">
							<span class="label label-primary" style="font-size: 20px">CHỈNH
								SỬA THÔNG TIN USER</span> <br />
							<form name="FormNhapThanhVienSua" method="post"
								action="SuaTaiKhoan" enctype="multipart/form-data">
								<div class="form-inline"
									style="padding: 20px; background: #E6E6FA; color: #0000CC;">
									<div class="form-group">
										<label class="control-label">Quyền đăng nhập:</label>
										<sql:query var="BangQuyenSinhVienCS" dataSource="${data }">  select * from QuyenDangNhap </sql:query>
									<SELECT id="selQuyenSinhVienCS" name="selQuyenSinhVienCS" class="form-control">
										<c:forEach var="row" items="${BangQuyenSinhVienCS.rows }">
											<OPTION value="${row.MaQuyen }"> ${row.TenQuyen }</OPTION>
										</c:forEach>
									</SELECT>
									</div>
								</div>

								<br></br>

								<div id="NhapThongTinChungUser">
									<span class="label label-primary">Phần chung</span>
									<div class="form-inline">
										<div class="form-group">
											<label class="control-label">Nhập mã thành viên:</label> <input
												type="text" value="" readonly="readonly" class="form-control" name="txtMaTVSua"
												ng-model="Model_MaThanhVien" id="txtMaTVSua" required
												size="15px"> </input><span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtMaTVSua.$touched && FormNhapThanhVien.txtMaTVSua.$invalid">Chưa
												nhập mã thành viên</span>
										</div>
										<div class="form-group">
											<label class="control-label">Nhập tên thành viên:</label> <input
												type="text" value="" class="form-control" name="txtTenTVSua"
												id="txtTenTVSua" ng-model="Modal_TenThanhVien" required
												size="35px;"></input> <span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtTenTVSua.$touched && FormNhapThanhVien.txtTenTVSua.$invalid">Chưa
												nhập tên thành viên</span>
										</div>
									</div>
									<div class="form-inline">
										<div class="form-group input-append" id="datepicker">
											<label class="control-label">Nhập ngày sinh:</label> <input
												class="form-control" data-format="yyyy-MM-dd"
												name="txtNgaySinhSua" id="txtNgaySinhSua" type="text"
												size="15px"></input> <span class="add-on">
												<button type="button" class="btn btn-primary"
													id="btnNhapNgayThiChinhSua" onclick="ngay()">ngày</button>
											</span>
										</div>

										<div class="form-group">
											<label class="control-label">Giới tính:</label> <select
												class="form-control" id="txtGioiTinhSua"
												name="txtGioiTinhSua">
												<option value="1">Nam</option>
												<option value="0">Nữ</option>
											</select>
										</div>
										<div class="form-group">
											<label class="control-label">Dân tộc:</label> <input
												type="text" value="" class="form-control"
												name="txtDanTocSua" ng-model="Model_DanToc"
												id="txtDanTocSua" required size="10px"></input> <span
												class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtDanTocSua.$touched && FormNhapThanhVien.txtDanTocSua.$invalid">Chưa
												nhập tên dân tộc</span>
										</div>
										<div class="form-group">
											<label class="control-label">Số CMND:</label> <input
												type="text" value="" class="form-control" name="txtCMNDSua"
												ng-model="Model_CMND" id="txtCMNDSua" required size="15px"></input>
											<span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtCMNDSua.$touched && FormNhapThanhVien.txtCMNDSua.$invalid">Chưa
												nhập số CMND</span>
										</div>
										<div class="form-group">
											<label class="control-label">Email:</label> <input
												type="text" value="" class="form-control" name="txtEmailSua"
												ng-model="Model_Email" id="txtEmailSua" required size="15px"></input>
											<span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtEmailSua.$touched && FormNhapThanhVien.txtEmailSua.$invalid">Chưa
												nhập số CMND</span>
										</div>
										<div class="form-group">
											<label class="control-label">Số điện thoại:</label> <input
												type="text" value="" class="form-control" name="txtSDTSua"
												ng-model="Model_SDT" id="txtSDTSua" required size="15px">
											</input><span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtSDTSua.$touched && FormNhapThanhVien.txtSDTSua.$invalid">Chưa
												nhập số CMND</span>
										</div>
									</div>
									<div class="form-inline">
										<div class="form-group">
											<label class="control-label">Địa chỉ:</label> <input
												type="text" value="" class="form-control"
												name="txtDiaChiSua" ng-model="Model_DiaChi"
												id="txtDiaChiSua" required></input> <span
												class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtDiaChiSua.$touched && FormNhapThanhVien.txtDiaChiSua.$invalid">Chưa
												nhập địa chỉ</span>
										</div>
										<div class="form-group">
											<label class="control-label">Thành phố:</label>
											<sql:query var="ThanhPho" dataSource="${data }"> select * from ThanhPho order by TenTP ASC</sql:query>
											<select class="form-control" id="txtThanhPhoSua"
												name="txtThanhPhoSua">
												<c:forEach var="row" items="${ ThanhPho.rows}">
													<option value="${row.MaTP }"><c:out
															value="${row.TenTP}"></c:out>
													</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label class="control-label">Quốc gia:</label>
											<sql:query var="QuocGia" dataSource="${data }"> select * from QuocGia order by TenQG ASC</sql:query>
											<select class="form-control" id="txtQuocGiaSua"
												name="txtQuocGiaSua">
												<c:forEach var="row" items="${ QuocGia.rows}">
													<option value="${row.MaQG }"><c:out
															value="${row.TenQG}"></c:out></option>
												</c:forEach>
											</select>
										</div>
									</div>



									<div class="form-inline">
										<div class="form-group">
										
											<label class="control-label">Khoa:</label>
											<sql:query var="BangTenKhoaSua" dataSource="${data }">select MaKhoa,TenKhoa from Khoa_Nganh where MaKhoa != -1 order by  TenKhoa ASC</sql:query>
											<SELECT class="form-control" id="selMaKhoaSua"
												name="txtMaKhoaSua">
												<option value="-1">Chọn</option>
												<c:forEach var="row" items="${BangTenKhoaSua.rows }">
													<OPTION value="${row.MaKhoa }">
														<c:out value="${row.TenKhoa }"></c:out>
													</OPTION>
												</c:forEach>
											</SELECT>
										</div>

										<div class="form-group">
											<label class="control-label">Chức vụ:</label>
											<sql:query var="BangChucVuSua" dataSource="${data }"> select MaChucVu,TenChucVu from ChucVu  where MaChucVu != -1 order by Luong </sql:query>
											<SELECT class="form-control" id="selMaChucVuSua"
												name="txtMaChucVuSua">
												<c:forEach var="row" items="${BangChucVuSua.rows }">
													<OPTION value="${row.MaChucVu }"><c:out
															value="${row.TenChucVu }"></c:out>
													</OPTION>
												</c:forEach>
											</SELECT>
										</div>

										<div class="form-inline">
											<div class="form-group">
												<label style="position: relative; bottom: 100px;"
													class="control-label">Hình ảnh:</label> <img
													src=""
													id="HinhLoadSua" alt="Ảnh cá nhân" width="150" height="200" />
												<input type="file" name="fileHinhAnhSua"
													onchange="document.getElementById('HinhLoadSua').src = window.URL.createObjectURL(this.files[0])"></input>
											</div>
										</div>

									</div>
								</div>



								<br></br>
								<div id="NhapThongTinRiengUser" class="form-inline">
									<span class="label label-primary">Phần sinh viên</span>
									<div id="SinhVien" class="form-inline">

										<div class="form-group">
											<label class="control-label">Mã lớp học:</label> <input
												type="text" value="" class="form-control"
												name="txtMaLopHocSua" ng-model="Model_MaLopThi"
												id="txtMaLopHocSua"></input>
											<!-- <span
															class="ChuaNhapValue"
															ng-show="FormNhapThanhVien.txtMaLopHocSua.$touched && FormNhapThanhVien.txtMaLopHocSua.$invalid">Chưa
															nhập mã lớp</span> -->
										</div>

										<div class="form-group">

											<sql:query var="MaTenHV" dataSource="${data}"> select * from TinhTrangHocVan where MaTinhTrangHV != -1</sql:query>

											<label class="control-label">Tình trạng học vấn:</label> <select
												class="form-control" id="txtTinhTrangHVSua"
												name="txtTinhTrangHVSua">
												<option value="-1">Chọn</option>
												<c:forEach var="row" items="${MaTenHV.rows }">
													<option value="${row.MaTinhTrangHV }">
														<c:out value="${row.TenTinhTrangHV}"></c:out>
													</option>
												</c:forEach>
											</select>
										</div>


									</div>
									<br></br> <span class="label label-primary">Phần công
										việc trong trường</span>

									<div id="NhaTruong" class="form-inline">

										<div class="form-group">

											<sql:query var="LoaiCV" dataSource="${data}"> select MaLoaiCV,TenLoaiCV from LoaiCongViec where MaLoaiCV != -1 </sql:query>
											<label class="control-label">Loại công việc:</label> <select
												class="form-control" id="txtLoaiCongViecSua"
												name="txtLoaiCongViecSua">
												<option value="-1">Chọn</option>
												<c:forEach var="row" items="${LoaiCV.rows }">
													<option value="${row.MaLoaiCV }">
														<c:out value="${row.TenLoaiCV }"></c:out>
													</option>
												</c:forEach>
											</select>
										</div>

										<div class="form-group">

											<sql:query var="MaTenTTCV" dataSource="${data}"> select * from TinhTrangCongViec where MaTinhTrangCV !=-1 </sql:query>
											<label class="control-label">Tình trạng công việc:</label> <select
												class="form-control" id="txtTinhTrangCVSua"
												name="txtTinhTrangCVSua">
												<option value="-1">Chọn</option>
												<c:forEach var="row" items="${MaTenTTCV.rows }">
													<option value="${row.MaTinhTrangCV }">
														<c:out value="${row.TenTinhTrang }"></c:out>
													</option>
												</c:forEach>
											</select>

										</div>
									</div>
									<br>
									<span class="label label-primary">Cấp mật khẩu</span>
									<div class="form-inline">
										<div class="form-group"
											style="padding: 20px; background: #E6E6FA; color: #0000CC;">
											<label class="control-label">Cấp mật khẩu:</label> <input
												type="text" class="form-control" name="txtMatKhauSua"
												id="txtMatKhauSua" ng-model="Model_MatKhau" required
												value=""></input> <span class="ChuaNhapValue"
												ng-show="FormNhapThanhVien.txtTinhTrangCVSua.$touched && FormNhapThanhVien.txtTinhTrangCVSua.$invalid">Chưa
												nhập mật khẩu</span>
										</div>
									</div>
								</div>
								<br></br>
								<div class="form-group col-md-3"
									style="padding: 20px; background: #E6E6FA; color: #0000CC;">
									<a data-toggle="tab" data-target="#lopthi"
										class="btn btn-primary">Hủy bỏ</a> <input type="submit"
										id="Sua" class="btn btn-success" value="Hoàn thành"> </input>

								</div>


							</form>
						</div>


						<!-- ThemThanhVien_Form -->
						<div class="tab-pane fade " id="ThemThanhVien">
							<div>
								<form name="FormNhapThanhVien" method="post"
									action="ThemTaiKhoan" enctype="multipart/form-data">
									<div class="form-inline"
										style="padding: 20px; background: #E6E6FA; color: #0000CC;">

										<div class="form-group">

											<sql:query var="MaQTenQ" dataSource="${data}"> select MaQuyen,TenQuyen from QuyenDangNhap </sql:query>
											<label class="control-label">Quyền đăng nhập:</label> <select
												class="form-control" name="txtQuyen">
												<c:forEach var="row" items="${MaQTenQ.rows }">
													<option value="${row.MaQuyen} ">
														<c:out value="${row.TenQuyen }"></c:out>
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<br></br>

									<div id="NhapThongTinChungUser">
										<span class="label label-primary">Phần chung</span>
										<div class="form-inline">
											<div class="form-group">
												<label class="control-label">Nhập mã thành viên:</label> <input
													type="text" value="" class="form-control" name="txtMaTV"
													ng-model="Model_MaThanhVien" id="MaThanhVien" required
													size="15px"> </input><span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtMaTV.$touched && FormNhapThanhVien.txtMaTV.$invalid">Chưa
													nhập mã thành viên</span>
											</div>
											<div class="form-group">
												<label class="control-label">Nhập tên thành viên:</label> <input
													type="text" value="" class="form-control" name="txtTenTV"
													id="TenThanhVien" ng-model="Modal_TenThanhVien" required
													size="35px;"></input> <span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtTenTV.$touched && FormNhapThanhVien.txtTenTV.$invalid">Chưa
													nhập tên thành viên</span>
											</div>
										</div>
										<div class="form-inline">
											<div class="form-group input-append" id="datepicker">
												<label class="control-label">Nhập ngày sinh:</label> <input
													class="form-control" data-format="yyyy-MM-dd"
													name="txtNgaySinh" id="NhapNgaySinh" type="text"
													size="15px"></input> <span class="add-on">
													<button type="button" class="btn btn-primary"
														id="btnNhapNgayThiChinhSua" onclick="ngay()">ngày</button>
												</span>
											</div>

											<div class="form-group">
												<label class="control-label">Giới tính:</label> <select
													class="form-control" id="GioiTinh" name="txtGioiTinh">
													<option value="Nam">Nam</option>
													<option value="Nu">Nữ</option>
												</select>
											</div>
											<div class="form-group">
												<label class="control-label">Dân tộc:</label> <input
													type="text" value="" class="form-control" name="txtDanToc"
													ng-model="Model_DanToc" id="DanToc" required size="10px"></input>
												<span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.Name_DanToc.$touched && FormNhapThanhVien.Name_DanToc.$invalid">Chưa
													nhập tên dân tộc</span>
											</div>
											<div class="form-group">
												<label class="control-label">Số CMND:</label> <input
													type="text" value="" class="form-control" name="txtCMND"
													ng-model="Model_CMND" id="CMND" required size="15px"></input>
												<span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtCMND.$touched && FormNhapThanhVien.txtCMND.$invalid">Chưa
													nhập số CMND</span>
											</div>
											<div class="form-group">
												<label class="control-label">Email:</label> <input
													type="text" value="" class="form-control" name="txtEmail"
													ng-model="Model_Email" id="CMND" required size="15px"></input>
												<span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtEmail.$touched && FormNhapThanhVien.txtEmail.$invalid">Chưa
													nhập số CMND</span>
											</div>
											<div class="form-group">
												<label class="control-label">Số điện thoại:</label> <input
													type="text" value="" class="form-control" name="txtSDT"
													ng-model="Model_SDT" id="CMND" required size="15px">
												</input><span class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtSDT.$touched && FormNhapThanhVien.txtSDT.$invalid">Chưa
													nhập số CMND</span>
											</div>
										</div>
										<div class="form-inline">
											<div class="form-group">
												<label class="control-label">Địa chỉ:</label> <input
													type="text" value="" class="form-control" name="txtDiaChi"
													ng-model="Model_DiaChi" id="DiaChi" required></input> <span
													class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.txtDiaChi.$touched && FormNhapThanhVien.txtDiaChi.$invalid">Chưa
													nhập địa chỉ</span>
											</div>
											<div class="form-group">
												<label class="control-label">Thành phố:</label>
												<sql:query var="ThanhPho" dataSource="${data }"> select * from ThanhPho order by TenTP ASC</sql:query>
												<select class="form-control" id="ThanhPho"
													name="txtThanhPho">
													<c:forEach var="row" items="${ ThanhPho.rows}">
														<option value="${row.MaTP }"><c:out
																value="${row.TenTP}"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>
											<div class="form-group">
												<label class="control-label">Quốc gia:</label>
												<sql:query var="QuocGia" dataSource="${data }"> select * from QuocGia order by TenQG ASC</sql:query>
												<select class="form-control" id="QuocGia" name="txtQuocGia">
													<c:forEach var="row" items="${ QuocGia.rows}">
														<option value="${row.MaQG }"><c:out
																value="${row.TenQG}"></c:out></option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-inline">
											<div class="form-group">
												
												<sql:query var="MaTenKhoa" dataSource="${data}"> select MaKhoa,TenKhoa from Khoa_Nganh where MaKhoa != -1 </sql:query>
												<label class="control-label">Khoa:</label> <select
													class="form-control" id="NganhDay" name="txtMaKhoa">
													<option value="-1">Chọn</option>
													<c:forEach var="row" items="${MaTenKhoa.rows }">
														<option value="${row.MaKhoa} ">
															<c:out value="${row.TenKhoa }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>

											<div class="form-group">
												
												<sql:query var="MaTenCV" dataSource="${data}"> select MaChucVu,TenChucVu from ChucVu where MaChucVu != -1 </sql:query>
												<label class="control-label">Chức vụ:</label> <select
													class="form-control" id="NganhDay" name="txtMaChucVu">
													<c:forEach var="row" items="${MaTenCV.rows }">
														<option value="${row.MaChucVu} ">
															<c:out value="${row.TenChucVu }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>

											<div class="form-inline">
												<div class="form-group">
													<label style="position: relative; bottom: 100px;"
														class="control-label">hình ảnh:</label> <img id="HinhLoad"
														alt="Hình Ảnh" width="150" height="200" /> <input
														type="file" name="fileHinhAnh"
														onchange="document.getElementById('HinhLoad').src = window.URL.createObjectURL(this.files[0])"></input>
												</div>
											</div>

										</div>
									</div>

									<br></br>
									<div id="NhapThongTinRiengUser" class="form-inline">
										<span class="label label-primary">Phần sinh viên</span>
										<div id="SinhVien" class="form-inline">

											<div class="form-group">
												<label class="control-label">Mã lớp học:</label> <input
													type="text" value="" class="form-control"
													name="txtMaLopHoc" ng-model="Model_MaLopThi" id="MaLopThi"></input>
												<!-- <span
															class="ChuaNhapValue"
															ng-show="FormNhapThanhVien.Name_MaLopThi.$touched && FormNhapThanhVien.Name_MaLopThi.$invalid">Chưa
															nhập mã lớp</span> -->
											</div>

											<div class="form-group">

												<sql:query var="MaTenHV" dataSource="${data}"> select * from TinhTrangHocVan where MaTinhTrangHV != -1</sql:query>

												<label class="control-label">Tình trạng học vấn:</label> <select
													class="form-control" id="TinhTrangHoc"
													name="txtTinhTrangHV">
													<option value="-1">Chọn</option>
													<c:forEach var="row" items="${MaTenHV.rows }">
														<option value="${row.MaTinhTrangHV }">
															<c:out value="${row.TenTinhTrangHV}"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>


										</div>
										<br></br> <span class="label label-primary">Phần công
											việc trong trường</span>

										<div id="NhaTruong" class="form-inline">

											<div class="form-group">

												
												<sql:query var="LoaiCV" dataSource="${data}"> select MaLoaiCV,TenLoaiCV from LoaiCongViec where MaLoaiCV != -1 </sql:query>
												<label class="control-label">Loại công việc:</label> <select
													class="form-control" id="LoaiCongViec"
													name="txtLoaiCongViec">
													<option value="-1">Chọn</option>
													<c:forEach var="row" items="${LoaiCV.rows }">
														<option value="${row.MaLoaiCV }">
															<c:out value="${row.TenLoaiCV }"></c:out>
														</option>
													</c:forEach>
												</select>
											</div>

											<div class="form-group">
											
												<sql:query var="MaTenTTCV" dataSource="${data}"> select * from TinhTrangCongViec where MaTinhTrangCV !=-1 </sql:query>
												<label class="control-label">Tình trạng công việc:</label> <select
													class="form-control" id="TinhTrangCongViec"
													name="txtTinhTrangCV">
													<option value="-1">Chọn</option>
													<c:forEach var="row" items="${MaTenTTCV.rows }">
														<option value="${row.MaTinhTrangCV }">
															<c:out value="${row.TenTinhTrang }"></c:out>
														</option>
													</c:forEach>
												</select>

											</div>
										</div>
										<br>
										<span class="label label-primary">Cấp mật khẩu</span>
										<div class="form-inline">
											<div class="form-group"
												style="padding: 20px; background: #E6E6FA; color: #0000CC;">
												<label class="control-label">Cấp mật khẩu:</label> <input
													type="text" class="form-control" name="txtMatKhau"
													ng-model="Model_MatKhau" required value=""></input> <span
													class="ChuaNhapValue"
													ng-show="FormNhapThanhVien.Name_MatKhau.$touched && FormNhapThanhVien.Name_MatKhau.$invalid">Chưa
													nhập mật khẩu</span>
											</div>
										</div>
									</div>
									<br></br>
									<div class="form-group col-md-3 "
										style="padding: 20px; background: #E6E6FA; color: #0000CC;">
										<a class="btn btn-primary" data-toggle="tab"
											data-target="#lopthi">Hủy bỏ</a> <input type="submit"
											id="Them" class="btn btn-success" value="Thêm"> </input>
									</div>
								</form>
							</div>

						</div>


						<!-- ThemThanhVienFile_Form -->
						<div class="tab-pane fade col-md-5 col-md-offset-3"
							id="ThemThanhVienFile">
							<form action="ThemTKBangFile" method="post" enctype="multipart/form-data">
								<div class="form-inline ">
									<div class="form-group">
										<label class="control-label">Chọn file:</label> <input
											type="file" name="fileThemTV"></input>
									</div>
									<div class="form-group">
										<input type="submit" value="OK" class="btn btn-info"></input>
									</div>
								</div>
							</form>
						</div>
						
					</div>
				</div>

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
											<li>: <c:out value="${row.MaTK }"></c:out>
											</li>
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
												</c:choose>
											</li>
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
								</ul>
							</div>
						</div>

					</div>

					<div class="col-md-6 col-md-offset-1">
						<div
							style="width: 146px; border-style: dashed; border-color: blue;"
							class="col-md-offset-4">
							<img src="LoadHinhAnh?id=<%=sess.getAttribute("taikhoan")%>"
								alt="Ảnh cá nhân" height="200px" width="140px"></img>
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
	<!-- contenter -->
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
								class="form-control " required> </input><span
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
								ng-model="NhapMatKhauMoi1" required></input> <span
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

				<div class="modal-body">
					<p>Thông báo</p>
				</div>
				<div class="modal-header text-center">
					<p>Đổi mật khẩu thành công</p>
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
					<h2>Thêm thành công</h2>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success " data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal4" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<p>Thông báo</p>
				</div>
				<div class="modal-body text-center">
					<h2>Sửa thành công</h2>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success " data-dismiss="modal">OK</button>
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
					<h2>Bạn có chắc chắn xóa không?</h2>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger " data-dismiss="modal">Cancel</button>
					<button id="xoathanhcong" class="btn btn-success "
						data-dismiss="modal">OK</button>

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
					<h2>Đã xóa thành công</h2>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success " data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <script>
			$(document).ready(function() {
				$("#myNopBai").click(function() {
					$("#myModal").modal({
						backdrop : "static"
					});
				});
				$("#thanhcong").click(function() {
					$("#myModal1").modal({
						backdrop : "static"
					});
				});
				$("#themthanhcong").click(function() {
					$("#myModal2").modal({
						backdrop : "static"
					});
				});

				$("#suathanhcong").click(function() {
					$("#myModal4").modal({
						backdrop : "static"
					});
				});
				$("#xoa").click(function() {
					$("#myModal5").modal({
						backdrop : "static"
					});
				});
				$("#xoathanhcong").click(function() {
					$("#myModal6").modal({
						backdrop : "static"
					});
				});
			});
		</script> -->
	<script type="text/javascript">
			function ngay() {
				document.getElementById("NhapPhongThi")
				$('.input-append').datetimepicker({
					pickTime : false
				});
			};
		</script>
</body>
</html>