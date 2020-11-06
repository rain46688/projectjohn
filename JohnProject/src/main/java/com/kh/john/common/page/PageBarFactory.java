package com.kh.john.common.page;

public class PageBarFactory {
	public static String getPageBar(int totalData, int cPage, int numPerPage, String uri) {
		
		String pageBar = "";

		int pageBarSize = 5;

		int totalPage = (int) Math.ceil((double) totalData / numPerPage);

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>이전</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link' href='#'>" + pageNo + "</a>";
				pageBar += "</li>";
			} else {
				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' " + "href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>";
				pageBar += "</li>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#'>다음</a>";
			pageBar += "</li>";
		} else {
			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>";
			pageBar += "</li>";
		}

		pageBar += "</ul>";

		pageBar += "<script>";
		pageBar += "function fn_paging(cPage){";
		pageBar += "location.href='" + uri + "?cPage='+cPage;";
		pageBar += "}";
		pageBar += "</script>";

		return pageBar;
	}
}
