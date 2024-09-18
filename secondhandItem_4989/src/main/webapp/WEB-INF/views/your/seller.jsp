<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${otherUserDTO.member_id}님의 프로필</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUserDTO.member_id}" style="color: #372161;">${otherUserDTO.member_id}님의 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUserDTO.member_id}" style="color: #372161;">${otherUserDTO.member_id}님의 프로필</a>
		</div>
	</header>
	<div class="content-container">
<aside class="side-nav">
	<h3>${otherUserDTO.member_id}님의 페이지</h3>
	<br>
	<ul>
		<li><a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUserDTO.member_id}">판매 내역</a></li>
	</ul>
</aside>
		<div class="main-container-side-profile">
		<main>
			<h2>${otherUserDTO.member_id}님의 프로필</h2>
			<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="reportForm">
                                <div class="accordion-subject"><b>신고 내용</b></div>
                                <textarea class="form-control" placeholder="신고 사유를 입력해주세요" id="report_contents" name="report_contents" required></textarea>
                                <button type="button" class="btn btn-primary mt-3" id="reportBtn" onclick="submitReport()">신고하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div style="text-align: right;">
            	<button class="button" id="openReportModal" data-toggle="modal" data-target="#reportModal" 
            	style="padding: 10px; border-radius: 10px; background-color: #4E229E; color: white; border: 1px solid #4E229E; cursor: pointer;">신고하기</button>
			</div>
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/upload/${otherUserDTO.profile_img}" class="profile-circle">
			</div>
			<p class="profile-nickname">${otherUserDTO.nickname}</p>
			<p class="profile-nickname">누적 거래 횟수</p>
			<p class="profile-nickname">${otherUserDTO.allTX}</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script>
function submitReport() {
    var reportContents = $("#report_contents").val();
    var reporterId = "${sessionScope.member_id}";
    var reporteeId = "${otherUserDTO.member_id}";
    var reportedItemId = "${productDTO.product_id}";
    var reportType = "상품"; // 고정값

    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/product/report",
        data: {
            reporter_id: reporterId,
            reportee_id: reporteeId,
            reported_item_id: reportedItemId,
            report_type: reportType,
            report_contents: reportContents
        },
        success: function(response) {
            if (response.success) {
                alert("신고가 접수되었습니다.");
                $('#reportModal').modal('hide');
            } else {
                alert("신고 접수 중 오류가 발생했습니다.");
            }
        },
        error: function() {
            alert("서버 통신 중 오류가 발생했습니다.");
        }
    });
}
</script>

</body>
</html>