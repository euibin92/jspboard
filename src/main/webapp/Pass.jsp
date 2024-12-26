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
	function validateForm(form) {
		if(form.pass.value == ""){ // 비밀번호가 입력되지 않으면
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
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
		<h2>비밀번호 검증</h2>
		<form name="writeFrm" method="post" action="/pass.do" onsubmit="return validateForm(this);">
			<!-- 화면에는 안 보이지만 글번호와 mode가 숨겨져서 넘어감 -->
			<input type = "hidden" name = "idx" value = "${param.idx}" />
			<input type = "hidden" name = "mode" value = "${param.mode}" />
			
			<table border="1" width="90%" class="table table-striped">
				<tr>
					<td style = "width:120px" align="center">비밀번호</td>
					<td>
						<input type="password" name = "pass" style = "width:250px" class="form-control" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type = "submit" class = "btn btn-primary btn-sm">확인</button>
						<button type = "reset" class = "btn btn-primary btn-sm">취소</button>
						<button type = "button" class = "btn btn-primary btn-sm" onclick = "location.href='/list.do';">목록</button>
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