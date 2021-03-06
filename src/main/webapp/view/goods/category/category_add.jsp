<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户添加页</title>
</head>
<body>
<div class="container-fluid">
	<ol class="breadcrumb">
		<span>当前位置：</span>
		<li><a href="/index">商品管理</a></li>
		<li><a href="####">分类管理</a></li>
		<li><a href="####">添加分类</a></li>
	</ol>
	<!-- user-form start  -->
	<form class="add-form" id="category-add-form" method="post">
		<div class="panel panel-default">
			<div class="panel-heading">新增分类</div>
			<div class="panel-body table_add">
				<table class="table half-table">
					<tbody>
					<tr>
						<th><span class="required">*</span>分类名称</th>
						<td>
							<div class="form-group ">
								<input type="text" class="form-control"  placeholder="最多可输入20个汉字" name="categoryName" value="">
							</div>
						</td>
						<th>上级目录</th>
						<td>
							<div class="form-group ">
								<select class="form-control"  name="parentId" id="parentId">
									<option value="1" selected="selected">食品</option>
									<option value="2">日用品</option>
									<option value="3">文具</option>
									<option value="0">无</option>
								</select>
							</div>
						</td>
						<!--<th><span class="required">*</span>上级类目</th>
						<td>
							<div class="form-group ">
								<input type="text" class="form-control"  placeholder="请输入字母"  name="pCategoryName" value="">
							</div>
						</td>-->
					</tr>
					<tr>
						<th>级别</th>
						<td>
							<div class="form-group ">
								<select class="form-control"  name="categoryLevel" id="categoryLevel">
									<option value="1" selected="selected">1级</option>
									<option value="2">2级</option>
								</select>
							</div>
						</td>
						<th></th>
						<td>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="col-md-12 text-center btn-margin">
					<button class="btn btn-info" type="button"  id="addBtn">
						<i class="icon-ok bigger-110"></i>
						提交
					</button>
					<button class="btn" id="cancelBtn" type="button" name="cancelButton">
						<i class="icon-undo bigger-110"></i>
						取消
					</button>
				</div>
			</div>
		</div>
	</form>
	<!-- user-form end -->
</div>
<script type="text/javascript">
	//添加用户
	$("#addBtn").click(function (){
		var categoryName=$("input[name=categoryName]").val();
		//var pCategoryName=$("input[name=pCategoryName]").val();
		var categoryLevel=$("input[name=categoryLevel]").val();
		var parentId=$("input[name=parentId]").val();
		if(categoryName==null || categoryName==''){
			alert("名称不能为空！");
			$("input[name=categoryName]").focus();
			return false;
		}
		/*if(pCategoryName==null || pCategoryName==''){
			alert("登不能为空！");
			$("input[name=pCategoryName]").focus();
			return false;
		}*/else{
			$.ajax({
				type : "post",
				url : _path+"/invoicing/goods/category/add",
				data:$('#category-add-form').serialize(),// 你的formid
				async:false,
				success : function(data) {
					if(data.code==1){
						alert("保存成功！");
						var url=_path+"/invoicing/goods/category/page/list";
						goBackPage(url);
					}else{
						alert("保存失败！");
					}
				}
			});
		}

	});

	//取消
	$("#cancelBtn").click(function(){
		var url=_path+"/invoicing/goods/category/page/list";
		//调用跳转方法
		goBackPage(url);
	});
</script>
</body>
</html>