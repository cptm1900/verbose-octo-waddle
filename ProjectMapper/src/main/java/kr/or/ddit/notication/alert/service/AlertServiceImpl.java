package kr.or.ddit.notication.alert.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.notication.alert.mapper.AlertMapper;
import kr.or.ddit.notication.vo.AlertVO;
import kr.or.ddit.resources.service.ResourcesService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class AlertServiceImpl implements AlertService {
	
	private final ResourcesService resourceService;
	
	private static final Long TIMEOUT = 60L * 1000 * 60;
	private final Map<String, List<SseEmitter>> emitters = new ConcurrentHashMap<>();
	private ObjectMapper objectMapper = new ObjectMapper();
	private final AlertMapper alertMapper;
	
	
	// 사용자 구독
	public SseEmitter subscribe(String userId) {
		List<SseEmitter> emitterList = emitters.computeIfAbsent(userId, k -> new CopyOnWriteArrayList<>());
        SseEmitter emitter = new SseEmitter(TIMEOUT);
        emitterList.add(emitter);

        // 구독 종료 및 에러 처리 시 removeEmitter 호출
        emitter.onCompletion(() -> removeEmitter(userId, emitter));
        emitter.onTimeout(() -> removeEmitter(userId, emitter));
        emitter.onError((ex) -> removeEmitter(userId, emitter));

        log.info("User {} subscribed for notifications", userId);
        return emitter;
	}
	
	// Emitter 제거 메서드
    private void removeEmitter(String userId, SseEmitter emitter) {
        List<SseEmitter> emitterList = emitters.get(userId);
        if (emitterList != null) {
            emitterList.remove(emitter);
            if (emitterList.isEmpty()) {
                emitters.remove(userId); // 마지막 emitter 제거 시 사용자 정보도 삭제
            }
        }
        log.info("Emitter removed for user {}", userId);
    }
	
	// 알림 데이터 전송
	public void sendAlert(AlertVO alert) {
		String userId = alert.getUserId();
		
//		ObjectMapper objectMapper = new ObjectMapper();
		
		// json 형식으로 변환
//		String jsonMessage;
//		try {
//			jsonMessage = objectMapper.writeValueAsString(alert);
//			log.info("여기 : ", jsonMessage);
//		}catch (Exception e) {
//			log.error("Failed to convert alert VO to JSON", e);
//            return;
//		}
		
		List<SseEmitter> emitterList = emitters.get(userId);
	    if (emitterList != null) {	
	        for (SseEmitter emitter : emitterList) {
	            try {
	                // 알림 전송
	                emitter.send(SseEmitter.event().name("alert").data(alert));
//	                log.info("Alert sent to user {}: {}", userId, jsonMessage);
	            } catch (IOException e) {
	                log.error("Failed to send alert to user {}", userId, e);
	                emitterList.remove(emitter);
	            }
	        }
	    } else {
	        log.warn("No active subscriber for user {}", userId);
	    }
	}
	
	// 알람 db 추가 메소드 / db에 insert되면 담당회원에게 메세지를 보냄
	@Override
	public void addAlert(AlertVO alert) {
		
		if(alertMapper.insertAlert(alert) > 0) {
			sendAlert(alert);
		}
	}

	@Override
	public List<AlertVO> readAlertList(String userId) {
		
		return alertMapper.selectAlertList(userId);
	}
	
	
}
