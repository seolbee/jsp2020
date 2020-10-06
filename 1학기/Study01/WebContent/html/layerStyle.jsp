<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mylayer1{
		z-index:1;
	}
	
	#mylayer2 {
		z-index:2;
	}
	
	.mylayer3{
		position:absolute;
		background-color:red;
		top: 100px;
		left: 100px;
		width : 100px;
		height: 100px;
	}
	
	.mylayer4{
		position: absolute;
		background-color: blue;
		top: 150px;
		left: 150px;
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
	<div id="mylayer1" class="mylayer3"> layer1 </div>
	<div id="mylaery2" class="mylayer4"> layer2 </div>
</body>
</html>