<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../common/common.jsp"%>
<head>
	<meta charset="utf-8" />
	<title>家家利超市管理系统</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style2.css" />
	<style type="text/css">
		.menu_li {
			cursor: pointer;
		}
		.center{
			width: 100%;
			height: 200px;
			position:fixed;
			left:29%;
			top:40%;
			margin-left:width/2;
			margin-top:height/2;



		}
		/**主页顶部背景样式**/
		#main_page_top_div {
			width: 100%;
			height: 200px;
			background-image:url('../static/images/j_x_c_1.png');
			background-repeat: no-repeat;
			background-position: center top;
		}
		/**主页底部背景样式**/
		#main_page_bottom_div {
			background-image:url('../static/images/jxc_main_bg.png');
			background-repeat: no-repeat;
			background-position: right bottom;
		}
	</style>
</head>

<body>
<div class="navbar navbar-default" id="navbar">
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>

	<div class="navbar-container" id="navbar-container">
		<div class="navbar-header pull-left">
			<a href="/invoicing/main" class="navbar-brand"> <small> <i
					class="icon-leaf"></i>
				<span style="font-weight: 800px;">
							家家利超市管理系统
						</span>
			</small>
			</a>
			<!-- /.brand -->
		</div>
		<!-- /.navbar-header -->

		<div class="navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue"><a data-toggle="dropdown" href="#"
										  class="dropdown-toggle"> <img class="nav-user-photo"
																		src="<%=request.getContextPath()%>/static/avatars/avatar2.png" alt="Jason's Photo" /> <span
						class="user-info"> <small>欢迎光临,</small> ${userLoginInfo.userName}
						</span> <i class="icon-caret-down"></i>
				</a>

					<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<!--<li><a href="#"> <i class="icon-cog"></i> 修改密码
						</a></li>

						<li><a href="#"> <i class="icon-user"></i> 个人资料
						</a></li>

						<li class="divider"></li>-->

						<li><a href="/invoicing/logout"> <i class="icon-off"></i> 退出
						</a></li>
					</ul></li>
			</ul>
			<!-- /.ace-nav -->
		</div>
		<!-- /.navbar-header -->
	</div>
	<!-- /.container -->
</div>
<!--page top end-->
<!--page main start-->
<div class="main-container" id="main-container">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

	<div class="main-container-inner">
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
		</a>

		<div class="sidebar" id="sidebar">
			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
			</script>
			<ul class="nav nav-list" id="menu_id">

			</ul>
			<!-- /.nav-list -->

			<div class="sidebar-collapse" id="sidebar-collapse">
				<i class="icon-double-angle-left"
				   data-icon1="icon-double-angle-left"
				   data-icon2="icon-double-angle-right"></i>
			</div>

			<script type="text/javascript">
				try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
			</script>
		</div>

		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>

				<span style="margin-left: 15px;font-size: 14px;">北京时间：</span><span id="time"></span>
				<!-- <ul class="breadcrumb">
                    <li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
                </ul> -->
				<!-- .breadcrumb -->

				<!--<div class="nav-search" id="nav-search">
                        <form class="form-search">
                            <span class="input-icon">
                                <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                                <i class="icon-search nav-search-icon"></i>
                            </span>
                        </form>
                    </div>&lt;!&ndash; #nav-search &ndash;&gt;-->
			</div>

			<div class="page-content">
				<div class="page-header" id="mian_div" >

				</div>
				<!-- /.page-header -->
				<!--add other page-->
				<div class="row" id="main_page_div">
					<div id="main_page_top_div">
					</div>
					<div id="main_page_bottom_div"  >
						<div class="center"id="QuickCheck" >
						<a href="javascript:void(0)" class="a-btn" onclick="toUser()">
								<span class="a-btn-symbol">J</span>
								<span class="a-btn-text">用户管理</span>
								<span class="a-btn-slide-text">管理用户基本信息</span>
							</a>
							<a href="javascript:void(0)" class="a-btn" onclick="toGood()">
								<span class="a-btn-symbol">i</span>
								<span class="a-btn-text">价格管理</span>
								<span class="a-btn-slide-text">查看并修改商品信息</span>
							</a>
							<a href="javascript:void(0)" class="a-btn" onclick="toStock()">
								<span class="a-btn-symbol">w</span>
								<span class="a-btn-text">库存预警</span>
								<span class="a-btn-slide-text">查看数量不足的库存</span>
							</a>
							<a href="javascript:void(0)" class="a-btn" onclick="toSale()">
								<span class="a-btn-symbol">X</span>
								<span class="a-btn-text">畅销商品</span>
								<span class="a-btn-slide-text">查看哪个商品卖得最好</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->
		<!--导航栏
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="btn btn-app btn-xs btn-warning ace-settings-btn"
                         id="ace-settings-btn">
                        <i class="icon-cog bigger-150"></i>
                    </div>

                    <div class="ace-settings-box" id="ace-settings-box">
                        <div>
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="default" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; 选择皮肤</span>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-navbar" /> <label class="lbl"
                                                                      for="ace-settings-navbar"> 固定导航条</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-sidebar" /> <label class="lbl"
                                                                       for="ace-settings-sidebar"> 固定滑动条</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-breadcrumbs" /> <label class="lbl"
                                                                           for="ace-settings-breadcrumbs">固定面包屑</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-rtl" /> <label class="lbl"
                                                                   for="ace-settings-rtl">切换到左边</label>
                        </div>

                        <div>
                            <input type="checkbox" class="ace ace-checkbox-2"
                                   id="ace-settings-add-container" /> <label class="lbl"
                                                                             for="ace-settings-add-container"> 切换窄屏 <b></b>
                        </label>
                        </div>
                    </div>
                </div>
                <!-- /#ace-settings-container -->
	</div>-->
	<!-- /.main-container-inner -->

	<a href="#" id="btn-scroll-up"
	   class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="icon-double-angle-up icon-only bigger-110"></i>
	</a>
</div>

<!-- 加载主页js文件 -->
<script src="<%=request.getContextPath()%>/static/js/index.js"></script>
<!-- inline scripts related to this page -->
<!-- 加载当前登录时间 -->
<script type="text/javascript">
	$(function(){
//加载菜单树...
		loadTree();
//main页面自适应高度设置
		autoHeight();
		window.onresize=autoHeight();
//日期设置
		setInterval( function() {
			$('#time').html(currentTime)
		}, 1000);
//菜单跳转（div+js实现ifream框架内页面跳转）	
		$('.menu_li').click(function(){//点击li加载界面
			//影藏主内容
			$("#main_page_div").hide();
			var _path="/superMarketInvoicingManage";
			var current = $(this),
					target = current.find('a').attr('target'); // 找到链接a中的targer的值
			//移除当前的a标签属性
			//current.removeAttr('href');
			$.get(target,function(data){
				//console.log(target);
				$("#mian_div").html(data);
			});
		});
	});
	function toUser() {
		document.getElementById('main_page_div').style.display='none';
		var url ="/invoicing/system/user/list";
		goBackPage(url);
	}
	function toGood() {
			document.getElementById('main_page_div').style.display='none';//show的display属性设置为none（隐藏）
		var url ="/invoicing/goods/price/page/list";
		goBackPage(url);
	}
	function toStock() {
		document.getElementById('main_page_div').style.display='none';
		var url ="/invoicing/stock/ground/page/list?flag=2";
		goBackPage(url);
	}
	function toSale() {
		document.getElementById('main_page_div').style.display='none';
		var url ="/invoicing/sale/record/page/list/top";
		goBackPage(url);
	}
</script>
</body>
</html>