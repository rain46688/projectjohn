<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<jsp:include page="/WEB-INF/views/common/header.jsp">

	<jsp:param name="title" value=" " />

</jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/admin/customerFaq.css">
<section id="content">
<div class="container1">
	<h1 style="font-weight: 1000; color: black;">
		<img class="faqImages" src="${path }/resources/images/admin/faq.png" />&nbsp;FAQ
	</h1>
	<div class="accordion">
		<div class="accordion-item">
			<button id="accordion-button-1" aria-expanded="false">
				<span class="accordion-title">개명을 한 후에 이름을 어떻게 변경하나요?</span><span
					class="icon" aria-hidden="true"></span>
			</button>
			<div class="accordion-content">
				<p>1. 개명 후 "정부24" 사이트에서 회원 정보를 수정(이름 변경) 하여도 일부 민원(졸업증명서, 자격증
					재발급 등) 발급이 되지 않는 경우가 있습니다. 이런 경우는 해당 기관(지자체, 중앙부처 등)으로 문의를 하셔야 합니다.

					2. 개명 후 "정부24"에서 회원정보(이름) 변경하기</p>
			</div>
		</div>
		<div class="accordion-item">
			<button id="accordion-button-2" aria-expanded="false">
				<span class="accordion-title">플러그인 설치 없이 가능한 서비스 이용 최소사양은
					뭔가요?</span><span class="icon" aria-hidden="true"></span>
			</button>
			<div class="accordion-content">
				<p>1. 개명 후 "정부24" 사이트에서 회원 정보를 수정(이름 변경) 하여도 일부 민원(졸업증명서, 자격증
					재발급 등) 발급이 되지 않는 경우가 있습니다. 이런 경우는 해당 기관(지자체, 중앙부처 등)으로 문의를 하셔야 합니다.

					2. 개명 후 "정부24"에서 회원정보(이름) 변경하기</p>
			</div>
		</div>
		<div class="accordion-item">
			<button id="accordion-button-3" aria-expanded="false">
				<span class="accordion-title">플러그인 프로그램 설치 없이 신청/발급
					가능한 민원은 뭔가요?</span><span class="icon" aria-hidden="true"></span>
			</button>
			<div class="accordion-content">
				<p>1. 개명 후 "정부24" 사이트에서 회원 정보를 수정(이름 변경) 하여도 일부 민원(졸업증명서, 자격증
					재발급 등) 발급이 되지 않는 경우가 있습니다. 이런 경우는 해당 기관(지자체, 중앙부처 등)으로 문의를 하셔야 합니다.

					2. 개명 후 "정부24"에서 회원정보(이름) 변경하기</p>
			</div>
		</div>
		<div class="accordion-item">
			<button id="accordion-button-4" aria-expanded="false">
				<span class="accordion-title">전자문서지갑을 정부24 홈페이지에서 사용할 수 없나요?</span><span
					class="icon" aria-hidden="true"></span>
			</button>
			<div class="accordion-content">
				<p>1. 개명 후 "정부24" 사이트에서 회원 정보를 수정(이름 변경) 하여도 일부 민원(졸업증명서, 자격증
					재발급 등) 발급이 되지 않는 경우가 있습니다. 이런 경우는 해당 기관(지자체, 중앙부처 등)으로 문의를 하셔야 합니다.

					2. 개명 후 "정부24"에서 회원정보(이름) 변경하기</p>
			</div>
		</div>
		<div class="accordion-item">
			<button id="accordion-button-5" aria-expanded="false">
				<span class="accordion-title">전자문서지갑을 이용해 상대방에게 전자증명서를 어떻게
					보내나요?</span><span class="icon" aria-hidden="true"></span>
			</button>
			<div class="accordion-content">
				<p>1. 개명 후 "정부24" 사이트에서 회원 정보를 수정(이름 변경) 하여도 일부 민원(졸업증명서, 자격증
					재발급 등) 발급이 되지 않는 경우가 있습니다. 이런 경우는 해당 기관(지자체, 중앙부처 등)으로 문의를 하셔야 합니다.

					2. 개명 후 "정부24"에서 회원정보(이름) 변경하기</p>
			</div>
		</div>
	</div>
</div>
</section>
<script>
const items = document.querySelectorAll(".accordion button");

function toggleAccordion() {
  const itemToggle = this.getAttribute('aria-expanded');
  
  for (i = 0; i < items.length; i++) {
    items[i].setAttribute('aria-expanded', 'false');
  }
  
  if (itemToggle == 'false') {
    this.setAttribute('aria-expanded', 'true');
  }
}

items.forEach(item => item.addEventListener('click', toggleAccordion));
</script>


