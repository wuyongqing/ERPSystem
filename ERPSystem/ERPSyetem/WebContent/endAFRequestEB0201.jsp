<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'经费拨出与结算')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>经费使用记录</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
<style type="text/css">
     tr
     {
        height:38px;
        font-size:15;
     }
     td
     {
         text-align:center;
         width:50px;
         height:38px;
     }
</style>
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>

<div class="col-md-6 grid-margin stretch-card" style="max-width:100%; " align="center">
      <div class="card" style="max-width: 100%; " align="center">
           <div class="card-body" style="max-width:100%" align="center">
			<form id="myform" action="<%=path%>/EB0201QueryAFRecord.html?uaac501=${param.uaac501 }&aac507=${param.aac507 }" method="post">
	               <h4 align="center">经费使用记录</h4>
	    			<table class="table-bordered"  width="100%" align="center">
					  <tr>
					    <td colspan="6">查询条件</td>
					  </tr>
					  <tr>
					    <td>使用人</td>
					    <td>
					      <e:text name="qaae102" styleClass="form-control" style="width:100%"/>
					    </td>
					    <td>开始日期</td>
					    <td>
					    <e:date name="baad105" styleClass="form-control" style="width:100%"/>        
					    </td>
					    <td>结束日期</td>
					    <td>
					      <e:date name="eaad105" styleClass="form-control" style="width:100%"/> 
					    </td>
					  </tr>
					</table>
					<table id="recordlist" class="table-bordered"  width="100%" align="center">
						  <tr>
						    <td>序号</td>
						    <td>使用人</td>
						    <td>使用类型</td>
						    <td>使用金额</td>
						    <td>使用日期</td>
						    <td>功能区</td>
						  </tr>
						   <c:choose>
						     <c:when test="${rows!=null }">
						         <!-- 显示实际查询到的数据 -->
							     <c:forEach items="${rows }" var="ins" varStatus="vs">
						    	   	  <tr>
									    <td>${vs.count}</td>
									    <td>${ins.aae102}</td>
									    <td>${ins.fvalue}</td>
									    <td>${ins.aad103}</td>
									    <td>${ins.aad105}</td>
									     <td>
									    <!-- #  空锚 -->
									      <button class="btn btn-primary mr-2" onclick="onEdit('${ins.aad101}','${param.uaac501}','${param.aac507 }','${param.aae101 }')">详情</button>
									     </td>
									  </tr>
							      </c:forEach>
							      <!-- 补充空行 -->
							      <c:forEach begin="${fn:length(rows)+1 }" step="1" end="${(fn:length(rows)%10>0)?(fn:length(rows)+10-fn:length(rows)%10):(fn:length(rows)) }">
								          <tr>
								            <td></td>
								            <td></td>
								            <td></td>
								            <td></td>
								            <td></td>
								            <td></td>
								          </tr>
							      </c:forEach>
						     </c:when>
						     <c:otherwise>
						        <c:forEach begin="1" step="1" end="10">
						           <tr>
						             <td></td>
						             <td></td>
						             <td></td>
						             <td></td>
						             <td></td>
						             <td></td>
						           </tr>
						        </c:forEach>
						     </c:otherwise>
						   </c:choose>
						</table>
						<div class="form-group" align="center" style="margin-top:15px">
							<div class="gridItem" style="padding: 5px; width: 40%; float: left; text-align: right; height: 20px; font-size: 15px;" > 
						        共有 <span id="spanTotalInfor">${fn:length(rows) }</span> 条记录     
						        当前第<span id="spanPageNum"></span>页     
						        共<span id="spanTotalPage"></span>页
						    </div>
						    <div class="gridItem" style="margin-left:50px;width: 40%;  padding: 5px; float: left; text-align: center; height: 20px; vertical-align: middle; font-size: 15px;">   
						            <span id="spanFirst" >首页</span> 
						            <span id="spanPre">上一页</span>
						            <span id="spanInput" style="margin: 0px; padding: 0px 0px 4px 0px; height:100%; "> 
						                第<input id="Text1" type="text" class="TextBox" onkeyup="changepage()"   style="height:20px; text-align: center;width:50px" />页 
						            </span>
						            <span id="spanNext">下一页</span> 
						            <span  id="spanLast">尾页</span> 
						        </div>
					        </div>
							<!-- 功能按钮区 -->
							<div style="width:100%;margin-top: 25px;float:left" align="center" >
								<div class="form-group" align="center" >
						       <button type="submit" name="next" class="btn btn-primary mr-2">查询</button>
						       <c:if test="${param.aac507==3 }">
						             <button type="submit" name="next" class="btn btn-info mr-2"
							             formaction="<%=path%>/EB0201EndAFRequest.html?uaac501=${param.uaac501}&aae101=${param.aae101}">
						               结算</button>
						       </c:if>
						       <button type="submit" name="next" class="btn btn-secondary mr-2" 
							    	formaction="<%=path%>/EB0201QueryAFRequest.html?uaac501=${param.uaac501}" formnovalidate="formnovalidate">
						            返回</button>
							   </div>
						    </div>
						</form>
				</div>
		</div>
</div>
	<script type="text/javascript">
      function onEdit(vaad101,vaac501,vaac507,vaae101)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EB0201LookAFRecord.html?aad101="+vaad101+"&uaac501="+vaac501+"&uaac507="+vaac507+"&aae101="+vaae101;
    	 vform.submit();
      } 
   </script>
	<script type="text/javascript">
            var theTable = document.getElementById("recordlist");
            var txtValue = document.getElementById("Text1").value;
            var numberRowsInTable = ${(fn:length(rows)%15>0)?(fn:length(rows)+15-fn:length(rows)%15):(fn:length(rows)) };//表格最大行数
            var colunm=${fn:length(rows) };
    </script>
<script type="text/javascript" src="js/Pagging.js"></script>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>