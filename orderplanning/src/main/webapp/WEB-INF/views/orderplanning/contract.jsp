<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Suraj">
<!--meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/core/bootstrap-5.min.css"
	type="text/css" />
<link rel="stylesheet" href="/resources/css/custom.css" type="text/css" />
<link rel="stylesheet" href="/resources/css/core/flag-icon.min.css" type="text/css" />
<title>계약 등록</title>
<script type="text/javascript" src="/resources/js/txn-add-scripts.js"></script>
<script type="text/javascript" src="/resources/js/common-scripts.js"></script>
<script type="text/javascript" src="/resources/js/navbar-scripts.js"></script>
</head>
<body>
	<div>
		<div>
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
				style="position: relative;">
				<div class="container-fluid">
					<a class="navbar-brand" href="#" onclick="goToHome();">
						<h2>
							<b>조달구매시스템</b>
						</h2>
					</a>
				</div>
				<div class="collapse navbar-collapse" id="navbarSupportedContent"
					style="position: absolute; left: 250px; top: 40px;">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="/orderplanning/itemInfo" id="inbound">품목 정보 등록</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="/orderplanning/contract"" id="outbound">계약 등록</a></li>
						<li class="nav-item" style="margin-left: 10px;"><a
							class="nav-link" href="/orderplanning/procurementPlan"" id="inbound">조달 계획 등록</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</nav>
			<div class="area"></div>
			<nav class="main-menu">
				<ul>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="procurement">
							<div class="nav-text" style="position: relative; left: 10px;">
								조달 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="order">
							<div class="nav-text" style="position: relative; left: 10px;">
								발주 관리</div>
					</a></li>
					<li class="has-subnav" style="font-size: 10px;"><a href="#"
						style="height: 50px;" id="stock">
							<div class="nav-text" style="position: relative; left: 10px;">
								자재 관리</div>
					</a></li>
				</ul>
			</nav>
			<br />
		</div>
	</div>
	<form method="POST" action="listTransactions"
		style="position: relative;">
		<div class="container"
			style="position: absolute; left: 250px; width: 3000px;">
			<div class="wrap">
				<div class="card">
					<div class="card-header">
						<b>계약 등록 및 조회</b>
					</div>
					<div class="card-body">
						<div class="row g-3">
							<div class="col-md-6">
								<label for="contactName" class="form-label">계약명: </label>
								<input type="text" class="form-control" id="contact_name" name="contact_name" />
							</div>
							<div class="col-md-6">
								<label for="subcontractorName" class="form-label">협력 업체명: </label>
								<select id="subcontractorName" class="form-select" tabindex="1" 
									id="subcontractor_name" name="subcontractor_name">
									<option selected>(협력 업체명)</option>
									<c:forEach items="${getSubcontractor}" var="subcontractor">
										<option><c:out value="${subcontractor.subcontractor_name}"></c:out></option>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="subcontractorTel" class="form-label">협력 업체 전화번호: </label>
								<input type="text" class="form-control" id="subcontractor_tel" name="subcontractor_tel" readonly />
							</div>
							<div class="col-md-6">
								<label for="subcontractorEmail" class="form-label">협력 업체 이메일: </label>
								<input type="text" class="form-control" id="subcontractor_email" name="subcontractor_email" readonly />
							</div>
							<div class="col-md-6">
								<label for="subcontractorPerson" class="form-label">협력 업체 담당자: </label>
								<input type="text" class="form-control" id="subcontractor_person" name="subcontractor_person" readonly />
							</div>
							<div class="col-md-6">
								<label for="itemCode" class="form-label">품목 코드: </label>
								<select id="itemCode" class="form-select" tabindex="1" 
									id="item_code" name="item_code">
									<option selected>(품목 코드)</option>
									<c:forEach items="${getItemInfoForContract}" var="item">
										<option><c:out value="${item.item_code}"></c:out>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6">
								<label for="productName" class="form-label">제품명: </label>
								<input type="text" class="form-control" id="product_name" name="product_name" readonly />
							</div>
							<div class="col-md-6">
								<label for="itemName" class="form-label">품목명: </label>
								<input type="text" class="form-control" id="item_name" name="item_name" readonly />
							</div>
							<div class="col-md-6">
								<label for="standard" class="form-label">규격: </label>
								<input type="text" class="form-control" id="standard" name="standard" readonly />
							</div>
							<div class="col-md-6">
								<label for="material" class="form-label">재질: </label>
								<input type="text" class="form-control" id="material" name="material" readonly />
							</div>
							<div class="col-md-6">
								<label for="specificationFile" class="form-label">제작 사양: </label>
								<input type="text" class="form-control" id="specification_file" name="specification_file" readonly />
							</div>
							<div class="col-md-6">
								<label for="drawFile" class="form-label">도면 파일: </label>
								<input type="text" class="form-control" id="draw_file" name="draw_file" readonly />
							</div>
							<div class="col-md-6">
								<label for="supplyPrice" class="form-label">공급 가격: </label>
								<input type="number" class="form-control" id="supply_price" name="supply_price" />
							</div>
							<div class="col-md-6">
								<label for="agreementDate" class="form-label">계약 날짜: </label>
								<input
									type="date" id="agreement_date"
									class="form-control datepicker"
									name="agreement_date"
									aria-label="agreementDate">
							</div>
							<div class="col-md-6">
								<label for="leadtime" class="form-label">L/T: </label>
								<input type="number" class="form-control" id="leadtime" name="leadtime" />
							</div>
							<div class="col-md-6">
								<label for="contactFile" class="form-label">계약서 첨부: </label>
								<input type="file" class="form-control" id="contact_file" name="contact_file" />
							</div>
							<div>
                              <label for="address" class="form-label">비고: </label>
							  <textarea rows="3" class="form-control" id="text" name="text"></textarea>
                            </div>
                            <div class="col-md-1">
								<button type="button" class="btn btn-primary btn-success">등록</button>
							</div>
							<div class="col-md-1">
								<button type="button" class="btn btn-primary btn-primary">조회</button>
							</div>
							<div class="col-md-1">
                            	<button type="button" class="btn btn-primary btn-danger">삭제</button>
                            </div>
                            <div class="col-md-1">
                            	<button type="button" class="btn btn-primary btn-primary">수정</button>
                            </div>
                        </div>
					</div>
				</div>
				<br /> <br />
				<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
		                <symbol id="check-circle-fill" fill="currentColor"
						viewBox="0 0 16 16">
		                    <path
						d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
		                </symbol>
		                <symbol id="info-fill" fill="currentColor"
						viewBox="0 0 16 16">
		                    <path
						d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
		                </symbol>
		                <symbol id="exclamation-triangle-fill"
						fill="currentColor" viewBox="0 0 16 16">
		                    <path
						d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
		                </symbol>
		            </svg>

				<table id='myTable'
					class="table table-bordered table-striped table-hover caption-top">
					<caption style="color: black;">
						<b>계약 품목 정보 목록</b>
					</caption>
					<thead class="table-dark">
						<tr>
							<th scope="col" style="text-align: center;"></th>
                            <th scope="col" style="text-align: center;">순번</th>
                            <th scope="col" style="text-align: center;">계약명</th>
                            <th scope="col" style="text-align: center;">품목 코드</th>
                            <th scope="col" style="text-align: center;">제품명</th>
                            <th scope="col" style="text-align: center;">품목명</th>
                            <th scope="col" style="text-align: center;">협력 업체</th>
                            <th scope="col" style="text-align: center;">계약 날짜</th>
                            <th scope="col" style="text-align: center;">L/T</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="no" value="0"/>
					<c:forEach items="${ contract }" var="contract">
						<tr>
							<th scope="row" style="text-align: center;"><input type="checkbox" name="selection" value="1" /></th>
							<td style="text-align: center;">${ no = no + 1 }</td>
							<td style="text-align: center;"><span>${ contract.contract_name }</span></td>
							<td style="text-align: center;"><span>${ contract.item_code }</span></td>
							<td style="text-align: center;"><span>${ contract.product_name }</span></td>
							<td style="text-align: center;"><span>${ contract.item_name }</span></td>
							<td style="text-align: center;"><span>${ contract.subcontractor_name }</span></td>
							<td style="text-align: center;">
								<span>
									<fmt:parseDate value="${ contract.agreement_date }" var="agreement_date" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${ agreement_date }" pattern="yyyy-MM-dd"/>
								</span>
							</td>
							<td style="text-align: center;"><span>${ contract.leadtime }</span></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<input type="hidden" value="2" id="flag">
	<script src="/resources/js/core/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/popper.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/bootstrap-5.min.js" type="text/javascript"></script>
	<script src="/resources/js/core/jquery-ui.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).on('click', "input[type='checkbox']", function() {
			if (this.checked) {
				const checkboxes = $("input[type='checkbox']");
				for (let ind = 0; ind < checkboxes.length; ind++) {
					checkboxes[ind].checked = false;
				}
				this.checked = true;
			} else {
				this.checked = false;
			}
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(function() {
				$("#agreementDate").datepicker();
			});
			$('#subcontractorName').change(function() {
				$("#subcontractorName").prop("disabled", false);
			});
		});
	</script>
	<script>
		if (document.getElementById("flag").value == 2) {
			document.getElementById("outbound").style.backgroundColor = "#fff";
			document.getElementById("outbound").style.color = "#000000";
			document.getElementById("outbound").style.fontWeight = "bold";
			document.getElementById("procurement").style.backgroundColor = "#fff";
			document.getElementById("procurement").style.color = "#000000";
			document.getElementById("procurement").style.fontWeight = "bold";
		}
	</script>
</body>
</html>