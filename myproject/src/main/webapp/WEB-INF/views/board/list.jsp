<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/side.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/boardList.css' />">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <jsp:include page="../layout/header.jsp" />

        <div class="inner list-inner">
            <div class="board-header"></div>

            <select class="board-select">
                <option value="ricj">전체</option>
                <option value="r">리뷰</option>
                <option value="i">정보</option>
                <option value="c">추천</option>
                <option value="j">자유</option>
            </select>

            <ul class="board-list">
                <c:forEach items="${list}" var="bdto">
                    <li class="list-item">
                        <div class="img-area <c:if test='${bdto.bvo.thumbnailPath == "/resources/image/lp.png"}'>default-img</c:if>">
                            <img src="${bdto.bvo.thumbnailPath}" 
                                 alt="썸네일" 
                                 class="thumbnail" 
                                 width="150px" 
                                 height="150px" />
                        </div>

                        <div class="text-area">
                            <div class="list-title">
                                <a href="/board/detail?bno=${bdto.bvo.bno}">
                                    <b>[${bdto.bvo.group}] ${bdto.bvo.title}</b>
                                </a>
                            </div>
                            <div class="list-writer">
                                <span>${bdto.bvo.writer}</span>
                                <c:if test="${bdto.bvo.cmtQty > 0}">
                                    <span>[${bdto.bvo.cmtQty}]</span>
                                </c:if>
                            </div>
                            <div class="list-regDate">
                                <span class="regDate">${bdto.bvo.regDate}</span>
                                <span class="readCount">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                    </svg> ${bdto.bvo.readCount}
                                </span>
                                <span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                        <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                                    </svg> ${bdto.bvo.recommend}
                                </span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>

            <div class="search-area">
                <form action="/board/list" method="get">
                    <select class="form-select" name="type">
                        <option value="twc" ${ph.pgvo.type eq 'twc' ? 'selected' : ''}>전체</option>
                        <option value="t" ${ph.pgvo.type eq 't' ? 'selected' : ''}>제목</option>
                        <option value="w" ${ph.pgvo.type eq 'w' ? 'selected' : ''}>작성자</option>
                        <option value="c" ${ph.pgvo.type eq 'c' ? 'selected' : ''}>내용</option>
                        <option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected' : ''}>제목 + 작성자</option>
                        <option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected' : ''}>작성자 + 내용</option>
                        <option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected' : ''}>제목 + 내용</option>
                    </select>
                    <input class="form-control me-2" name="keyword" type="search" placeholder="Search" value="${ph.pgvo.keyword}" aria-label="Search">
                    <input type="hidden" name="pageNo" value="1">
                    <input type="hidden" name="qty" value="${ph.pgvo.qty}">
                    <button type="submit" class="btn btn-success position-relative">검색</button>
                </form>
                <div><a href="/board/register">글쓰기</a></div>
            </div>
        </div>
    </div>
</body>
</html>
