package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductDTO {
	//거래상품 ID	
    private int product_id;
    
    //카테고리명
    private String category_name;
    //판매자 ID
    private String seller_id;
    
    //상품명
    private String product_name;
    //상품가격
	private int product_price;
	//구매연도
    private int year_purchase;
    //상품설명
    private String product_desc;
    //상품 사진
    private String product_img1;
    private String product_img2;
    private String product_img3;
    private String product_img4;
    private String product_img5;
    //상품등록일시
    private Timestamp created_datetime;
    //등록 경과시간
    private String elapsedTime;
    //조회수
    private int view_count;
    //찜수
    private int like_count = 0;
    //거래방법
    private String trade_method;
    //결제수단
    private String pay_method;
    //거래 지역
    private String trade_area;
    //거래상태
    private String trade_status;
    //구매자 아이디 for chat
    private String buyer_id;
    //거래 종료일
    private Timestamp transaction_end_date;
    // 날짜 포맷된 문자열을 저장할 필드
    private String formattedCreatedDatetime;
    private String formattedTransactionEndDate;
    //review 유무
    private String review_content;
    
    private int review_quality;
    private int review_price;
    private int review_time;
    private int review_manner;
    
    private String nickname;
   
  


	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", category_name=" + category_name + ", seller_id=" + seller_id
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", year_purchase="
				+ year_purchase + ", product_desc=" + product_desc + ", product_img1=" + product_img1
				+ ", product_img2=" + product_img2 + ", product_img3=" + product_img3 + ", product_img4=" + product_img4
				+ ", product_img5=" + product_img5 + ", created_datetime=" + created_datetime + ", elapsedTime="
				+ elapsedTime + ", view_count=" + view_count + ", like_count=" + like_count + ", trade_method="
				+ trade_method + ", pay_method=" + pay_method + ", trade_area=" + trade_area + ", trade_status="
				+ trade_status + ", buyer_id=" + buyer_id + ", transaction_end_date=" + transaction_end_date
				+ ", formattedCreatedDatetime=" + formattedCreatedDatetime + ", formattedTransactionEndDate="
				+ formattedTransactionEndDate + ", review_content=" + review_content + ", review_quality="
				+ review_quality + ", review_price=" + review_price + ", review_time=" + review_time
				+ ", review_manner=" + review_manner + ", nickname=" + nickname + "]";
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	public String getElapsedTime() {
		return elapsedTime;
	}



	public void setElapsedTime(String elapsedTime) {
		this.elapsedTime = elapsedTime;
	}



	public int getView_count() {
		return view_count;
	}


	public void setView_count(int view_count) {
		this.view_count = view_count;
	}


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}


	public String getTrade_status() {
		return trade_status;
	}


	public void setTrade_status(String trade_status) {
		this.trade_status = trade_status;
	}


	public int getProduct_id() {
		return product_id;
	}




	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}



	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public int getYear_purchase() {
		return year_purchase;
	}


	public void setYear_purchase(int year_purchase) {
		this.year_purchase = year_purchase;
	}


	public String getProduct_desc() {
		return product_desc;
	}


	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}


	public String getProduct_img1() {
		return product_img1;
	}


	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}


	public String getProduct_img2() {
		return product_img2;
	}


	public void setProduct_img2(String product_img2) {
		this.product_img2 = product_img2;
	}


	public String getProduct_img3() {
		return product_img3;
	}


	public void setProduct_img3(String product_img3) {
		this.product_img3 = product_img3;
	}


	public String getProduct_img4() {
		return product_img4;
	}


	public void setProduct_img4(String product_img4) {
		this.product_img4 = product_img4;
	}


	public String getProduct_img5() {
		return product_img5;
	}


	public void setProduct_img5(String product_img5) {
		this.product_img5 = product_img5;
	}

	public Timestamp getCreated_datetime() {
		return created_datetime;
	}

	public void setCreated_datetime(Timestamp created_datetime) {
		this.created_datetime = created_datetime;
	}

	public String getTrade_method() {
		return trade_method;
	}


	public void setTrade_method(String trade_method) {
		this.trade_method = trade_method;
	}


	public String getPay_method() {
		return pay_method;
	}


	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	// product image from online
	public void setProduct_img(String imageUrl) {
	    this.product_img1 = imageUrl;
	}


	public String getTrade_area() {
		return trade_area;
	}

	public void setTrade_area(String trade_area) {
		this.trade_area = trade_area;
	}


	public String getBuyer_id() {
		return buyer_id;
	}


	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}





	public String getSeller_id() {
		return seller_id;
	}





	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}





	public Timestamp getTransaction_end_date() {
		return transaction_end_date;
	}





	public void setTransaction_end_date(Timestamp transaction_end_date) {
		this.transaction_end_date = transaction_end_date;
	}





	public String getFormattedCreatedDatetime() {
		return formattedCreatedDatetime;
	}





	public void setFormattedCreatedDatetime(String formattedCreatedDatetime) {
		this.formattedCreatedDatetime = formattedCreatedDatetime;
	}





	public String getFormattedTransactionEndDate() {
		return formattedTransactionEndDate;
	}





	public void setFormattedTransactionEndDate(String formattedTransactionEndDate) {
		this.formattedTransactionEndDate = formattedTransactionEndDate;
	}





	public String getReview_content() {
		return review_content;
	}





	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}





	public int getReview_quality() {
		return review_quality;
	}





	public void setReview_quality(int review_quality) {
		this.review_quality = review_quality;
	}





	public int getReview_price() {
		return review_price;
	}





	public void setReview_price(int review_price) {
		this.review_price = review_price;
	}





	public int getReview_time() {
		return review_time;
	}





	public void setReview_time(int review_time) {
		this.review_time = review_time;
	}





	public int getReview_manner() {
		return review_manner;
	}





	public void setReview_manner(int review_manner) {
		this.review_manner = review_manner;
	}






	

}