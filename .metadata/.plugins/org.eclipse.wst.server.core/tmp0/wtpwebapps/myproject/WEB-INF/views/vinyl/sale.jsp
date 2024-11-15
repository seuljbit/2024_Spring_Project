<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sale</title>
	<link rel="stylesheet" href="../resources/css/sale.css">
	<link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
	<link rel="stylesheet" href="<c:url value='/resources/css/side.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>
    <div class="container">
        <jsp:include page="../layout/header.jsp" />

        <div class="content">
            <div class="inner">
                <ul>
                    <c:forEach var="album" items="${lpAlbums}" varStatus="status">
                       <c:if test="${status.index % 5 == 0}">
                            <li class="shelf">
                        </c:if>

                        <div class="lp-album">
                            <a href="<c:url value='/vinyl/detail?lpId=${album.lpId}' />">
                                 <img src="<c:url value='${album.lpImagePath}' />" alt="${album.lpTitle}">
                                 <%-- <img src="/resources/image/in_utero.jpg.jpg" alt="${album.lpTitle}"> --%>
                                <div class="lp-text">
                                    <span class="lp-title">${album.lpTitle}</span>
                                    <span class="lp-artist">${album.lpArtist}</span>
                                    <span class="lp-price">${album.lpPrice}원</span>
                                </div>
                            </a>
                        </div>

                        <c:if test="${status.index % 5 == 4 || status.last}">
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

	
   <jsp:include page="../layout/footer.jsp" />

    <script>
        document.querySelector('.menu-btn').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.add('active');
            document.querySelector('.overlay').style.display = 'block';
        });
        
        document.querySelector('.close-btn').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.remove('active');
            document.querySelector('.overlay').style.display = 'none';
        });

        document.getElementById('search-btn').addEventListener('click', function() {
            document.querySelector('.search-bar').classList.add('active');
            document.querySelector('.overlay').style.display = 'block';
        });
        
        document.querySelector('.overlay').addEventListener('click', function() {
            document.querySelector('.sidebar').classList.remove('active');
            document.querySelector('.search-bar').classList.remove('active');
            this.style.display = 'none';
        });
    </script>
</html>