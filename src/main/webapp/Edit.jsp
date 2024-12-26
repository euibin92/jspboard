<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function validateForm(form){
		if(form.name.value == ""){
			alert("이름을 입력하세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(form.content.value == ""){
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="form-check form-switch" style="position: absolute; right: 10px">
		<input class="form-check-input" type="checkbox" id="mySwitch" name="darkmode" value="yes" /> 
		<label class="form-check-label" for="mySwitch">Dark Mode</label>
	</div>
	<div class = "container" style="margin-top: 20px"> <!-- 좌우 여백 생김 -->
		<h2>수정하기</h2>
		<form name="writeFrm" method="post" enctype="multipart/form-data" action="/edit.do" onsubmit="return validateForm(this);">
			<input type = "hidden" name="idx" value="${dto.idx}"/>
			<input type = "hidden" name="prevOfile" value="${dto.ofile}"/>
			<input type = "hidden" name="prevSfile" value="${dto.sfile}"/>
			
			<table border="1" width="90%" class="table table-striped">
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="name" class="form-control" style="width:150px;" value="${dto.name}" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" class="form-control" style="width:90%;" value="${dto.title}" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name = "content" class="form-control" style="width:90%; height:100px;">${dto.content}</textarea>
					</td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td>
						<input type="file" name="ofile" class="form-control" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type = "submit" class = "btn btn-primary btn-sm">완료</button>
						<button type = "reset" class = "btn btn-primary btn-sm">취소</button>
						<button type = "button" class = "btn btn-primary btn-sm" onclick="location.href='/list.do';">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
		<script>
		const darkSwitch = document.querySelector("#mySwitch");
		let isChecked = true;
		darkSwitch.onclick = function() {
			if (isChecked) {
				document.querySelector("html").setAttribute("data-bs-theme", "dark"); 
				isChecked = false;
			} else {
				document.querySelector("html").setAttribute("data-bs-theme", "");
				isChecked = true;
			}
		};
	</script>
</body>
</html>