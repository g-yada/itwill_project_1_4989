package com.itwillbs.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;
import com.itwillbs.service.ZzimService;

@Controller
@RequestMapping("/product/*")

public class ProductController {

    @Inject
    private ProductService productService;
    
    @Inject
    private ZzimService zzimService;
    
    @Resource(name = "uploadPath")
    private String uploadPath;
    
    
    @GetMapping("/register")
    public String register(HttpSession session) {
    	//로그인한 사람만 글쓰기
    	String member_id = (String)session.getAttribute("member_id");
    	return "product/register";
    	
     }

    @PostMapping("/registerPro")
    public String registerPro(HttpServletRequest request, MultipartFile[] product_img, HttpSession session) throws Exception {
        System.out.println("ProductController registerPro()");

		/*
		 * if (product_img1 == null || product_img1.isEmpty()) {
		 * System.out.println("파일이 선택되지 않았습니다."); return "redirect:/product/register"; }
		 */

        System.out.println("uploadPath: " + uploadPath);
        if (uploadPath == null) {
            System.out.println("업로드 경로가 설정되지 않았습니다.");
            return "redirect:/product/register";
        }

        UUID uuid = UUID.randomUUID();
        String filename1 = uuid.toString() + "_" + product_img[0].getOriginalFilename();
        String filename2 = uuid.toString() + "_" + product_img[1].getOriginalFilename();
        String filename3 = uuid.toString() + "_" + product_img[2].getOriginalFilename();
        String filename4 = uuid.toString() + "_" + product_img[3].getOriginalFilename();
        String filename5 = uuid.toString() + "_" + product_img[4].getOriginalFilename();
        //System.out.println("업로드 경로 : " + uploadPath);
        //System.out.println("랜덤문자_파일이름 : " + filename1);
      

        FileCopyUtils.copy(product_img[0].getBytes(), new File(uploadPath, filename1));
        FileCopyUtils.copy(product_img[1].getBytes(), new File(uploadPath, filename2));
        FileCopyUtils.copy(product_img[2].getBytes(), new File(uploadPath, filename3));
        FileCopyUtils.copy(product_img[3].getBytes(), new File(uploadPath, filename4));
        FileCopyUtils.copy(product_img[4].getBytes(), new File(uploadPath, filename5));

        ProductDTO productDTO = new ProductDTO();
        productDTO.setProduct_name(request.getParameter("product_name"));
        productDTO.setCategory_name(request.getParameter("category_name"));
        productDTO.setProduct_price(Integer.parseInt(request.getParameter("product_price")));
       productDTO.setTrade_area(request.getParameter("trade_area"));
        productDTO.setTrade_method(request.getParameter("trade_method"));
        productDTO.setPay_method(request.getParameter("pay_method"));
        productDTO.setProduct_desc(request.getParameter("product_desc"));
        productDTO.setProduct_img1(filename1);
        productDTO.setProduct_img2(filename2);
        productDTO.setProduct_img3(filename3);
        productDTO.setProduct_img4(filename4);
        productDTO.setProduct_img5(filename5);
        //로그인한 사용자
        productDTO.setSeller_id((String) session.getAttribute("member_id"));

        String yearPurchase = request.getParameter("year_purchase");
        if (yearPurchase != null && !yearPurchase.isEmpty()) {
            productDTO.setYear_purchase(Integer.parseInt(yearPurchase));
        }
        System.out.println("ProductController" + productDTO);
        productService.registerProduct(productDTO);

        return "redirect:/product/all";
    }
	/*
	 * @GetMapping("/all") public String all() { return "/product/all"; }
	 */

    @GetMapping("/detail")
    public String detail(HttpServletRequest request, Model model, HttpSession session) throws NumberFormatException {
    	
    	  String product_id = request.getParameter("product_id");
    	  //product_id가 없거나 잘못된 경우에 대한 예외 처리
    	  if (product_id == null || product_id.isEmpty()) {
    	        throw new IllegalArgumentException("Invalid product_id");
    	    }
    	  

    	// 현재 로그인한 사용자 확인
    	    String member_id = (String) session.getAttribute("member_id");
    	    if (member_id == null || member_id.isEmpty()) {
    	        throw new IllegalArgumentException("User must be logged in to perform this action.");
    	    }
    	    System.out.println("Product ID: " + product_id);
    	    System.out.println("Member ID: " + member_id);
    	  	// 조회수 증가 처리
    	    productService.increseViewCount(Integer.parseInt(product_id));

    	    // 상품 상세 정보
    	    ProductDTO productDTO = productService.getProductDetail(product_id);
    	    
    	    // 찜 여부 확인을 위한 요청 데이터 생성
    	    Map<String, String> zzimRequest = new HashMap<>();
    	    zzimRequest.put("product_id", product_id);
    	    zzimRequest.put("member_id", member_id);

    	    System.out.println("ZzimRequest: " + zzimRequest);

    	    // 찜 여부 확인
    	    boolean isZzimSaved = zzimService.checkZzim(zzimRequest);
    	    System.out.println("Zzim Saved: " + isZzimSaved);
    	    
    	    // 모델에 필요한 정보 추가
    	    model.addAttribute("productDTO", productDTO);
    	    model.addAttribute("isZzimSaved", isZzimSaved);
    	 

        return "/product/detail";
    }
    
    //member_id = seller_id 동일 할 때 품 수정 페이지로 이동
 
    @GetMapping("/update")
    public String showUpdateForm(HttpServletRequest request, Model model, HttpSession session) {
        String product_id = request.getParameter("product_id");

        // 상품 상세 정보 불러오기
        ProductDTO productDTO = productService.getProductDetail(product_id);
        
        // 모델에 상품 정보 추가
        model.addAttribute("productDTO", productDTO);

        return "/product/update";
    }
    
    



}// ProductController()
