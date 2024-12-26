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
	function validateForm(form) { // 필수 항목 입력 확인
		if(form.name.value == ""){
			alert("작성자를 입력하세요.");
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
		if(form.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
		
		// 파일 크기 체크
		var inputFile = document.getElementById("file");
		var files = inputFile.files;
		if(files[0].size > 5*1024*1024){ // 첫번재 파일의 크기가 5MB가 초과되면
			alert("파일 크기는 5Mbyte를 초과할 수 없습니다.");
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
		<h2>글쓰기</h2>
		<form name="writeFrm" method="post" action="/write.do" enctype="multipart/form-data" onsubmit="return validateForm(this);">
			<table border="1" width="90%" class="table table-striped">
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="name" class="form-control" style="width:150px;" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="title" class="form-control" style="width:90%;" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="content" class="form-control" rows="20" style="width:90%;"></textarea>
					</td>
				</tr>
				<tr>
					<td>첨부 파일</td>
					<td>
						<input type="file" name="ofile" class="form-control" id="file"/>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pass" class="form-control" style="width:100px" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"> <!-- 가로 방향으로 두 칸을 합쳐라 -->
						<button type="submit" class = "btn btn-primary btn-sm">등록</button>
						<button type="reset" class = "btn btn-primary btn-sm">취소</button>
						<button type="button" class = "btn btn-primary btn-sm" onclick="location.href='/list.do';">목록</button>
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