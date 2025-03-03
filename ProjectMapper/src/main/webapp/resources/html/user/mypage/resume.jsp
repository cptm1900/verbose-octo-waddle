<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서</title>
    <style>
        .add-button {
            color: #007bff;
            cursor: pointer;
            font-size: 0.9em;
            margin-left: 1020px;
        }

        .list-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 5px;
        }

        .list-item span {
            font-size: 1em;
        }

        .edit-icon {
            color: #007bff;
            cursor: pointer;
            margin-right: 10px;
        }

        .delete-icon {
            color: red;
            cursor: pointer;
        }

        .textarea-container textarea {
            width: 100%;
            height: 150px;
            resize: none;
            margin-top: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }
    
        .section-title {
            font-size: 1.5em;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 20px;
            color : black;
        }

        .resume-section {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        #resume-button{
        	margin-left: 1320px;
            height: 40px;
   			width: 50px;
        }
        #skill-file{
        	margin-left: 870px;
        
        
        }
        
        
    </style>
</head>
<body>
     <div class="container">
        <!-- 학력 -->
        <div class="resume-section">
            <div class="section-header">
                <h2>학력</h2>
                <span class="add-button">+ 추가</span>
            </div>
              <div class="education-item">
		        <div class="education-header">
		            <span></span>
		            <span class="education-period">| </span>
		        </div>
		      <div class="education-location"></div>
    </div>
        </div>

        <!-- 경력 -->
        <div class="resume-section">
            <div class="section-header">
                <h2>경력</h2>
                <span class="add-button">+ 추가</span>
            </div>
            <div class="list-item">
                <span>회사명</span>
                <div>
                    <a class="edit-icon">✏</a>
                    <a class="delete-icon">🗑️</a>
                </div>
            </div>
        </div>

        <!-- 자격증 -->
        <div class="resume-section">
            <div class="section-header">
                <h2>자격증</h2>
                <span class="add-button">+ 추가</span>
            </div>
            <div class="list-item">
                <span>SQL 개발자</span>
                <div>
                    <a class="edit-icon">✏️</a>
                    <a class="delete-icon">🗑️</a>
                </div>
            </div>
                <input type="file" id="skill-file">
        </div>

        <!-- 자기소개서 -->
        <div class="resume-section">
            <div class="section-header">
                <h2>자기소개서</h2>
            </div>
            <div class="textarea-container">
                <textarea placeholder="자기소개를 입력하세요..."></textarea>
            </div>
           
        </div>
    </div>
            
            <button type="button" id="resume-button">저장</button>
</body>
</html>
