package kr.or.ddit.aws.controller;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.aws.service.AwsService;
import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.Bucket;
import software.amazon.awssdk.services.s3.model.CreateBucketRequest;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.HeadBucketRequest;
import software.amazon.awssdk.services.s3.model.ListBucketsResponse;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

@Slf4j
@Controller
@RequestMapping("/aws")
public class AwsController {
	
	@Inject
	AwsService service;
	
	public S3Client readAws() {
		
		return service.readS3Client();
	}
	
	// 버켓 리스트 조회
	@GetMapping("listBuckets")
	public String listBuckets(Model model) {
		try {
			// s3 클라이언트 생성
			S3Client s3Client = service.readS3Client();
			
			// s3 버킷 목록 가져오기
			ListBucketsResponse response = s3Client.listBuckets();
			List<Bucket> bucketList = response.buckets();
			
			s3Client.close(); // 사용 다하면 닫기
			
			model.addAttribute("bucketList", bucketList);
			return "/cloud/bucketList";
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			return "ERROR : " + e.getMessage();
		}
	}
	
	
	// 버킷 생성
	@ResponseBody
	@GetMapping("createBucket/{bucketName}")
	public String createBucket(@PathVariable String bucketName) {
		// s3 클라이언트 생성
		S3Client s3Client = service.readS3Client();
		
		s3Client.createBucket(CreateBucketRequest
				.builder()
				.bucket(bucketName)
				.build());
		s3Client.close();
		
		
		return "{ok:ok}";
	}
	
	// 버켓 존재 여부 파악
	public boolean checkBucket(S3Client s3Client, String bucketName) {
		try {
			HeadBucketRequest hbr = HeadBucketRequest.builder()
									.bucket(bucketName)
									.build();
			s3Client.headBucket(hbr);
			return true;
		}catch (S3Exception e) {
			log.info("bucket check fail : {}", e.awsErrorDetails().errorMessage());
		}
		return false;
	}
	
	// 버킷 폴더 생성
	@ResponseBody
	@GetMapping("createFolder/{bucketName}/{folderName}")
	public String createFolder(@PathVariable("bucketName") String bucketName, @PathVariable("folderName") String folderName) {
		// s3 클라이언트 생성
		S3Client s3Client = service.readS3Client();
		
		folderName = folderName+"/";
		try {
			s3Client.putObject(PutObjectRequest.builder()
					.bucket(bucketName)
					.key(folderName)
					.build(),
					RequestBody.empty());
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			s3Client.close();
		}
		return "{ok:ok}";
		
	}
	
	// 버킷 폴더 삭제
	@ResponseBody
	@GetMapping("deleteFolder/{bucketName}/{folderName}")
	public String deleteFolder(@PathVariable("bucketName") String bucketName, @PathVariable("folderName") String folderName) {
		
		folderName = folderName+"/";
		// s3 클라이언트 생성
		S3Client s3Client = service.readS3Client();
		try {
			s3Client.deleteObject(DeleteObjectRequest.builder()
					.bucket(bucketName)
					.key(folderName)
					.build());
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			s3Client.close();
		}
		
		
		return "{ok:ok}";
	}
	
	// 파일 생성
	@ResponseBody
	@PostMapping
	public String createFile(@RequestParam("file") MultipartFile file) {
		// s3 클라이언트 생성
		S3Client s3Client = service.readS3Client();
		
		try{
			String keyName = UUID.randomUUID().toString();
			PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket("p0200001")
                    .key(keyName)
                    .build();
			
			s3Client.putObject(putObjectRequest, RequestBody.fromBytes(file.getBytes()));
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "{ok:ok}";
	}
	
	
}