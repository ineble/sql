<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
request.setCharacterEncoding("utf-8");
%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset="UTF-8" />
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>


<script type="text/javascript">
	
		var authKey =  "";
		var idFlag = false;
		var pwFlag = false;
		var pw2Flag = false;
		var nameFlag = false;
		var birthFlag = false;
		var authFlag = false;
		var phoneFlag = false;
		var addrFlag = false; 
		
		
		function sample6_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var mAddr1 = $('#mAddr1'); // 주소 변수
		            var mAddr3 = $('#mAddr3'); // 참고항목 변수

		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		            	mAddr1 = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		            	mAddr1 = data.jibunAddress;
		            }

		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if(data.userSelectedType === 'R'){
		                // 명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                	mAddr3 += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                	mAddr3 += (mAddr3 !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(mAddr3 !== ''){
		                	mAddr3 = ' (' + mAddr3 + ')';
		                }
		                // 조합된 참고항목을 해당 필드에 넣는다.
		                document.getElementById("mAddr3").value = mAddr3;
		            
		            } else {
		                document.getElementById("mAddr3").value = '';
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('mZipcode').value = data.zonecode;
		            document.getElementById("mAddr1").value = mAddr1;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("mAddr2").focus();
		        }
		    }).open();
		}	
		
		
	$(document).ready(function(){
		
		// 1. 아이디 중복 체크
		//    5 ~ 20 사이의 소문자나 숫자를 사용한다. 첫 글자는 소문자이다.
		var regExpID = /^[a-z][a-z0-9]{4,19}$/;  // 첫 글자는 소문자이다.(^[a-z])
		$('#mId').keyup(function(){
			$.ajax({
				url: 'idCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mId=' + $('#mId').val(),
				success: function( responseObject ) {
					// 정규식 test()
					if ( regExpID.test($('#mId').val()) ) {  // 정규식을 만족하면,
						// 가입된 아이디인지 여부 확인
						if ( responseObject.result == 'NO' ) {
							$('#idCheckResult').text('이미 가입된 아이디입니다.');
							$('#idCheckResult').css('color', 'red');
							idFlag = false;
						} else {
							$('#idCheckResult').text('사용할 수 있는 아이디입니다.');
							$('#idCheckResult').css('color', 'blue').css('font-weight', 'bold');
							idFlag = true;
						}
					} else {  // 정규식을 만족하지 않으면
						$('#idCheckResult').text('5~20자, 소문자시작, 소문자+숫자 가능');
						$('#idCheckResult').css('color', 'red');
						idFlag = false;
					}
				},
				error: function() {
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
		
		// 2. 비밀번호 체크
		//    8 ~ 20 사이의 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.
		//    각각 1개 이상 포함해야 한다.
		var regExpPW = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[a-z0-9~!@#$%^&*]{4,20}$/;
		// var regExpPW = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
		$('#mPw').keyup(function() {
			if ( regExpPW.test($('#mPw').val()) ) {
				$('#pwCheckResult').text('비밀번호 사용 가능합니다.');
				$('#pwCheckResult').css('color', 'blue').css('font-weight', 'bold');
				pwFlag = true;
			} else {
				$('#pwCheckResult').text('4~20자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');
				$('#pwCheckResult').css('color', 'red');
				pwFlag = false;
			}
		});
		
		$('#mPw2').keyup(function() {
			if ( $('#mPw').val() != $('#mPw2').val()) {
				$('#pwConfirmResult').text('비밀번호가 일치하지 않습니다.');
				$('#pwConfirmResult').css('color', 'red');
				pw2Flag = false;
			} else {
				$('#pwConfirmResult').text('비밀번호가 일치합니다.');
				$('#pwConfirmResult').css('color', 'blue').css('font-weight', 'bold');
				pw2Flag = true;
			}
		});
		
		// 3_1. 생년월일
		
		var regExpBirth = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		
		$('#mBirth').keyup(function(){
				if ( regExpBirth.test($('#mBirth').val()) ) {
					$('#BirthCheckResult').text('형식에 맞는 생년월일입니다.');
					$('#BirthCheckResult').css('color', 'blue').css('font-weight', 'bold');
					birthFlag = true;
				} else {
					$('#BirthCheckResult').text('잘못된 형식의 생년월일입니다.');
					$('#BirthCheckResult').css('color', 'red');
					birthFlag = false;
				}
		});
		// 3. 이메일
		
		var regExpEMAIL = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
		
		$('#mEmail').keyup(function() {
			$.ajax({
				url: 'emailCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mEmail=' + $('#mEmail').val(),
				success: function( responseObject ) {
					// 정규식 test()
					if ( regExpEMAIL.test($('#mEmail').val()) ) {
						// 가입된 이메일 여부 확인
						if ( responseObject.result == 'NO' ) {
							$('#emailCheckResult').text('이미 가입된 이메일입니다.');
							$('#emailCheckResult').css('color', 'red');
							authFlag = false;
						} else {
							$('#emailCheckResult').text('사용할 수 있는 이메일입니다.');
							$('#emailCheckResult').css('color', 'blue').css('font-weight', 'bold');
							authFlag = true;
						}
					} else {  // 정규식을 만족하지 않으면
						$('#emailCheckResult').text('올바른 이메일 형식이 아닙니다.');
						$('#emailCheckResult').css('color', 'red');
						authFlag = false;
					}
				},
				error: function() {
					alert('AJAX 통신이 실패했습니다.');
				}
			});
			
		});
		
		// 4. 전화번호(핸드폰)
		var regExpPHONE = /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;
		
		$('#mPhone').keyup(function(){
			if ( regExpPHONE.test($('#mPhone').val()) ) {
				$('#phoneCheckResult').text('사용 가능한 번호입니다.');
				$('#phoneCheckResult').css('color', 'blue').css('font-weight', 'bold');
				phoneFlag = true;
			} else {
				$('#phoneCheckResult').text('사용 불가능한 번호입니다.');
				$('#phoneCheckResult').css('color', 'red');
				phoneFlag = false;
			}
		});
		
		// 5. 회원가입
		$('#signUpBtn').click(function(){
			
			if($('#mName').val() != '' ){
				nameFlag = true;
			}
			if($('#mAddr1').val() != ''){
				addrFlag = true;
			}
			
			
			if(idFlag && pwFlag && pw2Flag && nameFlag && birthFlag && authFlag && phoneFlag && addrFlag){
				if ($('#authKey').val() == authKey && authKey != "") {
					register.action='register';
					register.submit();
				}else {
					alert('이메일 인증 번호를 확인하세요.');
				}
			}else {
					
				
					if( !idFlag ){
						alert('아이디를 입력해주세요.');
						$("#mId").focus();
					} else if ( !pwFlag) {
						alert('비밀번호를 입력해주세요.');
						$("#mPw").focus();
						$("#mPw2").val('');
						$("#mPw2").text('');
						$('#pwConfirmResult').text('');
						pw2Flag = false; 
					} else if ( !pw2Flag) {
						alert('비밀번호를 확인해주세요.');
						$("#mPw2").focus();
					} else if ( !nameFlag) {
						alert('이름을 입력해주세요.');
						$("#mName").focus();
					}else if ( !birthFlag) {
						alert('생일을 입력해주세요.');
						$("#mBirth").focus();
					} else if ( !authFlag) {
						alert('이메일 인증을 진행해주세요.');
						$("#mEmail").focus();
					} else if ( !phoneFlag) {
						alert('전화번호를 입력해주세요');
						$("#mPhone").focus();
					} else if ( !addrFlag) {
						alert('주소를 입력해주세요.');
						$("#mAddr1").focus();
					}			
			}
			
		
		});
		
		// 6. 입력 초기화
		$('#clearBtn').click(function(){
			$('input[type=text], input[type=password]').each(function(){
				//  각 요소는 each 문 내부에서 $(this) 로 호출한다.
				$(this).val('');
			});
			$('span').each(function(){
				$(this).text('');
			});
			$('#mId').focus();
		});
		
		
		// 7. 이메일 인증
		$('#authMailBtn').click(function(){
						
			$.ajax({
					url : 'emailAuth',
					type : 'POST',
					dataType : 'json',
					data : 'mEmail=' + $('#mEmail').val(),
					success : function(data) {
								alert('인증번호를 발송했습니다.');
								authKey = data.authKey;
							},
					error : function() {
								alert('AJAX 통신이 실패했습니다.');
							}
					});
				
		});
		
		// step 값에 따라 페이지 변경
		$('#agreeBtn').click(function() {
			if (!($("#agree1").is(':checked'))) {
				alert('약관을 읽어보시고 동의하셔야 됩니다.');
				return;
			}
			if (!($("#agree2").is(':checked'))) {
				alert('개인정보 수집 및 이용에 동의하셔야 됩니다.');
				return;
			}
			$("#page-box-2").css("display", "inline"); //page-box-2 활성화
			$("#page-box-1").css("display", "none"); //page-box-1 비활성
		});
		
		
		// 전체동의
		$('#allCheck').click(function () {
		 			
		 var all_check_is = $("#allCheck").is(':checked');
         	// 전체 동의를 활성화하는 버튼
	        if (all_check_is == true) {
	            $('#agree1').attr("checked", true);
	            $('#agree2').attr("checked", true);
	        } else if (all_check_is == false) {
	            $('#agree1').attr("checked", false);
	            $('#agree2').attr("checked", false);
	        }
		});

		
	});
	
	
</script>

<style type="text/css">
	.sign-up-box {
      margin: 30px auto;
      padding: 200px 0 30px 0;
      text-align: center;
   }
   .page-box-2 {display: none; }
   .page-box-1 #checktable {border: 1px solid lightgray; width: 1208px; margin: auto; text-align: left;border-collapse: collapse; margin-top: 40px;}
   .page-box-1 #checktable tr td{font-size: 17px; padding: 15px 20px; font-weight: bold;} 
   .page-box-1 #checktable tr:nth-of-type(1) td{border-bottom: 2px solid black; color: red;} 
   .page-box-1 #agreeBtn {margin-top: 20px; padding: 10px; width: 300px; background-color: darkgray; color: white; font-weight: bold; border: none;}
   .page-box-1 #agreeBtn:hover {background-color: #353535; outline: none;} 
   .page-box-1 .termsOfUse {width: 1208px; margin: auto; margin-top: 50px;}
   .page-box-1 .termsOfUse textarea {font-size: 12px; text-align: left; padding:0px; padding-top: 20px; margin-bottom: 30px; border: 1px solid lightgray; border-top-color: black; }
   .page-box-1 #personalInfo {border-bottom: 1px solid lightgray; border-top: 1px solid black; width: 1208px; border-collapse: collapse; margin-bottom: 40px;}
   .page-box-1 #personalInfo tr td, .page-box-1 #personalInfo tr th {border-bottom: 1px solid lightgray; padding: 20px 20px;}
   .page-box-1 #personalInfo tr th, .page-box-1 #personalInfo tr td:nth-of-type(1) {background-color: #F2F2F2;}
   .page-box-1 > p {font-size: 12px;}
   
   .page-box-2 .register-box #register-table {width: 800px; padding: 20px 10px;  margin: auto; text-align: center; border-collapse: collapse; background-color: #F2F2F2}
   .page-box-2 .register-box #register-table input[type=text], .page-box-2 .register-box #register-table input[type=password] {width: 450px; padding: 7px 10px; border: 1px solid lightgray;  }
   .page-box-2 .register-box #register-table input[type=text]:hover, .page-box-2 .register-box #register-table input[type=password]:hover,.page-box-2 .register-box #register-table input[type=text]:focus, .page-box-2 .register-box #register-table input[type=password]:focus {outline: none; border-color: #353535}
   .page-box-2 .register-box #register-table td:nth-of-type(1) {font-weight: bold; width: 230px; font-size: 13px; color: #353535;}
   .page-box-2 .register-box #register-table td {padding: 10px 20px 10px 70px;text-align: left;}
   .page-box-2 .register-box #register-table input[type=button] {width: 190px; padding: 7px 10px; border: none; background-color: #353535; color: white;}
   .page-box-2 .register-box #register-table input[type=button]:hover, .page-box-2 .register-box #register-table input[type=button]:focus {outline: none; }
   .page-box-2 #signUpBtn, .page-box-2 #clearBtn {width: 190px; padding: 7px 10px; border: none; background-color: darkgray; color:white; margin-top: 30px;}
   .page-box-2 #signUpBtn:hover, .page-box-2 #clearBtn:hover, .page-box-2 #signUpBtn:focus, .page-box-2 #clearBtn:focus {outline: none; background-color: #353535;}
   
   
</style>

<div class="sign-up-box">
	
    <form id="register" method="POST" >
    	<h3>MEMBERSHIP</h3>
    	<!-- page-box-1 -->
    	<div class="step-box">
    		<div id="page-box-1" class="page-box-1">
		    	<img alt="step1" src="resources/assets/register_img/step1.jpg" ><br/>
		    	<table id="checktable">
		    		<tr>
		    			<td><input id=allCheck type="checkbox" name="allCheck"/>&nbsp;<label for="allCheck">전체동의</label></td>
		    		</tr>
		    		<tr>
		    			<td><input type="checkbox" name="agree1" id="agree1"/>&nbsp;<label for="agree1">이용약관</label></td>
		    		</tr>
		    		<tr>
		    			<td><input type="checkbox" name="agree2" id="agree2"/>&nbsp;<label for="agree2">개인정보 수집 및 이용 안내</label></td>
		    		</tr>
		    	</table>
    			<input id="agreeBtn" type="button" value="동의하고 가입하기" /> <br/>
    			<!-- 사용약관 -->
    			<div class="termsOfUse">
	    			<p style="float: left; font-weight: bold;">이용약관</p> <br/>
	    			<textarea cols="80" rows="10" readonly style="width: 1200px;">
	    				호텔 예약 사이트 「  togeTher 」회원 약관
	    				
	    				제 1조(목적)
	    				이 약관은 세븐 팩토리 회사(전자상거래 사업자)가 운영하는 together(투게더) 몰(이하 "몰"이라 한다)에서 제공
						하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의
						무 및 책임사항을 규정함을 목적으로 합니다.
						
						 「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준
						용합니다」
						
						제2조(정의)
						①"몰" 이란 호텔 파이브 회사가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴
						퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 
						아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
						
						②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 
						말합니다.
						
						③ '회원'이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 
						제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
						
						④ '비회원'이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.
						
						제3조 (약관등의 명시와 설명 및 개정) 
						① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 
						있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고
						번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 호텔 파이브 몰의 초기 서비스화면(전면)
						에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
						
						② "몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·
						환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등
						을 제공하여 이용자의 확인을 구하여야 합니다.
						
						③ "몰"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자
						서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하
						지 않는 범위에서 이 약관을 개정할 수 있습니다.
						
						④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기
						화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
						다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두
						고 공지합니다. 이 경우 "몰"은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽
						도록 표시합니다. 
						
						⑤ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되
						고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계
						약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지
						기간내에 '몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
						
						⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호
						에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 
						및 관계법령 또는 상관례에 따릅니다.
						
						제4조(서비스의 제공 및 변경) 
						① "몰"은 다음과 같은 업무를 수행합니다.
						1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
						2. 구매계약이 체결된 재화 또는 용역의 배송
						3. 기타 "몰"이 정하는 업무
						
						②"몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 
						의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 
						내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
						
						③"몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 
						변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
						
						④전항의 경우 "몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과
						실이 없음을 입증하는 경우에는 그러하지 아니합니다.
						
						제5조(서비스의 중단) 
						① "몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경
						우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
						
						②"몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입
						은 손해에 대하여 배상합니다. 단, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 
						아니합니다.
						
						③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우
						에는 "몰"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "몰"에서 제시한 조건에 따라 소비
						자에게 보상합니다. 다만, "몰"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 
						또는 적립금 등을 "몰"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합
						니다.
						
						제6조(회원가입) 
						① 이용자는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시
						를 함으로서 회원가입을 신청합니다.
						
						② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 
						회원으로 등록합니다.
						1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제
						7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "몰"의 회원재가입 승낙을 얻은 경우에는 
						예외로 한다.
						2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
						3. 기타 회원으로 등록하는 것이 "몰"의 기술상 현저히 지장이 있다고 판단되는 경우
						
						③ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
						
						④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 
						대하여 그 변경사항을 알려야 합니다.
						
						제7조(회원 탈퇴 및 자격 상실 등) 
						① 회원은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다.
						
						② 회원이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
						1. 가입 신청시에 허위 내용을 등록한 경우
						2. "몰"을 이용하여 구입한 재화등의 대금, 기타 "몰"이용에 관련하여 회원이 부담하는 채무를 기
						일에 지급하지 않는 경우
						3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
						4. "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
						
						③ "몰"이 회원 자격을 제한·정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유
						가 시정되지 아니하는 경우 "몰"은 회원자격을 상실시킬 수 있습니다.
						
						④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하
						고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
						
						제8조(회원에 대한 통지)
						① "몰"이 회원에 대한 통지를 하는 경우, 회원이 "몰"과 미리 약정하여 지정한 전자우편 주소로 
						할 수 있습니다.
						
						② "몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "몰" 게시판에 게시함으로서 개별 통지
						에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 
						개별통지를 합니다.
						
						제9조(구매신청)
						"몰"이용자는 "몰"상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "몰"은 이용자가 
						구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  단, 회원인 경우 제2호 
						내지 제4호의 적용을 제외할 수 있습니다.
						1. 재화등의 검색 및 선택
						2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
						3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 
						확인
						4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
						5. 재화등의 구매신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의
						6. 결제방법의 선택
						
						제10조 (계약의 성립)
						① "몰"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다
						만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 
						법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
						1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
						2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
						3. 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우
						
						② "몰"의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것
						으로 봅니다.
						
						③ "몰"의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 
						취소등에 관한 정보등을 포함하여야 합니다.
						
						제11조(지급방법)
						"몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 
						수 있습니다. 단, "몰"은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가
						하여 징수할 수 없습니다.
						1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
						2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
						3. 온라인무통장입금
						4. 전자화폐에 의한 결제
						5. 수령시 대금지급
						6. 마일리지 등 "몰"이 지급한 포인트에 의한 결제
						7. "몰"과 계약을 맺었거나 "몰"이 인정한 상품권에 의한 결제  
						8. 기타 전자적 지급 방법에 의한 대금 지급 등
						
						제12조(수신확인통지·구매신청 변경 및 취소)
						① "몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
						
						② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 
						구매신청 변경 및 취소를 요청할 수 있고 "몰"은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 
						요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정
						에 따릅니다.
						
						제13조(재화등의 공급)
						① "몰"은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날
						부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 
						다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받
						은 날부터 2영업일 이내에 조치를 취합니다.  이때 "몰"은 이용자가 재화등의 공급 절차 및 진행 
						사항을 확인할 수 있도록 적절한 조치를 합니다.
						
						②"몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 
						명시합니다. 만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 
						합니다. 다만 "몰"이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.
						
						
						제14조(환급)
						"몰"은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지
						체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부
						터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
						
						제15조(청약철회 등)
						①"몰"과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내
						에는 청약의 철회를 할 수 있습니다.
						
						② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 
						없습니다.
						1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하
						기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
						2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
						3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
						4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
						
						③ 제2항제2호 내지 제4호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 
						알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회
						등이 제한되지 않습니다.
						
						④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시 광고 내용과 다르거나 계약
						내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 
						수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
						
						제16조(청약철회 등의 효과)
						① "몰"은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 
						환급합니다. 이 경우 "몰"이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공
						정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
						
						② "몰"은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화
						등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 
						청구를 정지 또는 취소하도록 요청합니다.
						
						③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. "몰"은 이용
						자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표
						시 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 
						필요한 비용은 "몰"이 부담합니다.
						
						④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 "몰"은 청약철회시 그 비용을  누가 부담하
						는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
						
						제17조(개인정보보호)
						①"몰"은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 
						필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
						1. 성명
						2. 주민등록번호(회원의 경우) 또는 외국인등록번호
						3. 주소
						4. 전화번호
						5. 희망ID(회원의 경우)
						6. 비밀번호(회원의 경우)
						7. 전자우편주소(또는 이동전화번호)
						
						② "몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 
						받습니다.
						
						③제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이
						에 대한 모든 책임은 　몰　이 집니다. 다만, 다음의 경우에는 예외로 합니다.
						
						1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려
						주는 경우
						2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태
						로 제공하는 경우
						3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우
						4. 도용방지를 위하여 본인확인에 필요한 경우
						5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
						
						④"몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신
						원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관
						련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조
						제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 
						있습니다.
						
						⑤이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 
						있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요
						구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
						 
						⑥ "몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등
						을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 
						책임을  집니다.
						
						⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 
						달성한 때에는 당해 개인정보를 지체없이 파기합니다.
						
						제18조("몰"의 의무)
						① "몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 
						바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.
						
						② "몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포
						함)보호를 위한 보안 시스템을 갖추어야 합니다.
						
						③ "몰"이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표
						시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
						
						④ "몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
						
						제19조(회원의 ID 및 비밀번호에 대한 의무)
						① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
						
						② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
						
						③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 
						"몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.
						
						제20조(이용자의 의무)
						이용자는 다음 행위를 하여서는 안됩니다.
						1. 신청 또는 변경시 허위 내용의 등록
						2. 타인의 정보 도용
						3. "몰"에 게시된 정보의 변경
						4. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
						5. "몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해
						6. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
						7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하
						는 행위
						
						제21조(연결"몰"과 피연결"몰" 간의 관계)
						① 상위 "몰"과 하위 "몰"이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 
						포함됨)방식 등으로 연결된 경우, 전자를 연결 "몰"(웹 사이트)이라고 하고 후자를 피연결 "몰"(웹
						사이트)이라고 합니다.
						
						②연결"몰"은 피연결"몰"이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 
						보증책임을 지지 않는다는 뜻을 연결"몰"의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 
						경우에는 그 거래에 대한 보증책임을 지지 않습니다.
						
						제22조(저작권의 귀속 및 이용제한)
						① "몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "몰"에 귀속합니다.
						
						② 이용자는 "몰"을 이용함으로써 얻은 정보 중 "몰"에게 지적재산권이 귀속된 정보를 "몰"의 사전 
						승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이
						용하게 하여서는 안됩니다.
						
						③ "몰"은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
						
						제23조(분쟁해결)
						① "몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 
						피해보상처리기구를 설치·운영합니다.
						
						② "몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신
						속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
						
						③"몰"과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 
						공정거래위원회 또는 시 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
						
						제24조(재판권 및 준거법)
						①"몰"과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 
						주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 
						주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니
						다.
						
						②"몰"과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
	    				
	    				본 약관은 2020년 7월 21일부터 적용됩니다.
	    			</textarea>
	    			
	    			<p style="float: left; font-weight: bold;">개인정보 수집·이용</p><br/><br/><br/>
	    			<table id="personalInfo">
	    				<tr>
	    					<th>구분</th>
	    					<th>목적</th>
	    					<th>항목</th>
	    				</tr>
	    				<tr>
	    					<td>필수정보</td>
	    					<td>회원제 서비스 이용/ 본인 확인</td>
	    					<td>이름, 아이디, 비밀번호, 이메일, 휴대폰, 생일</td>
	    				</tr>
	    				<tr>
	    					<td>선택정보</td>
	    					<td>마케팅 활용(이벤트, 맞춤형 광고)</td>
	    					<td>휴대폰, 이메일, 쿠키정보</td>
	    				</tr>
	    			</table>
    			</div>
    			
    			<p>귀하께서는 세븐팩토리에서 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다.<p>
				<p>다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.<p>
    			
    		</div>
    		
    		<!-- page-box-2 -> 회원가입창을 제공함 step2의 구현부 -->
    		<div id="page-box-2" class="page-box-2">
		    	<img alt="step2" src="resources/assets/register_img/step2.jpg" ><br/><br/><br/>
				<h5 style="font-weight: bold; color: #6E6E6E">회원 가입</h5>
				
				<div class="register-box">
					<table id="register-table">
						<tr>
							<td>아이디</td>
							<td>
								<input id="mId" type="text" name="mId" autocomplete="off" placeholder="아이디를 입력해주세요" /><br/>
								<span id="idCheckResult"></span>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input id="mPw" type="password" name="mPw" placeholder="비밀번호를 입력해주세요" /><br/>
								<span id="pwCheckResult"></span>
							</td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td>
								<input id="mPw2" type="password" name="mPw2" placeholder="비밀번호를 확인해주세요"  /><br/>
								<span id="pwConfirmResult"></span><br/>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="mName" type="text" name="mName" placeholder="이름을 입력해주세요" /><br/></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input id="mBirth" type="text" name="mBirth" placeholder="8자리 ex)2000-01-01" /><br/>
							<span id="BirthCheckResult"></span>
							</td>
							
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input id="mEmail" type="text" name="mEmail" style="width:250px;" placeholder="이메일을 입력해주세요"/> 
								<input id="authMailBtn" type="button" value="인증번호 받기"/><br/>
								<span id="emailCheckResult"></span><br/>
								<input id="authKey" type="text" name = "authKey" placeholder="인증번호입력"/>
							</td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td>
								<input id="mPhone" type="text" name="mPhone" placeholder="하이픈입력 ex)010-0000-0000" /><br/>
								<span id="phoneCheckResult"></span>
							</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" id="mZipcode" name="mZipcode" placeholder="우편번호" style="width:250px;"/>
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/><br>
								<input type="text" id="mAddr1"  name ="mAddr1" placeholder="주소"style="width:250px;"/><br>
								<input type="text" id="mAddr2"   name ="mAddr2" placeholder="상세주소"style="width:250px;"/>
								<input type="hidden" id="mAddr3" name ="mAddr3" placeholder="참고항목">
							</td>
						</tr>
					</table>
					
					
				</div>
				<input id="clearBtn" type="reset" value="입력취소" /> 		
				<input type="button" value="회원가입" id="signUpBtn"  />
    		</div>

    	</div>
    	

    	    
		 		
		
	</form>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>