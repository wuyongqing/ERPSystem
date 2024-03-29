<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>
<c:choose>
	<c:when test="${empty sessionScope.role}">
		<jsp:forward page="login.jsp"></jsp:forward>
	</c:when>
	<c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'经费申请管理')}">
		<jsp:forward page="menu.jsp"></jsp:forward>
	</c:when>
</c:choose>
<html>
<head>
<title>经费申请</title>
<link rel="stylesheet" href="css/tstyle.css">
<link rel="stylesheet" href="css/mstyle.css">
</head>
<body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div>
<div style="width:100%" align="center">
<form id="myform" class="forms-sample" action="<%=path%>/EC1001AddFRequest.html" method="post">
<div class="col-10 grid-margin stretch-card" >
	<div class="card" style="width:60%;"align="center">
		<div class="card-body" style="width:60%;" align="center">
			<h4 align="center">申请${empty param.uaac501?'添加':'查看'}</h4>
			<c:if test="${!empty param.uaac501 }">
			<div class="form-group" align="left">
				<label for="aac501">申请编号</label>
				<e:text styleClass="form-control" readonly="true" id="aac501" name="aac501"  defval="${ins.aac501 }"/>
			</div>
			</c:if>
			<div class="form-group" align="left">
				<label for="aae103">申请人编号</label>
				<e:text styleClass="form-control"  readonly="true" required="true" id="aae103"  name="aae103" defval="${sessionScope.numb }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aae102">申请人姓名</label>
				<e:text styleClass="form-control"  readonly="true"  required="true" id="aae102" name="aae102"  defval="${sessionScope.name }"/>
			</div>
			<div class="form-group" align="left">
				<label for="aac508">申请类型</label>
				<e:select styleClass="form-control" value="教研经费:1,活动经费:2,后勤经费:3"  id="aac508" name="aac508" defval="${ins.aac508 }"/>
			</div>
			<c:if test="${!empty param.uaac501 }">
			<div class="form-group" align="left">
				<label for="aac504">申请日期</label>
				<e:text styleClass="form-control" required="true" readonly="${param.uaac505>3?true:false }" id="aac504"  name="aac504" defval="${ins.aac504 }"/>
			</div>
			</c:if>
			<div class="form-group" align="left">
				<label for="aac503">申请金额</label>
				<e:number styleClass="form-control" step="1" required="true" readonly="${param.uaac505>3?true:false }"  id="aac503" name="aac503" defval="${ins.aac503 }"/>
			</div>
			<c:if test="${!empty param.uaac501 }">
			<div class="form-group" align="left">
				<label for="fvalue">审批状态</label>
				<e:text styleClass="form-control" readonly="true" id="fvalue" name="fvalue" defval="${ins.fvalue }"/>
			</div>
			</c:if>
			<div class="form-group" align="left">
				<label for="aac502">申请原因</label>
				<e:textarea styleClass="form-control" required="true" readonly="${param.uaac505>3?true:false }"  id="aac502"  name="aac502" defval="${ins.aac502 }" cols="50" rows="10" />
			</div>
			<div class="form-group" align="left">
				<label for="aac506">备注</label>
				<e:textarea styleClass="form-control" id="aac506" name="aac506" readonly="${param.uaac505>3?true:false }" defval="${ins.aac506 }" cols="50" rows="10"/>
			</div>
            <div class="form-group" align="center">
				<c:if test="${param.uaac505<4 }">
				<button type="submit" name="next" class="btn btn-success mr-2"
				   formaction="<%=path%>/EC1001${empty param.uaac501?'Add':'Modify'}FRequest.html?uaac501=${ins.aac501}">${empty param.uaac501?'提交':'修改'}申请</button>
				 </c:if>
				 <c:if test="${param.uaac505>4 }">
				 <button class="btn btn-primary mr-2"onclick="toRecord('${param.uaac501}','${param.uaac505 }','${ins.aac507}')">使用记录</button>
				 </c:if>
	 			<button type="submit" name="next"  class="btn btn-secondary mr-2"
		          formaction="<%=path%>/EC1001QueryFRequest.html"  formnovalidate="formnovalidate">返回</button>
	  		</div>
		</div>
	</div>
</div>
</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript">
     function toRecord(vaac501,vaac505,vaac507)
     {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/EC1401QueryRecord.html?uaac501="+vaac501+"&uaac505="+vaac505+"&uaac507="+vaac507;
    	 vform.submit();
     }
     
</script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>