package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.ChatMessageDTO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ChatService;

@Controller
public class ChatController {
	@Inject
	private ChatService chatService;
	
	@GetMapping("/chat")
	public String chat(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			List<ChatRoomDTO> chatRoomDTOList = null;
			chatRoomDTOList = chatService.getChatRoomList((String)session.getAttribute("member_id"));
			System.out.println(chatRoomDTOList);
			model.addAttribute("chatRoomDTOList", chatRoomDTOList);
			return "/chat/chat";
		}
		return "/chat/chat";
	}
	
	@PostMapping(value = "/chat/createRoom", produces = "application/text; charset=UTF-8")
	public String createRoom(ChatRoomDTO chatRoomDTO, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member_id") != null) {
			List<ChatRoomDTO> chatRoomDTOList = null;
			chatService.createChatRoom(chatRoomDTO);
			try {
				String json = new ObjectMapper().writeValueAsString(chatRoomDTO);
				model.addAttribute("chatRoomDTO", json);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			System.out.println(chatRoomDTOList);
			model.addAttribute("chatRoomDTOList", chatRoomDTOList);
			return "/chat/chat";
		}
		return "redirect:/chat";
	}
	
	@PostMapping(value = "/chat/reciveRoomProduct", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String  reciveRoomProduct(ChatRoomDTO chatRoomDTO) {
		ProductDTO productDTO = null;
		productDTO = chatService.getProductInfo(chatRoomDTO);
		System.out.println(productDTO);
		String json = null;
		try {
			json = new ObjectMapper().writeValueAsString(productDTO);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return  json;
	}
	
	// 이 주소로 요청이 오면 그 채팅방의 메세지 리스트를 돌려준다
	@PostMapping(value = "/{roomId}/reciveList")
	public List<ChatMessageDTO> chatMessageList(ChatRoomDTO chatRoomDTO, HttpServletRequest request, Model model){
		
		return null;
	}
	@MessageMapping("/{roomId}")
	@SendTo("/topic/{roomId}")
    public ChatMessageDTO chat(@DestinationVariable("roomId") String roomId, 
    		ChatMessageDTO message){
		System.out.println(message);
		//클라이언트에서 받아야하는 DTO 변수 chat_room_id, message_type, user_id, message
		ChatMessageDTO chat = chatService.createChat(roomId ,message);
		return chat;
        //simpMessagingTemplate.convertAndSend("/topic/"+roomId,data);
    }
}


