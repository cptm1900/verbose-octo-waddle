<%@ page contentType="text/html; charset=utf-8" %>
<html>
<style type='text/css'>
.red{background-color:red}
.yellow{background-color:blue}
</style>
<script src='https://code.jquery.com/jquery-3.7.1.min.js'></script>
<body>
<h4 class='red'>서버 시간대 : ${tzName}</h4>
<h4 class='yellow'>서버 로케일 : ${localeName}</h4>
</body>
</html>