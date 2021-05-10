<%--
  Created by IntelliJ IDEA.
  User: msik
  Date: 2021/4/3
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="addandupdate" style="border: 1px black solid">
    <input type="hidden" id="fruitId">
    水果名称:<input id="type" type="text">
    水果类型:<input id="breed" type="text">
    水果地点:<input id="area" type="text">
    点评:<input id="brief" type="text">
    数量:<input id="weight" type="text">
    价钱:<input id="price" type="text">
    <a href="javascript:addorupdate()"><button type="button">提交</button></a>
</div>
<form action="list">
    <input type="hidden" name="pageNum" value="1" />
</form>
    <a href="javascript:show()"><button>新增水果</button></a>
    <table border="1">
        <tr>
            <td colspan="8">水果列表</td>
        </tr>
        <tr>
            <td>水果编号</td>
            <td>水果名称</td>
            <td>水果类型</td>
            <td>水果地点</td>
            <td>点评</td>
            <td>数量</td>
            <td>价钱</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list}" var="f">
            <tr>
                <td>${f.fruitId}</td>
                <td>${f.type}</td>
                <td>${f.breed}</td>
                <td>${f.area}</td>
                <td>${f.brief}</td>
                <td>${f.weight}</td>
                <td>${f.price}</td>
                <td>
                    <a href="javascript:showupdate(${f.fruitId})"><button>修改</button></a>
                    <a href="javascript:del(${f.fruitId})"><button>刪除</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
<div class="row">
    <div class="col-sm-5">
        <div class="dataTables_info" id="datatable-responsive_info"
             role="status" aria-live="polite">共${pages.total }条记录
            ${pages.pageNum }/${pages.pages }页</div>
    </div>
    <div class="col-sm-7">
        <div class="dataTables_paginate paging_simple_numbers"
             id="datatable-responsive_paginate">
            <ul class="pagination">
                <c:if test="${pages.pageNum > 1}">
                    <li class="paginate_button previous"><a
                            href="javascript:page_nav(document.forms[0],1);"
                            aria-controls="datatable-responsive" data-dt-idx="0"
                            tabindex="0">首页</a>
                    </li>
                    <li class="paginate_button "><a
                            href="javascript:page_nav(document.forms[0],${pages.pageNum-1});"
                            aria-controls="datatable-responsive" data-dt-idx="1"
                            tabindex="0">上一页</a>
                    </li>
                </c:if>
                <c:if test="${pages.pageNum < pages.pages }">
                    <li class="paginate_button "><a
                            href="javascript:page_nav(document.forms[0],${pages.pageNum+1 });"
                            aria-controls="datatable-responsive" data-dt-idx="1"
                            tabindex="0">下一页</a>
                    </li>
                    <li class="paginate_button next"><a
                            href="javascript:page_nav(document.forms[0],${pages.pages });"
                            aria-controls="datatable-responsive" data-dt-idx="7"
                            tabindex="0">最后一页</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</div>

<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
<script>
    $(function () {
        hide();
    })
    function hide() {
        $("#addandupdate").hide();
        $("#type").val("");
        $("#breed").val("");
        $("#area").val("");
        $("#brief").val("");
        $("#weight").val("");
        $("#price").val("");
    }
    function show() {
        $("#addandupdate").show();
    }
    function addorupdate() {
        var type=$("#type").val();
        var breed=$("#breed").val();
        var area=$("#area").val();
        var brief=$("#brief").val();
        var weight=$("#weight").val();
        var price=$("#price").val();
        var fruitId=$("#fruitId").val();
        $.ajax({
            url:"addandUpdate",
            data:{"fruitId":fruitId,"type":type,"breed":breed,"area":area,"brief":brief,"weight":weight,"price":price},
            dataType:"JSON",
            type:"POST",
            success:data=>{
                if (data){
                    alert("成功");
                    hide();
                    //刷新当前页面
                    window.location.reload();
                }else{
                    alert("失败");
                    hide();
                }
            }
        })
    }
    function showupdate(fruitId) {
        show();
        $.ajax({
            url:"getFruitById",
            data: {"fruitId":fruitId},
            dataType: "json",
            type:"post",
            success:data=>{
                $("#fruitId").val(data["fruitId"]);
                $("#type").val(data["type"]);
                $("#breed").val(data["breed"]);
                $("#area").val(data["area"]);
                $("#brief").val(data["brief"]);
                $("#weight").val(data["weight"]);
                $("#price").val(data["price"]);
            }
        })
    }
    function del(fruitId) {
        if (confirm("确认要删除吗?")){
            $.post("delF",{fruitId:fruitId},data=>{
                if (data){
                    alert("删除成功");
                    window.location.reload();
                }else{
                    alert("删除失败");
                }

            },"json")
        }
    }
    function page_nav(frm,num){
        frm.pageNum.value = num;
        frm.submit();
    }
</script>
</body>
</html>
