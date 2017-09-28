<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jspf" %>
<link href="${basePath}css/other.css" rel="stylesheet" type="text/css" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
  	.tip {
  		color: red;
  		display: block;
  	}
  </style>
  <script type="text/javascript">
  $(function(){
		$("#comfirmPassword").blur(function(){
	  		
			var comfirmPassword = $(this).val();
			var password = $("#password").val();
			if (comfirmPassword !== password && password !=="" && comfirmPassword !== "") {
				$("#tip").text("两次密码不一致")
			} else {
				$("#tip").text("");
			}
		});
  });
  </script>
  </head>
  <body>
  <div class="login-wrapper">
  <div class="form">
  <form action="${basePath }employee/updatePsd.action">
  <h3 class="title">修改密码</h3>
  	<div class="tr">
		 <span class="td">密码：</span>
	  	<span class="td"><input type="password" name="password" id="password"/></span>
	  </div>
	 <div class="tr">
		 <span class="td">确认密码：</span>
	  	<span class="td"><input type="password" id="comfirmPassword"/>
	  		<span class="tip" id="tip"></span>
	  	</span>
	 </div>
	  <div class="tr">
	  	  <span class="td button-collection">
		  	  <button type="submit">修改</button>
		  	  <button type="button" onclick="javascript:history.go(-1);">返回</button>
	  	  </span>
  	  </div>
  	
  		</form>
  	</div>
  </div>
  </body>
</html>
