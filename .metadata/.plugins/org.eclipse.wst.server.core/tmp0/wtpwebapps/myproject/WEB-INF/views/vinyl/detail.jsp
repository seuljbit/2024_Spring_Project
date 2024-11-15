<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${lp.lpTitle} - LP Details</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/saledetail.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/side.css' />">
</head>
<body>
    <div class="container">
        <jsp:include page="../layout/header.jsp" />
        
        <div class="detail-inner">
        
        	<div class="sale-detail">
			    <div class="sale-detail-img-area">
			        <img src="<c:url value='${lp.lpImagePath}' />" alt="${lpDetails.lpTitle}" width="500px">
			    </div>
			    <div class="sale-detail-text-area">
			        <p class="artist">${lp.lpArtist}</p>
			        <h1>${lp.lpTitle}</h1>
			        <p>${lp.lpPrice} &#8361;</p>
			        <p class="genre">${lp.lpGenre}</p>
			        <p><strong>Description:</strong> ${lp.lpDescription}</p>
			        <div>
			            <strong>Tracks:</strong> ${lp.lpTract}
			        </div>
			    </div>
			</div>


			<div class="sale-review">
			
			</div>

        </div>
    </div>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
