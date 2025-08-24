<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 리스트</title>
    <link rel="stylesheet" href="css/board.css">
</head>
<body>
<%@ include file="include/header.jsp" %>

      <h2 style="text-align: center;">게시판 리스트</h2>
    <hr>

    <!-- 검색 영역 -->
    <form action="boardList.do" method="get" class="search-form">
        <select name="searchType">
            <option value="btitle">제목</option>
            <option value="memberid">작성자</option>
            <option value="bcontent">내용</option>
        </select>
        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
        <button type="submit">검색</button>
    </form>

    <!-- 게시판 리스트 -->
    <table class="board-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bDto" items="${boardList}">
                <tr>
                    <td>${bDto.bno}</td>
                    <td>
                        <a href="boardDetail.do?bnum=${bDto.bnum}">
                            ${bDto.btitle}
                        </a>
                    </td>
                    <td>${bDto.memberid}</td>
                    <td>${bDto.bdate}</td>
                    <td>${bDto.bhit}</td>
                </tr>
            </c:forEach>

            <c:if test="${empty boardList}">
                <tr>
                    <td colspan="5" style="text-align:center;">등록된 글이 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>

</body>
<%@ include file="include/footer.jsp" %>
</body>
</html>
