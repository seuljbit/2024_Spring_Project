<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
        <header>
            <div id="search-btn">
                <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
                    <path d="M15.194,13.323l-2.996-2.996c0.734-1.053,1.168-2.33,1.168-3.711c0-3.59-2.91-6.5-6.5-6.5s-6.5,2.91-6.5,6.5 s2.91,6.5,6.5,6.5c1.121,0,2.175-0.283,3.096-0.783l3.111,3.111c0.586,0.586,1.535,0.586,2.121,0S15.78,13.909,15.194,13.323z M9.174,10.461c-0.677,0.407-1.46,0.655-2.308,0.655c-2.485,0-4.5-2.015-4.5-4.5s2.015-4.5,4.5-4.5s4.5,2.015,4.5,4.5 c0,1.052-0.376,2.007-0.98,2.773C10.048,9.816,9.642,10.179,9.174,10.461z"></path>
                </svg>
            </div>

			<div class="search-bar">
			    <div class="search-bar-inner">
			        <form action="/search" method="get">
			            <p> Search for anything! </p> <br>
			            <input type="text" name="keyword" value="${pgvo.keyword }" placeholder=" 검색어를 입력하세요">
			            <button type="submit"> 검색</button>
			        </form>
			    </div>
			</div>

            <div class="overlay" style="display: none;"></div> <!-- 추가: 오버레이 -->

            <div class="inner">
                <nav>
                    <ul class="nav-left">
                        <li class="nav-item"> <a href=""> INFO </a></li>
                        <li class="nav-item"> <a href="/vinyl/sale"> VINYL </a></li>
                        <li class="nav-item"> <a href="/board/list"> BOARD </a></li>
                    </ul>
                    <div class="logo-btn"> <a href="/"> <img src="<c:url value='/resources/image/lp.png' />" alt="" width="50px" height="50px"> </a> </div>
                    <ul class="nav-right">
                        <li class="nav-item"> <a href=""> LOGIN </a></li>
                        <li class="nav-item"> <a href=""> JOIN </a> </li>
                        <li class="nav-item"> <a href=""> ACCOUNT </a> </li>
                    </ul>
                </nav>
            </div>
        </header>
</html>