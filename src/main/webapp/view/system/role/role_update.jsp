<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色编辑页</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/style.css" />
</head>
<body>
<div class="container-fluid">
	<ol class="breadcrumb">
		<span>当前位置：</span>
		<li><a href="/index">系统管理</a></li>
		<li><a href="####">角色管理</a></li>
		<li><a href="####">编辑角色</a></li>
	</ol>
	<!-- user-form start  -->
	<form class="update-form" id="role-update-form" >
	<input type="hidden" class="form-control" name="id" value="${role.id}">
        	<div class="panel panel-default">
	            <div class="panel-heading">新增角色</div>
	            <div class="panel-body table_add">
		            <table class="table half-table">
		                <tbody>
		                <tr>
		                	<th><span class="required">*</span>角色名称</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="角色名称" name="roleName" value="${role.roleName }">
		                        </div>
		                    </td>
		                    <th>角色名描述</th>
		                    <td>
		                        <div class="form-group ">
		                            <input type="text" class="form-control"  placeholder="角色名描述"  name="roleDesc" value="${role.roleDesc }">
		                        </div>
		                    </td>
		                </tr>
		                <tr>
		                	<th>状态</th>
							<td><div class="wrapper">
								<section class="fields section">
									<div class="fields__item">
										<input type="checkbox" class="uiswitch"  name="hasvalid" id="hasvalid"  value="0">
										<h6>默认关闭</h6>
									</div>
								</section>
							</div>

							</td>
		                    <th></th>
		                    <td>
		                    </td>
		                </tr>
		                </tbody>
		            </table>
			        <div class="col-md-12 text-center btn-margin">
	                    <button class="btn  btn-info" type="button" name="addSub" id="addBtn">
					        <i class="icon-ok bigger-110"></i>           
					                    提交
	                    </button>
	                    <button class="btn" type="button" id="cancelBtn" name="cancelButton">
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
	$("#addBtn").click(function (){
		var roleName=$("input[name=roleName]").val();
		var zxy=document.getElementById('hasvalid');
		if(roleName==null || roleName==''){
			alert("角色名不能为空！");
			$("input[name=orgName]").focus();
			return false;
		} else {
			if (zxy.checked) {
				zxy.value = 1;
			}
			else{
				zxy.checked = true;
				zxy.value = 0;
			}
			$.ajax({
				type: "post",
				url: _path + "/invoicing/system/role/update?__" + (new Date()).getTime(),
				data: $('#role-update-form').serialize(),// 你的formid
			async: false,
			success: function (data) {
				if (data.code == 1) {
					alert("角色保存成功！");
					var url = _path + "/invoicing/system/role/page/list";
					$.get(url, function (data) {
						$("#mian_div").html(data);
						});
					} else {
					alert("角色保存失败");
					}
				}
			});
		}
	});
	
	//返回列表页
	$("#cancelBtn").click(function (){
		var url=_path+"/invoicing/system/role/page/list";
		$.get(url,function(data){
			$("#mian_div").html(data);
		});
	});
</script>
</body>
</html>