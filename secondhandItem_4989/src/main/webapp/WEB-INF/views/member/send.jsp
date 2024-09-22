<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989 인증번호 입력</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/send.css">
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			인증번호 입력
		</div>
   </header>
   
  <section>
	<div id="container">
	  <main>

		 <form action="${pageContext.request.contextPath}/member/verify" method="post" name="fr">
			<div class="form-group">
                <label for="userId">인증번호</label>
                <input type="text" id="token1" name="token1" placeholder="인증번호 6자리" required>
                <button type="submit" class="submit-button">인증하기</button>
            </div>
           
			<% out.println(session.getAttribute("name")); %>
		</form>
	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
