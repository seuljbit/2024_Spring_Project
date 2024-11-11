<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${lp.lpTitle} - LP Details</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/detail.css' />">
</head>
<body>
    <div class="lp-details-container">
        <h1>${lp.lpTitle}</h1>
        <p><strong>Artist:</strong> ${lp.lpArtist}</p>
        <p><strong>Genre:</strong> ${lp.lpGenre}</p>
        <p><strong>Price:</strong> ${lp.lpPrice}원</p>
        <p><strong>Description:</strong> ${lp.lpDescription}</p>
        <p><strong>Tracks:</strong> ${lp.lpTract}</p>
        <div>
            <img src="<c:url value='${lp.lpImagePath}' />" alt="${lpDetails.lpTitle}" width="300px">
        </div>
    </div>
</body>
</html>
