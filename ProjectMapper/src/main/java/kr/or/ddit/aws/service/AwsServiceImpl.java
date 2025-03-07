package kr.or.ddit.aws.service;

import java.nio.file.Paths;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.aws.mapper.AwsMapper;
import kr.or.ddit.aws.vo.AwsVO;
import kr.or.ddit.commons.enumpkg.ServiceResult;
import kr.or.ddit.projects.cloud.mapper.CloudRootMapper;
import kr.or.ddit.projects.vo.CloudRootVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.http.apache.ApacheHttpClient;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.CreateBucketRequest;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.GetObjectResponse;
import software.amazon.awssdk.services.s3.model.HeadBucketRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

@Slf4j
@Service
@RequiredArgsConstructor
public class AwsServiceImpl implements AwsService{
	
	private final AwsMapper awsMapper;
	private final CloudRootMapper cloudRootMapper;
	
	@Override
	public S3Client readS3Client() {
		AwsVO aws = awsMapper.selectS3Client();
		
		if(aws == null) {
			throw new RuntimeException("AWS 자격증명을 찾을 수 없습니다.");
		}
		
		AwsBasicCredentials awsCredentials = AwsBasicCredentials.create(aws.getAccessKeyId(), aws.getSecretAccessKey());
		return S3Client.builder()
				.region(Region.AP_NORTHEAST_2)
				.credentialsProvider(StaticCredentialsProvider.create(awsCredentials))
				.build();
	}
	
	// CloudRootVO를 받아서 먼저 버켓을 생성하고 성공하면 DB에도 등록
	// 버켓 명은 cloudRootId와 같음
	@Override
	public ServiceResult createBucket(CloudRootVO cloudRoot) {
		ServiceResult result = ServiceResult.FAIL;
		String bucketName = cloudRoot.getCloudRootId();
		try {
			// AWS S3 클라이언트 생성
			S3Client s3Client = readS3Client();
			
			// 버킷 생성
			s3Client.createBucket(CreateBucketRequest
					.builder()
					.bucket(bucketName)
					.build());
			
			// 버킷 생성 체크
//			if(checkBucket(s3Client, bucketName)) {
				int cnt = cloudRootMapper.insertCloudRoot(cloudRoot);
				log.info("클라우드 루트 값 : {}", cnt);
				if(cnt>0) {
					result = ServiceResult.OK;					
				}else {
					result = ServiceResult.FAIL; 
				}
//			}
			
			s3Client.close();
			
		}catch (S3Exception e) {
			// S3 관련 예외 발생
			e.printStackTrace();
			result = ServiceResult.FAIL; 
			
		}catch (Exception e) {
	        e.printStackTrace();
	        result = ServiceResult.FAIL;
		}
		return result;
	}
	
	// 버켓 존재 여부 파악
	public boolean checkBucket(S3Client s3Client, String bucketName) {
		try {
			HeadBucketRequest hbr = HeadBucketRequest.builder()
									.bucket(bucketName)
									.build();
			s3Client.headBucket(hbr); // 있으면 true
			return true;
		}catch (S3Exception e) {
			// 예외 발생하면 없다
			return false;			
		}
	}
	
	@PostMapping
	public void fileDownload() {
		String destinationPath = "C://downloads";
		AwsVO aws = awsMapper.selectS3Client();
		
		if(aws == null) {
			throw new RuntimeException("AWS 자격증명을 찾을 수 없습니다.");
		}
		
		AwsBasicCredentials awsCredentials = AwsBasicCredentials.create(aws.getAccessKeyId(), aws.getSecretAccessKey());
		
		try(S3Client s3Client = S3Client.builder()
				.httpClientBuilder(ApacheHttpClient.builder())
				.credentialsProvider(ProfileCredentialsProvider.create())
				.build()){
			// 다운로드 요청 생성
            GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                    .bucket("p0200001") // 버킷 이름
                    .key("/스크린샷 2024-10-31 164740.png")           // 객체 키
                    .build();

            // 다운로드 수행 및 파일 저장
            GetObjectResponse response = s3Client.getObject(getObjectRequest, Paths.get(destinationPath));

            
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
//	 비동기파일 다운로드
//	@PostMapping
//	public void fileDownload() {
//		
//		S3AsyncClient s3AsyncClient = S3AsyncClient.builder()
//									.region(Region.AP_NORTHEAST_2)
//									.credentialsProvider(ProfileCredentialsProvider.create())
//									.build();
//		
//		GetObjectRequest getObjectRequest = GetObjectRequest.builder()
//								.bucket()
//								.key()
//								.build();
//		
//		CompletableFuture<GetObjectResponse> future = s3AsyncClient.getObject(getObjectRequest, Paths.get("local-file-path"));
//
//        future.whenComplete((response, exception) -> {
//            if (exception != null) {
//                exception.printStackTrace();
//            } else {
//                System.out.println("File downloaded successfully.");
//            }
//        });
//
//        // 비동기 다운로드가 완료될 때까지 대기
//        future.join();
//	}
	
}
