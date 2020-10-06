<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Scanner"%>
<%@ page import="java.util.Random"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP로 구현하는 성적관리</title>
	</head>
	<body>
		<% 
			int[] hakbun = {1001, 1002, 1003, 1004, 1005};
			int[] score = new int[5]; 
		
		%>
		
		<%--
			문제 1) score배열에 1~100점 사이의 랜덤 숫자 5개를 저장
			예    1) 87, 11, 92, 14, 47
		 --%>
		 <%
			int size = score.length;
			Random ran = new Random();
		/* 무작위 생성된 정수들을 반복문으로 score 배열에 5개 저장한 후 출력하기 */
			
		%>
		
		<br />
		<%--
			문제 2) 성적이 60점 이상이면 합격. 합격생 수 출력
			예    2) 2명
		 --%>
		<br />
		<%--
			문제 3) 콘솔 창에서 학번을 입력받아 성적 출력. 단 없는 학번 입력 시 예외처리
			예    3) 학번 입력 : 1001		성적 : 87점
				     학번 입력 : 1000		해당 학번은 존재하지 않습니다.
		 --%> 
		<%
			Scanner sc = new Scanner(System.in);
			
			System.out.print("학번을 입력하세요 : ");
			int myHakbun = sc.nextInt();
			sc.close();
			int idx = -1;
			/* 입력받은 학번이 배열 hakbun에 있는지 확인 후 idx 값을 수정하는 코드 */
			
			
			
			
			
			
			if(idx == -1){
				%>
					<script>
						alert('해당 학번은 존재하지 않습니다.');
					</script>
				<%				
					}else{
				%>
					<script>
					alert('<%= score[idx] %>점');
					</script>
				<%		
					}
				%>
				<br />	
		<%--
			문제 4) 1등 학생의 학번과 성적 출력
			예    4) 1003번(92점)
		 --%>
		<%
			int maxScore = 0;
			int maxIdx = 0;
			
			
			
			
			
		%>
		
		<%= hakbun[maxIdx]+"번(" + score[maxIdx] + "점)" %>
	</body>
</html>