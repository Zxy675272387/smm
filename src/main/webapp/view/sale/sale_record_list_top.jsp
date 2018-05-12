<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style type="text/css">
.brand_logo {
	width: 25px;
	height: 25px;
}
</style>
<div class="container-fluid">
	<ol class="breadcrumb">
		<span>当前位置：</span>
		<li><a href="#">销售管理</a></li>
		<li><a href="#">畅销销售记录统计</a></li>
	</ol>
	<!-- 列表：查询分页列表 start -->
	<div class="area_table_content cloud_list">
		<div id="buttonsId" class="row list-title">
			<div class="col-md-4">
				<h4>畅销销售记录列表</h4>
			</div>
		</div>
	</div>
</div>
<div class="panel panel-default form-search">
	<div class="panel-footer">
		<button type="button" id="searchBtn" class="btn btn-primary">
			<i class="icon_search"></i>
			本月排行
		</button>
		<button type="button" id="resetBtn" class="btn btn-success">
			<i class="icon-reply icon-only"></i>
			本周排行
		</button>
	</div>
</div>
	<!-- 列表：查询分页列表 end -->
	<script type="text/javascript">
	$(document).ready(function(){
        var buttonsArr =[];
        getData();
        function getData(){
            var _options ={
                url:_path+"/invoicing/sale/record/page/list/top"
                ,checkAll:false
                //查询条件
                ,data:{'updateTime':$("[name=updateTime]").val()}
                ,cloumns:[
					 {name:'商品名称',value:'goodsName'}
                    ,{name:'单价',value:'salePrice',type:"function", fun : function(obj){
	                	return obj.salePrice+".00元";;
	                    }
	                  }
                    ,{name:'数量',value:'saleNumber'}
                    ,{name:'销售总额',value:'paidAmount',type:"function", fun : function(obj){
	                	return obj.paidAmount+".00元";;
	                    }
	                  }
	              	/*,{name:'实收金额',value:'receivableAmount',type:"function", fun : function(obj){
		                	return obj.receivableAmount+".00元";;
	                    }
	                  }
	              	,{name:'找零金额',value:'changeAmount',type:"function", fun : function(obj){
	                	return obj.changeAmount+".00元";;
	                    }
	                  }*/
	              	
	              	,{name:'支付方式',value:'payMethod',type:"function", fun : function(obj){
	              		var html="";
		              		if(obj.payMethod==1){
		              			html+="现金";
		              		}else if(obj.payMethod==2){
		              			html+="银行卡";
		              		}else if(obj.payMethod==3){
		              			html+="预付卡";
		              		}else if(obj.payMethod==4){
		              			html+="微信";
		              		}else if(obj.payMethod==5){
		              			html+="支付宝";
		              		}else{
		              			html+="其他";
		              		}
	                	return html;
	                    }
	                  }
	              	 ,{name:'更新时间',value:'updateTime'}
					, {
						name: '操作', value: 'id', type: "function", fun: function (obj) {
							var html = "";
							// html+=" <a href='javascript:void(0)' class='btn-link' onclick='toDetailPage(" + obj.id + ")'>详细信息</a>"
							html += "  <a href='javascript:void(0)' class='btn-link' onclick='toUpdatePage(" + obj.id + ")'>查看</a>"
							return html;
						}
					}
                ]
                ,buttons:buttonsArr
            };
            // grid(param1,param2);参数1分页数据，参数2table类名如.area_table_content
            $(".area_table_content").grid(_options,".area_table_content");
        }
		//条件查询
		$("#searchBtn").click(function(){
			getData();

		});
		//条件重置
		$("#resetBtn").click(function (){
			var updateTime=updateTime.toLocaleTimeString();
			$("[name=updateTime]").val("2018-5-11");
			getData();
		});
    });

    //编辑销售记录信息
    function toUpdatePage(id){
    	 var url=_path+"/invoicing/sale/record/update/top?id="+id;
		 //调用跳转方法
		 goBackPage(url);
    }
    
</script>