<%@ page pageEncoding="GBK" language="java" %>
<%@ taglib prefix="e" uri="http://org.wangxg/jsp/extl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>物资变更</title>

    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/tstyle.css">
    <link rel="stylesheet" href="css/mstyle.css">

    <style type="text/css">
        hh{
            color: red;
        }
    </style>

     <c:choose>
         <c:when test="${empty sessionScope.role}">
             <jsp:forward page="login.jsp"></jsp:forward>
         </c:when>
         <c:when test="${!fn:contains(applicationScope.menu[sessionScope.role],'物资管理')}">
             <jsp:forward page="menu.jsp"></jsp:forward>
         </c:when>
     </c:choose>

</head><body style="background-color: #F5F5F5">
<div id="msg" style="position:fixed;margin-left:15px;height:30px;width:250px;z-index:10;text-align: left;font-size: 16px"><label id="msg1">${msg }</label></div><div style="width:100%" align="center">
<form class="forms-sample" name="modSup" action="<%=request.getContextPath()%>/eF0803.html" method="post">
    <div class="col-10 grid-margin stretch-card" >
        <div class="card" style="width:60%;"align="center">
            <div class="card-body" style="width:60%;" align="center">
        <h4 align="center">
            物资变更
        </h4>

        <div class="form-group" align="left">
            <label for="aae502">物资名称 :</label>
            <e:text styleClass="form-control" name="aae502" id="aae502" readonly="true" defval="${ins.aae502}"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae103">执行人编号 :</label>
            <e:text styleClass="form-control" name="aae103" id="aae103" autofocus="true" maxlength="8" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae602">变更类型 :</label>
            <e:select styleClass="form-control" name="aae602" id="aae602" value="新购:1,领用:2" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae604">变更数量
                <c:if test="${ins.aae503!=null}">
                    <hh>(当前数量[${ins.aae503}])</hh> :
                </c:if>
            </label>
            <e:number styleClass="form-control" step="1" onchange="if(value.length>8)value=value.slice(0,8)" name="aae604" id="aae604" required="true"/>
        </div>

        <div class="form-group" align="left">
            <label for="aae605">备注 :</label>
            <e:textarea styleClass="form-control" name="aae605" id="aae605" rows="6" cols="30"/>
        </div>

        <div class="form-group" align="center">
            <button type="submit" class="btn btn-success mr-2" name="next">确定</button>
            <button type="submit" class="btn btn-secondary mr-2" name="next"
                    formaction="<%=request.getContextPath()%>/eF0801.html"
                    formnovalidate="formnovalidate">返回</button>
        </div>

    <input type="hidden" name="aae501" value="${param.aae501}">

            </div>
        </div>
    </div>
</form>
</div>
<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body>
</html>
