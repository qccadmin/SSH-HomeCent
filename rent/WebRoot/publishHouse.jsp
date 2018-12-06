<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>upload</title>


<!-- 引入css文件 -->
<link rel="stylesheet" type="text/css" href="css/fileinput.min.css" />
<link rel="stylesheet"
	href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- 引入js文件 -->
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script
	src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/fileinput.min.js"></script>
<script type="text/javascript" src="js/zh.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<!-- <script src="//cdn.bootcss.com/bootstrap-fileinput/4.3.5/js/fileinput.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-fileinput/4.3.5/js/locales/zh.min.js"></script> -->
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/js.js"></script>
<link rel="stylesheet" href="./layui/css/layui.css">
<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./javascript/dw_form_submit.js"></script>

</head>
<script type="text/javascript">
	/*  	function pubhouse(){
	 		var da=$("#pub_house").serialize();
	 		da= decodeURIComponent(da,true);
	 		alert(da);
	 		$.post("house_pub",da,function(data){
	 			
	 			alert("11");
	 		});
	 		
	 		 jQuery.ajax({

	 		       url:"house_pub",

	 		       type:"post",

	 		       data:da,

	 		       success:function(msg){

	 		         alert(msg);

	 		       }

	 		    });
	 	} */

</script>
<body>
	<div class="content">
		<div class="width1190">
			<jsp:include page="left_menu.jsp"></jsp:include>
			<div class="vip-right">
				<h3 class="vipright-title">发布房源</h3>
					 <form  id="pub_house" action="house_pub" method="post" >
					
					<table class="grinfo">
						<tbody>

							<tr>
								<th><span class="red">*</span> 房源名称：</th>
								<td>
									<input type="text" class="inp inw" name="housename"
									id="housename" value="" placeholder="请输入标题" /><span
									class="spa spa1"></span><br />
								</td>
							</tr>
							<tr>
								<th><span class="red">*</span>房源区域：</th>
								<td>
								<select id="regionid" name="regionid.regionid" >
										<c:forEach items="${rglist }" var="r">
											<option value="${r.regionid }">&nbsp;&nbsp;&nbsp;${r.regionname }</option>
										</c:forEach>
								</select>
									</td>

							</tr>
								<tr>
								<th><span class="red">*</span>期望租金：</th>
								<td>
								<input type='text' id="rentmoney" class="inp inw"  placeholder="请输入整数租金"  name="rentmoney" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" onblur="this.v();" />
								<span class="spa spa2"></span></td>
							</tr>
							<tr>
								<th><span class="red">*</span>出租类型 ：</th>
								<td><select id="rent"  name="renttype.cid">
										<option selected="selected" disabled="disabled" value="0">--请选择--</option>
										<c:forEach items="${rentlist }" var="r">
											<option value="${r.cid }">&nbsp;&nbsp;&nbsp;&nbsp;${r.ctext }</option>

										</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th><span class="red">*</span>房源面积：</th>
								<td>
								<input type='text' class="inp inw"  placeholder="请输入整数面积" name="area" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" onblur="this.v();" />&nbsp;m²
								</td>
							</tr>
							<tr>
								<th><span class="red">*</span>选择户型：</th>
								<td>
									<div class="zhiding-list" >
										<input type="number" name="typeid.room" value="1" id="room" min="1"
											style="width: 40px;height: 25px;" />&nbsp;室&nbsp;- <input
											type="number" name="typeid.hall" value="0" id="hall" min="0"
											style="width: 40px;height: 25px;" />&nbsp;厅&nbsp;- <input
											type="number" value="0" name="typeid.toilet" id="toilet" min="0"
											style="width: 40px;height: 25px;" onblur="isHave()" />&nbsp;卫&nbsp;
										<span id="myspan"></span>
									</div>

								</td>

							</tr> 
							<tr>
								<th><span class="red">*</span>选择朝向：</th>
								<td><select id="orientation" name="orientation.cid">
										<c:forEach items="${orlist }" var="o">
											<option value="${o.cid }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${o.ctext }</option>

										</c:forEach>
								</select></td>

							</tr>
							<tr>
								<th><span class="red"></span>选择楼层：</th>
								<td><!-- <input class="inp inw" type="text" id="floor"
									name="house.floor"> -->
										<input class="inp inw" name="floor" type='text' onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)" onblur="this.v();" />
									
									</td>

							</tr>
							<tr>
								<th><span class="red">*</span>房源详细地址：</th>
								<td><input class="inp inw" name="haddress" id="haddress" type="text" 
									><span class="spa spa3"></span></td>

							</tr>
							<tr>
								<th><span class="red">*</span>装修类型：</th>
								<td><select id="renovate" name="renovate.cid">
										<c:forEach items="${zxlist }" var="zx">
											<option value="${zx.cid }">&nbsp;&nbsp;&nbsp;&nbsp;${zx.ctext }</option>

										</c:forEach>
								</select> </td>

							</tr>
							<tr>
								<th valign="top">房源描述：</th>
								<td><textarea id="sign" class="grtextarea" name="discreption"></textarea> <br>
									<span class="fgrey"><!-- (128字符以内) --></span></td>
							</tr>
							<tr>
								<th><span class="red">*</span> 上传图片：</th>
								<td>
									<div class="form-group">
										<div class="col-sm-4" style="width: 400px;">
											<input id="file" id="myfile" name="myfile" multiple type="file"
												data-show-caption="true">
											<p class="help-block">支持jpg、jpeg、png格式，大小不超过2.0M</p>
										</div>
									</div>

								</td>


							</tr>



							<tr>
								<th>&nbsp;</th>
								<td colspan="2"><label class="butt" id="butt">
										<input type="submit"  class="member_mod_buttom"  value="提交申请" >
								</label></td>

							</tr>
						</tbody>
					</table>
				</form>
		
			</div>
			<!--vip-right/-->
			<div class="clearfix"></div>
		</div>
		<!--width1190/-->
	</div>
	<!--content/-->
	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<script
		src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/fileinput.min.js"></script>
	<script type="text/javascript" src="js/zh.js"></script>

	<script type="text/javascript">
		function initFileInput(ctrlName, uploadUrl) {
			var control = $('#' + ctrlName);
			control.fileinput({
				language : 'zh', //设置语言
				uploadUrl : 'rent/FileMore', //上传地址
				showUpload : false, //是否显示上传按钮
				showRemove : true,
				dropZoneEnabled : false,
				showCaption : true,//是否显示标题
				allowedPreviewTypes : [ 'image' ],
				allowedFileTypes : [ 'image' ],
				allowedFileExtensions : [ 'jpg', 'png' ],
				maxFileSize : 2000,
				maxFileCount : 5,
			//initialPreview: [ 
			//预览图片的设置
			//      "<img src='http://127.0.0.1:8080/NewsManageSys/plugin/umeditor1_2_2/jsp/upload/20161030/55061                       477813913474.jpg' class='file-preview-image' alt='肖像图片' title='肖像图片'>",
			//],

			}).on("filebatchselected", function(event, files) {
				$(this).fileinput("upload");
			}).on("fileuploaded", function(event, data) {
				console.log(data.response)
				$("#path").attr("value", data.response);
			});
		}

		$(function() {
			var path = "${base}/mail/upload.html";
			initFileInput("file", path);

		})
	</script>
	<script type="text/javascript">
		window.onload = function() {
			$("#housename").focus()
		}

		/************************  失焦判断  **********************************/
		$("input")
				.blur(
						function() {
							$(".spa").css("color", "#BD362F")
							if ($(this).is("#housename")) { //姓名判断
								var na = /^[\u4E00-\u9FA5]{6,10}$/
								if ($("#housename").val() != "") {
									if (!(na.test($("#housename").val()))) {
										$(".spa1").text("请输入6-20个汉字");
										$(this).css("border",
												"1px solid #BD362F")
										return false;
									} else if (na) {
										$(".spa1").text("");
										return true;
									}
								} else {
									$(".spa1").text("");
								}
							}
							if ($(this).is("#userphone")) { //手机号判断
								var ph = /^1[3|5|7|8|][0-9]{9}$/
								if ($("#userphone").val() != "") {
									if (!(ph.test($("#userphone").val()))) {
										$(".spa2").text("请输入正确手机号");
										$(this).css("border",
												"1px solid #BD362F")
										return false;
									} else if (ph) {
										$(".spa2").text("");
										return true;
									}
								} else {
									$(".spa2").text("");
								}
							}

							
						})
		/********************** 聚焦提示 ************************/
		$("input").focus(function() {
			if ($(this).is("#housename")) {
				$(".spa1").text("6-20个汉字").css("color", "#aaa")
				$(this).css("border", "1px solid #aaa")
			}
			if ($(this).is("#userphone")) {
				$(".spa2").text("11位手机号码").css("color", "#aaa")
				$(this).css("border", "1px solid #aaa")
			}
		})
		/*********************** 提交验证 ***************************/
		$("#sub")
				.click(
						function() {
							var na = /^[\u4E00-\u9FA5]{2,4}$/; //姓名正则
							var ph = /^1[3|5|7|8|][0-9]{9}$/; //手机号正则
							var ad = /^(?=.*?[\u4E00-\u9FA5])[\dA-Za-z\u4E00-\u9FA5]{8,32}/; //地址正则
							if (na.test($("#housename").val())
									&& ph.test($("#rentmoney").val())) {
								return true;
							} else {
								if ($("#housename").val() == "") {
									$(".spa1").text('请你填写房源名称')
								}
								if ($("#rentmoney").val() == "") {
									$(".spa2").text('请你填写期望租金')
								}
								if ($("#haddress").val() == "") {
									$(".spa3").text('请你填写房源地址')
								}
								if ($("#myfile").val() == "") {
									$(".spa4").text('请你填写房源地址')
								}
								return false;
							}
						})
	</script>

</body>

</html>
