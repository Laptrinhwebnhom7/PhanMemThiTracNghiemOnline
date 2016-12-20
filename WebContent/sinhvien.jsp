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
<title>sinhvien</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>
</head>
<body ng-app="">

	<% HttpSession sess = request.getSession(false); %>
	
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline" user="root"
		password="trungdung29" />
	
	<div id="header">
		<sql:query var="result" dataSource="${ data}"> select  * from ThongTin_TatCaUser_View where MaTK = '<%= sess.getAttribute("taikhoan") %>'</sql:query>
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
									id="IDDoiMatKhau"><strong>Đổi mật khẩu</strong></a></li>
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
						<li class="active"><a href="#thongbao" data-toggle="tab"><img
								src="img/thongbao.png" height="40px" width="40px"></img>thông
									báo</a></li>
						<li><a href="#xemlichthi" data-toggle="tab"><img
								src="img/lich.png" height="40px" width="40px"></img>Xem lịch thi</a></li>
						<li><a href="#bailamthi" data-toggle="tab"><img
								src="img/soan-lambaithi.png" height="40px" width="40px"></img>Làm
									bài thi</a></li>
						<li><a href="#xemdiem" data-toggle="tab"><img
								src="img/xemdiemthi.png" height="40px" width="40px"></img>Xem
									điểm</a></li>
						<li><a href="#thongtincanhan" data-toggle="tab"><img
								src="img/thongtincanhan.png" height="40px" width="40px"></img>Thông
									tin cá nhân</a></li>
					</ul>
					<br> <br>
				</div>
				<div class="tab-content col-md-10  danhsach1">
					<div class="tab-pane fade in active" id="thongbao">
						<div id="caibangsinhvien">
							<table style="background: #E6E6FA"
								class="table table-hover table-striped">
								
								<sql:query var="BangThongBao" dataSource="${data }"> select * from XemThongBao_View where MaTK ='<%= sess.getAttribute("taikhoan") %>'; </sql:query>
								
								<thead>
									<tr>
									
										<th class="cot1">TIÊU ĐỀ</th>
										<th class="cot2">NGƯỜI GỬI</th>
										<th class="cot3">THỜI GIAN GỬI</th>
										<th class="cot4">XEM CHI TIẾT</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${BangThongBao.rows }">
										<tr>
									
											<td class="cot1">${row.TieuDe }</td>
											<td class="cot2">${row.TenNguoiDung }</td>
											<td class="cot3">${row.ThoiGian }</td>
											<td class="cot4"><a href="#" data-id="${row.MaTB }" data-toggle="modal" data-target="#XemChiTietThongBao" id="ChiTiet" class="ChiTiet"
												onclick="">chi tiết</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- thongbao -->
					
					
					<!-- XemchitietThongBao_Script -->
					<SCRIPT type="text/javascript">
						$(document).ready(function(){
							$(".ChiTiet").click(function(){
								var MaTB = $(this).attr("data-id");
								$.get('XemChiTietThongBao',{MaTB : MaTB},function(resp){
									//alert(resp.ChiTietTB);
									$("#XemChiTietThongBao .noidungTB").text(resp.ChiTietTB);	
								});
							});
						});
					</SCRIPT>
					
					<!-- XemLichThi_Form -->
					<div class=" tab-pane fade" id="xemlichthi">
						<div
							style="background: #E6E6FA; padding: 25px 25px; color: #0000CC">

								<form class="form-inline">
									<div class="form-group" style="padding-right: 20px">
										<label style="padding-right: 20px">Họ tên: </label>
										<c:forEach var="row" items="${result.rows}">
											<c:out value="${row.TenNguoiDung}"></c:out>
										</c:forEach>
									</div>
									<div class="form-group">
										<label style="padding-right: 6px">Mã số:</label>
										
										<c:forEach var="row" items="${result.rows}">
											<c:out value="${row.MaTK}"></c:out>
										</c:forEach>
									</div>
								</form> <br>
									<form class="form-inline">

										<div class="form-group" style="padding-right: 23px">
											<label style="padding-right: 37px">Lớp:</label> <c:forEach
													var="row" items="${result.rows }">
													<c:out value="${row.MaLop }"></c:out>
												</c:forEach>
										</div>
									</form>
						</div>
					<br>
					<div id="caibangsinhvien_XemLichThi" >
						<table 
							class="table table-hover table-striped ">
							<thead>
								<tr>
									<th class="cot1">MÔN HỌC</th>
									<th class="cot2">PHÒNG THI</th>
									<th class="cot3">NGÀY THI</th>
									<th class="cot4">GIỜ THI</th>
									<th class="cot1">THỜI GIAN</th>
								</tr>
							</thead>

							<sql:query var="BangLichThi" dataSource="${data }">   select * from XemLichThi_view where MaTK ='<%=sess.getAttribute("taikhoan")%>'
																			 order by NgayThi DESC;</sql:query>

							<tbody>
								<c:forEach var="row" items="${BangLichThi.rows }">
									<tr>
										<td class="cot1">${row.TenMon }</td>
										<td class="cot2">${row.TenPhong }</td>
										<td class="cot2">${row.NgayThi }</td>
										<td class="cot2">${row.GioBatDau }</td>
										<td class="cot3">${row.ThoiGian }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
					
					
					<!-- KiemTraTinhTrangThi_Script -->
					<SCRIPT type="text/javascript">
						$(document).ready(function(){
							$("#NutKiemTra").click(function(){
								var PhongThi = $("#txtPhongThi").val();
								var MaTK = <%= sess.getAttribute("taikhoan") %>;
								$.post('KiemTraTinhTrangThi',{PhongThi:PhongThi,MaTK: MaTK},function(response){
									if(response.kq == "1"){
										 $('#btnBatDau').attr('disabled', true);
										 $("#CoTrongTimeThi").hide();
										 $("#KhongCoTrongTimeThi").show();
									}
									else{
										if(response.kq == MaTK){
											 $('#btnBatDau').attr('disabled', false);
											 $("#CoTrongTimeThi").show();
											 $("#KhongCoTrongTimeThi").hide();
											 $("#txtMaDeVaoThi").val(response.MaDe);
										}
										else{
											 $('#btnBatDau').attr('disabled', true);
											 $("#CoTrongTimeThi").hide();
											 $("#KhongCoTrongTimeThi").show();
										}
									}
								});
							});
						});
					</SCRIPT>
					
					
					<!-- LamBaiThi_form -->
				<div class=" tab-pane fade  " id="bailamthi">
					<form class="form-inline" action="MoBaiThi" method="get"
						style="background: #E6E6FA; padding: 10px 40px; text-align: center;">
						<div class="form-group">
							<label style="padding-right: 10px"></label>Nhập phòng thi:
							<div class="form-group">
								<input type="text" id="txtPhongThi" class="form-control"
									name="txtPhongThi" required="required"></input>
									<input hidden="hidden" type="text" id="txtMaDeVaoThi"
									name="txtMaDeVaoThi"></input>
							</div>
							<div class="form-group" style="padding-left: 40px">
								<a type="btn btn-success" id="NutKiemTra"
									class="btn btn-primary">Kiểm tra</a>
							</div>
							<input type="text" value="<%=sess.getAttribute("taikhoan")%>"
								hidden="hidden" name="txtMaTKKT"></input>
						</div>

						<div style="padding-top: 30px">
							<div style="color: red;">
								<p id="KhongCoTrongTimeThi" hidden="true">Không có trong
									thời gian thi!</p>
								<p id="CoTrongTimeThi" hidden="true">Đang trong thời gian
									thi. Nhấn nút Bắt đầu để làm bài</p>
							</div>
							<div>
								<input type="submit" class="btn btn-success" id="btnBatDau"
									value="Bắt đầu"> </input>
							</div>
						</div>
					</form>
				</div>


				<!-- XemDiemThi -->
					<div class=" tab-pane fade" id="xemdiem">
						<div
							style="background: #E6E6FA; padding: 25px 25px; color: #0000CC">
							<form class="form-inline">

								<div class="form-group" style="padding-right: 20px">
									<label style="padding-right: 20px">Họ tên: </label>
									<c:forEach var="row" items="${result.rows}">
										<c:out value="${row.TenNguoiDung}"></c:out>
									</c:forEach>
								</div>
								<div class="form-group">
									<label style="padding-right: 6px">Mã số:</label>
									<c:forEach var="row" items="${result.rows}">
										<c:out value="${row.MaTK}"></c:out>
									</c:forEach>
								</div>
							</form>
							<br>
								<form class="form-inline">

									<div class="form-group" style="padding-right: 23px">
										<label style="padding-right: 37px"></label>Lớp: <c:forEach
												var="row" items="${result.rows }">
												<c:out value="${row.MaLop }"></c:out>
											</c:forEach>
									</div>
								</form> 
						</div>
						<br>
						
						<sql:query var="BangKetQuaThi" dataSource="${data }"> select distinct * from XemKetQuaThi_view where MaTK ='<%= sess.getAttribute("taikhoan") %>' order by NgayTao DESC; </sql:query>
							<div id="caibangsinhvien_XemDiemThi">
								<table style="background: #E6E6FA"
									class="table table-hover table-striped">
									<thead>
										<tr>
											<th class="cot2">Mã học phần</th>
											<th class="cot3">Tên học phần</th>
											<th class="cot4">Tính chỉ</th>
											<th class="cot5">Điểm thi</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="row" items="${BangKetQuaThi.rows }">
										<tr>
											<td class="cot2">${row.MaHocPhan }</td>
											<td class="cot3">${row.TenMon }</td>
											<td class="cot4">${row.SoTC }</td>
											<td class="cot5">${row.KetQua }</td>
										</tr>
									</c:forEach>	
									</tbody>
								</table>
							</div>
					</div>
					<!-- xemdiem -->
					
					<div class=" tab-pane fade" id="thongtincanhan"
						style="font-size: 16px;">
						<div class="col-md-5 ">
							<div class=" panel panel-info ">
								<div class="panel-heading">Thông tin sinh viên</div>
								<div class="panel-body">
									<ul>
										<c:forEach var="row" items="${result.rows }">
											<ul class="list-inline">
												<li style="width: 200px;">Mã số sinh viên</li>
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
										</c:forEach>

										

										<c:forEach var="row" items="${result.rows}">
											<ul class="list-inline">
												<li style="width: 200px;">Thành phố</li>

												<li>: <c:out value="${row.TenTP }"></c:out></li>

											</ul>

											<ul class="list-inline">
												<li style="width: 200px;">Quốc gia</li>
												<li>: <c:out value="${row.TenQG }"></c:out></li>
											</ul>

										</c:forEach>


										<c:forEach var="row" items="${result.rows }">
											<ul class="list-inline">
												<li style="width: 200px;">Tình trạng học</li>
												<li>: <c:out value="${row.TenTinhTrangHV}"></c:out></li>
											</ul>
										</c:forEach>


									</ul>
								</div>
							</div>


							<div class=" panel panel-info ">
								<div class="panel-heading">Thông tin khóa học</div>
								<div class="panel-body">

									<c:forEach var="row" items="${result.rows }">
										<sql:query var="ThongTinKhoaHoc" dataSource="${data}"> select MaLop, TenKhoa,TenDaoTao,HeDaoTao
												from LopHoc,Khoa_Nganh,DaoTao,HeDaoTao
												where LopHoc.MaKhoa = Khoa_Nganh.MaKhoa 
												and LopHoc.MaDaoTao = DaoTao.MaDaoTao 
												and LopHoc.MaHeDaoTao = HeDaoTao.MaHeDaoTao 
												and lophoc.MaLop = '${row.MaLop}' 
									</sql:query>
									</c:forEach>
									<c:forEach var="row" items="${ThongTinKhoaHoc.rows }">
										<ul>
											<ul class="list-inline">
												<li style="width: 200px;">Lớp học</li>
												<li>: <c:out value="${row.MaLop }"></c:out>
												</li>
											</ul>
											<ul class="list-inline">
												<li style="width: 200px;">Khoa</li>
												<li>: <c:out value="${row.TenKhoa }"></c:out></li>
											</ul>
											<ul class="list-inline">
												<li style="width: 200px">Loại đào tạo</li>
												<li>: <c:out value="${row.TenDaoTao }"></c:out></li>
											</ul>
											<ul class="list-inline">
												<li style="width: 200px;">Hệ đào tạo</li>
												<li>: <c:out value="${row.HeDaoTao }"></c:out></li>
											</ul>
										</ul>
									</c:forEach>

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
													<li style="color: blue;">Thông tin liên lạc của sinh
														viên</li>
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
															</c:forEach>
														</li>
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
		<div style="padding-bottom: 60px">.</div> <footer id="footer"
			class=" navbar-fixed-bottom">
		<p>Copyright@TracNghiemOnline.com.vn</p>
		</footer> <script >
			function XemChiTiet() {
				$("#XemChiTietThongBao").modal({
					backdrop : true
				});
			}
			$(document).ready(function() {
				$("#IDDoiMatKhau").click(function() {
					$("#myModal").modal({
						backdrop : true
					});
				});
				$("#thanhcong").click(function() {
					$("#myModal1").modal({
						backdrop : true
					});
				});

			});
		</script>
		<div class="modal fade" id="XemChiTietThongBao" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">
						<p>Nội dung thông báo</p>
					</div>
					<div class="modal-body text-center">
						<h2 class="noidungTB"></h2>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal">OK</button>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="myModal1" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header text-center">
						<h3>Thông báo</h3>
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
		
		<div>
		</div> 
		
		<script type="text/javascript">
       
         $('#btnBatDau').attr('disabled', true); 
  		</script>
   
</body>
</html>
