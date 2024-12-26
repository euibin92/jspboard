<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="form-check form-switch" style="position: absolute; right: 10px">
		<input class="form-check-input" type="checkbox" id="mySwitch" name="darkmode" value="yes" />
		<label class="form-check-label" for="mySwitch">Dark Mode</label>
	</div>
	<a href="/list.do">게시판</a> <!-- 목록으로 가는 링크 -->

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