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
<title>Nội dung đề thi</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="css/style1.css"></link>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/angular.min.js"></script>

</head>
<body>
	<sql:setDataSource var="data" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/qlthionline" user="root"
		password="trungdung29" />
	<sql:query var="NoiDungDe" dataSource="${data }"> select * from XemNoiDungDeThi_view where MaDe = '${param.id }' </sql:query>
	<sql:query var="DanhSachLopThi" dataSource="${data }"> select id,MaHocPhan from chitietlophoc_dethi where MaDe ='${param.id }' </sql:query>

	<div class="modal-content">
		<div class="modal-header" style="">
			<h3>
				Nội dung đề thi:
				<c:out value="${param.id }"></c:out>
			</h3>
		</div>



		<div class="row">
			<div class="col-sm-2 col-sm-offset-1" style="padding-top: 30px;">

				<div class="row">
					<label class="control-label"> Danh sách lớp thi </label>
				</div>
				<div class="row">
					<select multiple="multiple" size=10" class="form-control">
						<c:forEach var="row" items="${DanhSachLopThi.rows }">
							<option value="${row.id }">${row.MaHocPhan}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="col-sm-8" style="padding-top: 30px;">
				<c:forEach var="row" items="${ NoiDungDe.rows}">
					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label">Mã Câu:</label>
						</div>
						<div class="col-sm-10">
							<input type="text" readonly="readonly" value="${row.MaCauHoi }"
								style="text-align: center;" class="form-control"></input>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 25px">
							<label class="control-label" style="padding:;">Nội dung:</label>
						</div>
						<div class="col-sm-10">
							<textarea id="NoiDungCau" class="form-control" rows="4"
								readonly="readonly"> <c:out value="${row.NoiDung }"></c:out> </textarea>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label" style="padding:;">Câu A:</label>
						</div>
						<div class="col-sm-10">
							<input id="CauANoiDung" type="text" class="form-control"
								value="${row.CauA }" readonly="readonly"></input>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label" style="padding:;">Câu B:</label>
						</div>
						<div class="col-sm-10">
							<input id="CauBNoiDung" type="text" class="form-control"
								value="${row.CauB }" readonly="readonly"> </input>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label" style="padding:;">Câu C:</label>
						</div>
						<div class="col-sm-10">
							<input id="CauCNoiDung" type="text" class="form-control"
								value="${row.CauC }" readonly="readonly"></input>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label" style="padding:;">Câu D:</label>
						</div>
						<div class="col-sm-10">
							<input id="CauDNoiDung" type="text" class="form-control"
								value="${row.CauD }" readonly="readonly"></input>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2" style="text-align: right; padding-top: 6px">
							<label class="control-label" style="padding:;">Đáp án:</label>
						</div>
						<div class="col-sm-10">
							<input id="DapAn" type="text" size="3px;"
								style="text-align: center;" class="form-control"
								value="${row.DapAn }" readonly="readonly"></input>
						</div>
					</div>
					<br></br>
				</c:forEach>
			</div>

		</div>





	</div>
</body>
</html>