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
<title>lambaithi</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="header">
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
			style="background-image: url(img/hinhHeader.png); background-repeat: no-repeat; background-size: 100% auto; height: 100px">

		</nav>
	</div>

	<!-- header -->

	<%
		HttpSession sess = request.getSession(false);
	%>

	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline" user="root"
		password="trungdung29" />
	<sql:query var="BangCauhoi" dataSource="${data }">  SELECT @row := @row + 1 AS STT, t.* FROM BangCauHoiLamBai_view t,
									 (SELECT @row := 0) r where MaDe = '<%=sess.getAttribute("madeKT")%>'  </sql:query>

	<div id="content">
		<div class="container">

			<div id="ThongTinSinhVienDangThi">
				<div class="row">
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Mã đề:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" id="txtMaDe" class="form-control"
							name="txtMaDe" value="<%=sess.getAttribute("madeKT")%>"
							readonly="readonly"></input>
					</div>

					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Môn thi:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" size="10px" id="MonThi" class="form-control"
							name="" value="<%=sess.getAttribute("TenMon")%>"
							readonly="readonly"></input>
					</div>
				</div>

				<div class="row" style="padding-top: 15px">
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Phòng thi:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" id="txtPhongThi" class="form-control"
							name="txtPhongThi" value="<%=sess.getAttribute("TenPhong")%>"
							readonly="readonly"></input>
					</div>
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Ngày thi:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" id="txtNgayThi" class="form-control"
							name="txtNgayThi" value="<%=sess.getAttribute("NgayThi")%>"
							readonly="readonly"></input>
					</div>
				</div>

				<div class="row" style="padding-top: 15px">
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Tên sinh viên:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="TenSinhVien" name=""
							value="<%=sess.getAttribute("TenNguoiDung")%>"
							readonly="readonly"></input>
					</div>
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> MSSV:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" id="txtMaTK" class="form-control"
							name="txtMaTK" value="<%=sess.getAttribute("MaTK")%>"
							readonly="readonly"></input>
					</div>
				</div>

				<div class="row" style="padding-top: 15px">
					<div class="col-sm-2" style="text-align: right;">
						<label class="control-label"> Thời gian bắt đầu:</label>
					</div>
					<div class="col-sm-3">
						<input type="text" size="5px" id="ThoiGianBatDau"
							class="form-control" name=""
							value="<%=sess.getAttribute("GioBatDau")%>" readonly="readonly"></input>
					</div>
					<div class="col-sm-2" style="text-align: right;">
						<label> Thời gian còn lại:</label>
					</div>
					<div class="col-sm-2">
						<div class="form-control btn-danger" id="demnguoc"></div>
					</div>
					<div class="col-sm-3">
						<button type="button" id="myNopBai" class="btn btn-success"
							onclick="NopBaiThi()">Nộp bài</button>
					</div>

				</div>

			</div>

			<!-- Choncauhoi_Script -->
			<SCRIPT type="text/javascript">
				$(document).ready(function() {
					$(".checkCauHoi").click(function() {
						var CauChon = $(this).val();
						var MaCauHoi = $(this).attr("name");
						var MaDe = $("#txtMaDe").val();
						var MaTK = $("#txtMaTK").val();
						$.post('LamBaiThi', {
							CauChon : CauChon,
							MaCauHoi : MaCauHoi,
							MaDe : MaDe,
							MaTK : MaTK
						}, function(response) {

						});
					});
				});
			</SCRIPT>

			<!-- NopBai_script -->
			<SCRIPT type="text/javascript">
				function NopBaiThi() {
					var r = confirm('Bạn thật sự muốn nộp bài?');
					if (r == true) {
						$("#formlambai input").prop("disabled", "disabled");
						$("#myModal").modal({
							backdrop : "static"
						});
						var MaDe = $("#txtMaDe").val();
						var MaTK = $("#txtMaTK").val();
						$.post('KiemTraDiemSo', {
							MaDe : MaDe,
							MaTK : MaTK
						}, function(response) {
							$("#txtSoCauDung").text(response.TongCauDung);
							var caudung = response.TongCauDung;
							var Tongcau = $("#txtTongSoCau").text();
							var KetQua = 0;
							KetQua = (parseFloat(10) / parseFloat(Tongcau))
									* parseFloat(caudung);
							$("#txtDiemSo").val(KetQua);
						});

						$("#demnguoc").remove();
					} else {

					}
				}
			</SCRIPT>


			<form id="formlambai">
				<div class="form-group col-sm-offset-2">

					<c:forEach var="row" items="${BangCauhoi.rows }">
						<section id="miSlide" class="carousel sline col-md-8"
							data-interval="false">
							<div class="carousel-inner">
								<div class="item active">

									<div class=" panel panel-danger ">
										<div class="panel-heading">
											<div style="font-size: 18px">
												<p>
													Câu
													<c:out value="${row.STT}"></c:out>
													:
												</p>
												<strong><c:out value="${row.NoiDung}"></c:out> </strong>
											</div>
										</div>
										<div class="panel-body">
											<div class="input-group">
												<div>
													<input type="checkbox" name="${row.MaCauHoi }"
														class="checkCauHoi" value="A"><label>A:<c:out
															value=" ${row.CauA }"></c:out>
													</label>
												</div>
												<div>
													<input type="checkbox" name="${row.MaCauHoi }"
														class="checkCauHoi" value="B"><label>B:<c:out
															value=" ${row.CauB }"></c:out>
													</label>
												</div>
												<div>
													<input type="checkbox" name="${row.MaCauHoi }"
														class="checkCauHoi" value="C"><label>C:<c:out
															value=" ${row.CauC }"></c:out>
													</label>
												</div>
												<div>
													<input type="checkbox" name="${row.MaCauHoi }"
														class="checkCauHoi" value="D"><label>D:<c:out
															value=" ${row.CauD }"></c:out>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</section>
					</c:forEach>
				</div>
			</form>
		</div>

	</div>

	<!-- content -->

	<div id="footer" class="navbar-fixed-bottom">
		Copyright@TracNghiemOnline.com.vn</div>
	<!-- footer -->
	<script type="text/javascript">
		$('input[type="checkbox"]').on(
				'change',
				function() {
					$('input[name="' + this.name + '"]').not(this).prop(
							'checked', false);
				});
	</script>





	<sql:query var="TongSoCauHoi" dataSource="${data }"> select dethi.TongSoCau from DeThi where made ='<%=sess.getAttribute("madeKT")%>'; </sql:query>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<form action="DiemDanhDaThi_LuuDiemSo" method="post">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h1>Kết quả thi</h1>
					</div>
					<input type="text" hidden="hidden" name="txtMaDeDiemDanh"
						value="<%=sess.getAttribute("madeKT")%>"></input> <input
						type="text" hidden="hidden" name="txtMaTKDiemDanh"
						value="<%=sess.getAttribute("MaTK")%>"></input>
						<input
						type="text" hidden="hidden" name="txtTenPhongDiemDanh"
						value="<%=sess.getAttribute("TenPhong")%>"></input>
						<input
						type="text" hidden="hidden" name="txtMaHPKetQua"
						value="<%=sess.getAttribute("MaHocPhan")%>"></input>
					<div class="modal-body">
						<div class="row ">
							<div class="col-sm-3 col-sm-offset-2" style="text-align: right;">
								<label>số câu đúng: </label>
							</div>
							<div class="col-sm-1" style="text-align: right;">
								<label id="txtSoCauDung" class=""></label> /
							</div>
							<div class="col-sm-1" style="text-align: left;">
								<label id="txtTongSoCau" class=""> <c:forEach var="row"
										items="${TongSoCauHoi.rows }">
										<c:out value="${row.TongSoCau }"></c:out>
									</c:forEach>
								</label>
							</div>
						</div>
						<div class="row" style="padding-top: 5px;">
							<div class="col-sm-3 col-sm-offset-2" style="text-align: right;">
								<label>Tổng điểm: </label>
							</div>
							<div class="col-sm-3">
								<input class="form-control" value="0" name="txtDiemSo" id="txtDiemSo"  ></input>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary" data-dismiss="modal">Quay lại</a> <input
							type="submit" value="Hoàn thành" class="btn btn-success"></input>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 	<script>
		$(document).ready(function() {
			$("#myNopBai").click(function() {
				$("#myModal").modal({
					backdrop : "static"
				});
			});
		});
	</script> -->
	<sql:query var="timeTemp" dataSource="${data }"> select time_to_sec( TimeDiff('<%=sess.getAttribute("GioKetThuc")%>',current_time()) ) as TongGio </sql:query>
	<c:forEach var="row" items="${timeTemp.rows }">
		<input type="text" id="txtTimeTemp" value="${row.TongGio }"
			hidden="hidden"></input>
	</c:forEach>

	<script type="text/javascript">
		var time = $("#txtTimeTemp").val(); // đơn vị là giây
		var phut = Math.floor(time / 60);
		var giay = time - phut * 60;
		var txtThoiGian = document.getElementById("demnguoc");

		var timer = setInterval(function() {
			if (giay == 0) {
				if (phut == 0) {
					clearInterval(timer);
					$("#formlambai input").prop("disabled", "disabled");
					$("#demnguoc").remove();
				/* 	document.getElementById("myNopBai").disabled = false; */
					txtThoiGian.innerHTML = 0 + ' ' + 'giây';
					return;

				} else {
					phut--;
					giay = 60;
				}
			}

			if (phut > 0) {
				var sophut = phut + ' phút';
			} else {
				var sophut = '';
			}
			txtThoiGian.innerHTML = sophut + ' ' + giay + ' ' + 'giây';
			giay--;
		}, 1000);
	</script>
</body>
</html>