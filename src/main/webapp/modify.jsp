<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= isEdit ? "글 수정" : "글 수정" %></title>
</head>
<body>
<%@ include file="include/header.jsp" %>


<div class="board-container">
    <h2><%= isEdit ? "게시글 수정" : "게시글 수정" %></h2>

    <form action="<%= isEdit ? "modifyOk.do" : "writeOk.do" %>" method="post" class="edit-form">
        <% if(isEdit) { %>
            <!-- 수정 시 bnum hidden으로 전달 -->
            <input type="hidden" name="bnum" value="<%= boardDto.getBnum() %>">
        <% } %>

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="btitle" value="<%= isEdit ? boardDto.getBtitle() : "" %>" required />
        </div>

        <div class="form-group">
            <label for="author">작성자</label>
            <input type="text" id="author" name="memberid" value="<%= isEdit ? boardDto.getMemberid() : "" %>" readonly />
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="bcontent" rows="10" required><%= isEdit ? boardDto.getBcontent() : "" %></textarea>
        </div>

        <div class="form-buttons">
            <button type="submit" class="btn btn-primary"><%= isEdit ? "수정 저장" : "등록" %></button>
            <a href="javascript:history.go(-1)" class="btn btn-secondary">취소</a>
        </div>
    </form>
</div>

</body>
</html>