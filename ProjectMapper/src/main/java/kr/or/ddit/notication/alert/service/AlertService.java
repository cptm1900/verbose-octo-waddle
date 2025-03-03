package kr.or.ddit.notication.alert.service;


import java.util.List;

import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.or.ddit.notication.vo.AlertVO;

public interface AlertService {

//	
	public void addAlert(AlertVO alert);
	
	public SseEmitter subscribe(String userId);
	
	public void sendAlert(AlertVO alert);
	
	public List<AlertVO> readAlertList(String userId);
}
