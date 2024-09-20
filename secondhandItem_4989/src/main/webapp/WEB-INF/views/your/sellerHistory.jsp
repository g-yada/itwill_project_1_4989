<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${otherUser}님의 판매 내역</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
<style>

textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
}
  
.modal {
  display: none;
  text-align: center;
  position: fixed;
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 8% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 500px;
  max-width: 80%;
  height: 750px;
  max-height: 80vh;
  overflow: auto;
  box-sizing: border-box;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  text-align: right;
}

.close:hover, .close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.stars {
display: inline-block;
}

.stars1 {
display: inline-block;
}

.star {
  font-size: 24px;
  cursor: pointer;
  color: gray;
}

.star1 {
  font-size: 24px;
  cursor: pointer;
  color: gray;
}

.star.selected {
  color: gold;
}

.star1.active {
    color: gold;
}
</style>

</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUser}" style="color: #372161;">${otherUser}님의 프로필 </a> >
   			<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}" style="color: #372161;">${otherUser}님의 판매 내역</a>
		</div>
	</header>
	<div class="content-container">
	<aside class="side-nav">
		<h3 style="overflow:hidden; text-overflow:ellipsis;">Other User</h3>
		<br>
		<ul>
			<li><a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUser}">${otherUser}님의 프로필</a></li>
			<li><a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}">판매 내역</a></li>
		</ul>
	</aside>
		<div class="main-container-side-profile">
		<main>
			<h2>판매 내역</h2>
			<div class="profile-a">				
				<c:if test="${empty param.sort}">		
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=priceAsc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=dateAsc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'priceDesc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=priceAsc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'priceAsc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'dateDesc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=dateAsc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'dateAsc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<br>
				<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&sort=dateDesc&sale=pro'">판매 중</button>
				<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&sort=dateDesc&sale=rsv'">예약 중</button>
				<button onclick="location.href='${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&sort=dateDesc&sale=com'">판매 완료</button>
			</div>
			<div class="profile-item-list">
			<c:forEach var="productDTO" items="${productList}">
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" class="profile-item-imagesell">
					</div>
					<div class="profile-item-image-div">
					<c:if test="${productDTO.trade_status eq '거래 가능'}">
						<div class="profile-item-image-cover1">
							판매 중
						</div>
					</c:if>
					<c:if test="${productDTO.trade_status eq '거래 완료'}">
						<div class="profile-item-image-cover2">
							판매 완료
						</div>	
					</c:if>
					<c:if test="${productDTO.trade_status eq '예약 중'}">
						<div class="profile-item-image-cover3">
							예약 중
						</div>	
					</c:if>
					<div class="profile-item-name" title="${productDTO.product_name}">
						<h5>${productDTO.product_name}</h5>
					</div>
					<div class="profile-item-name1" title="${productDTO.product_price}">
						<h5><fmt:formatNumber value="${productDTO.product_price}" type="number" pattern="#,###"/>원</h5>
					</div>
					<div class="profile-item-review2" data-date="${productDTO.created_datetime}">
<!-- 						평점 : 4.7&emsp;&emsp; -->
						<div class="zzim-time" style="display: inline;">
						</div>
					</div>
					<div class="profile-item-review3">
						<c:if test="${productDTO.trade_status eq '거래 완료'}">
							<button>구매 후기</button>
						</c:if>
					</div>
					<div class="profile-item-detail1">
						<a href="${pageContext.request.contextPath}/product/detail?product_id=${productDTO.product_id}">상품 상세 보기</a>
					</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="pagination1">
				<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=1&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></a>
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage - 1}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${i}&sort=${pageDTO.sort}&sale=${pageDTO.sale}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${i}&sort=${pageDTO.sort}&sale=${pageDTO.sale}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.currentPage + 1}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음"></a>
				</c:if>
				<a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUser}&pageNum=${pageDTO.pageCount}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막"></a>
			</div>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
	    function formatTimeAgo(date) {
	        const now = new Date();
	        const diffInSeconds = Math.floor((now - date) / 1000);
	        const diffInMinutes = Math.floor(diffInSeconds / 60);
	        const diffInHours = Math.floor(diffInMinutes / 60);
	        const diffInDays = Math.floor(diffInHours / 24);
	        const diffInMonths = Math.floor(diffInDays / 30);
	        const diffInYears = Math.floor(diffInDays / 365);
	        if (diffInDays < 30) {
	        	if(diffInHours < 24) {
	        		if(diffInMinutes < 60) {
	        			return diffInMinutes.toString() + "분 전";
	        		}
	        		return diffInHours.toString() + "시간 전";
	        	}
	        	return diffInDays.toString() + "일 전";
	        } else if (diffInDays >= 30 && diffInDays < 365) {
	            return diffInMonths.toString() + "달 전";
	        } else {
	            return diffInYears.toString() + "년 전";
	        }
	    }
	
	    const reviewElements = document.querySelectorAll('.profile-item-review2');
	    reviewElements.forEach(function(element) {
	        const dateStr = element.getAttribute('data-date');
	        const date = new Date(dateStr);
	        if (!isNaN(date.getTime())) {
	            const timeAgo = formatTimeAgo(date);
	            const timeElement = element.querySelector('.zzim-time');
	            if (timeElement) {
	                timeElement.textContent = timeAgo;
	            }
	        }
	    });
	});
</script>

</body>
</html>