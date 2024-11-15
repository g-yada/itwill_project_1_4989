<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>4989 관리자 메뉴</title>

	<jsp:include page="../inc/cssLink.jsp"></jsp:include>
	<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
	<link href="${pageContext.request.contextPath }/resources/css/admin/cspAdmin_table.css"  rel="stylesheet">
</head>
<body>
	<div class="page-wrapper">
        
        <!-- MENU SIDEBAR-->
        <jsp:include page="../inc/menu_sidebar.jsp"></jsp:include>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
	        <jsp:include page="../inc/header_in_page_container.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->
			
			<div class="main-content">
            <!-- 본문내용은-->
            <div class="container-fluid">
				<div class="col-lg-auto">
	                <h2 class="title-1 m-b-25">매입신청 관리</h2>
	                <div class="input-group mb-3 flex-right-50pct">
	                  <form action="${pageContext.request.contextPath }/admin/purchase" style="display:flex;">
					    <input type="text" class="form-control" name="search" placeholder="회원아이디, 상품명 등으로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" style="width:300px;">
					    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">
					  	  <img alt="검색" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					    </button>
					  </form>
					</div>
	                <div class="table-responsive table--no-card m-b-40">
	                    <table class="table table-borderless table-striped table-earning">
	                        <thead>
	                            <tr>
	                                <th id="purchase_id" class="text-center">매입ID</th>
	                                <th id="member_id" class="text-center">신청자ID</th>
	                                <th id="pc_item_name" class="text-center">매입상품</th>
	                                <th id="expected_grade" class="text-center">예상등급</th>
	                                <th id="expected_price" class="text-center">예상매입가</th>
	                                <th id="shipping_method" class="text-center">발송방법</th>
	                                <th id="request_date" class="text-center">신청일시</th>
	                                <th id="purchase_status" class="text-center">상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="purchaseList" items="${purchaseList }">
	                            <tr class="get-detail" data-purchase-id="${purchaseList.purchase_id }">
	                                <td class="text-center">${purchaseList.purchase_id}</td>
	                                <td class="text-center">${purchaseList.member_id}</td>
	                                <td class="text-center">
	                                <c:choose>
									    <c:when test="${fn:length(purchaseList.pc_item_name) > 10}">
									        ${fn:substring(purchaseList.pc_item_name, 0, 10)}...
									    </c:when>
									    <c:otherwise>
									        ${purchaseList.pc_item_name}
									    </c:otherwise>
									</c:choose>
	                                </td>
	                                <td class="text-center">${purchaseList.expected_grade}</td>
	                                <td class="text-center"><fmt:formatNumber value="${purchaseList.expected_price}" type="number"/></td>
	                                <td class="text-center">${purchaseList.shipping_method}</td>
	                                <td class="text-center"><fmt:formatDate value="${purchaseList.request_date}" pattern="yyyy-MM-dd HH:mm"/></td>
	                                <td class="text-center">${purchaseList.purchase_status}</td>
	                            </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- pageDTO 활용해서 페이지 다루는 부분 추가 필요 -->
	                <!-- 페이지 전환 버튼 부분 -->
	                <div class="position-relative ">
			            <ul class="pagination justify-content-end">
			            <li class="page-item">
				    		<a class="page-link" href="${pageContext.request.contextPath}/admin/purchase?pageNum=1" aria-label="Go to First">
					      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
					    	</a>
						</li>
						<c:if test="${pageDTO.currentPage > 10 }">
							<li class="page-item">
					    		<a class="page-link" href="${pageContext.request.contextPath}/admin/purchase?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
						    	</a>
							</li>
						</c:if>
							<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/purchase?pageNum=${page}"
								 ${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
							</c:forEach>
						<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
							<li class="page-item">
							  <a class="page-link" href="${pageContext.request.contextPath}/admin/purchase?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
							  </a>
							</li>
						</c:if>
						<li class="page-item">
						  <a class="page-link" href="${pageContext.request.contextPath}/admin/purchase?pageNum=${pageDTO.pageCount}" aria-label="Next">
						    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
						  </a>
						</li>
						</ul>
					</div>
					<!-- 페이지 전환 버튼 부분 -->
	            </div>
            </div>
            <!-- 이 사이에 넣어주세요.-->
            </div>
			<!-- 모달 창  -->
			<div class="modal fade" id="purchaseAdminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">매입신청 관리</h1>
			        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      <!-- 모달 창 메인 body -->
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">신청번호</label>
					  <input type="text" class="form-control" id="purchase_id" readonly>
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">신청자 ID</label>
					  <input type="text" class="form-control" id="member_id" readonly>
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">신청일</label>
					  <input type="text" class="form-control" id="request_date" readonly>
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">매입제품</label>
					  <input type="text" class="form-control" id="pc_item_name" readonly>
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">등급</label>
					  <input type="text" class="form-control" id="expected_grade">
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">매입가</label>
					  <input type="text" class="form-control" id="expected_price">
					</div>
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">매입정산계좌</label>
					  <input type="text" class="form-control" id="account_info" readonly>
					</div>
			      	<div class="form-floating mb-3">
	  		      	  <label for="floatingInput">처리 상태</label>
			      	  <select id="purchase_status" class="form-select">
			      	    <option value="신청 완료">신청 완료(접수)</option>
			      	    <option value="검수 중">검수 중</option>
			      	    <option value="매입 완료">매입 완료</option>
			      	    <option value="매입 취소">매입 취소</option>
		      	      </select>
			      	</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-purple" id="status_save">처리상태 저장</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- end modal -->
        </div>
		<!-- END PAGE CONTAINER-->
    </div>
	<!-- END page-wrapper-->

	<script>
		const contextPath = '${pageContext.request.contextPath}';
	</script>
    <jsp:include page="../inc/jsLink.jsp"></jsp:include>
    <!-- 본인의 커스텀 js link 위치는 여기서부터 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/purchase_admin.js"></script>
    <script>
		document.addEventListener("DOMContentLoaded", function() {
        const menuItems = document.querySelectorAll('.has-sub .js-arrow');
        menuItems.forEach(menu => {
            menu.addEventListener('click', function(e) {
                e.preventDefault(); // 링크 이동 방지
                const subMenu = this.nextElementSibling; // 클릭한 메뉴의 바로 다음 하위 메뉴 선택
                subMenu.classList.toggle('show'); // show 클래스를 토글하여 보이기/숨기기
            });
        });
    });
	</script>
</body>
</html>