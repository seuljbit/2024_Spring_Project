<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${lp.lpTitle} - LP Details</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/saledetail.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/side.css' />">
</head>

<jsp:include page="../layout/header.jsp" />
<div class="container">

	
	<!-- enctype : multipart/form-data -->
	<form action="/board/insert" method="post" enctype="multipart/form-data">
		
	
	
	
		<div class="mb-3">
			<label for="t" class="form-label">title</label>
			<input type="text" class="form-control" id="t" name="title" placeholder="title...">
		</div>
		
		<div>
			<select class="board-group-select" name="group">
				<option value="정보"> 정보 </option>
				<option value="추천"> 추천 </option>
				<option value="자유"> 자유 </option>
			</select>
		</div>
		
		<div class="mb-3">
			<label for="w" class="form-label">writer</label>
			<input type="text" class="form-control" id="w" name="writer">
		</div>
		
		<div class="mb-3">
			<label for="c" class="form-label">content</label>
			<textarea class="form-control" id="c" rows="3" name="content"></textarea>
		</div>

		<!-- 첨부파일 입력 라인 추가 -->
		<div class="mb-3">
			<label for="file" class="form-label"></label>
			<input type="file" class="form-control" id="file" name="files" multiple="multiple" style="display: none">
			<button type="button" class="btn btn-info" id="trigger">FileUpload...</button>
		</div>

		<!-- 첨부파일 표시 라인 추가 -->
		<div class="mb-3" id="fileZone"></div>
		<button type="submit" class="btn btn-primary" id="regBtn">register</button>
	</form>
	
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
</body>
</div>
</body>