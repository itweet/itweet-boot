<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <title>List</title>
    <meta charset="utf-8">
    <link href="<%=basePath%>style/admin/backstage/css/style.css" rel="stylesheet">
    <script src="<%=basePath%>style/admin/backstage/js/jquery.js"></script>

    <script type="text/javascript">
        KE.show({
            id: 'content7',
            cssPath: './index.css'
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(e) {
            $(".select1").uedSelect({
                width: 345
            });
            $(".select2").uedSelect({
                width: 167
            });
            $(".select3").uedSelect({
                width: 100
            });
        });
        function del() {
            var msg = "您真的确定要删除吗？\n\n请确认！";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>
<div class="formbody">
    <div id="usual1" class="usual">
        <div id="tab2" class="tabson">
            <ul class="seachform">
                <form action="<%=basePath%>/admin/article/select" method="post">
                    <li><label>标题查询</label><input name="title" type="text" class="scinput" value="${title}" /></li>
                    <li><label>&nbsp;</label><input type="submit" class="scbtn" value="查询" /></li>
                </form>
                <li><label>&nbsp;</label><a href="<%=basePath%>/admin/article/add"><input name="" type="button" class="scbtn" value="发布文章" /></a></li>
            </ul>
            <table class="tablelist">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>标题</th>
                    <th>作者</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${articleList}" var="article">
                    <tr>
                        <td>${article.id}</td>
                        <td>${article.title}</td>
                        <td>${article.author}</td>
                        <td>${article.createDate}</td>
                        <td>${article.updateDate}</td>
                        <td>${article.description}</td>
                        <td>
                            <a href="<%=basePath%>/admin/article/view/${article.id}" target="_blank" class="tablelink">预览</a>
                            <a href="<%=basePath%>/admin/article/edit/${article.id}" class="tablelink">修改</a>
                            <c:if test="${article.state eq 1}"><a href="<%=basePath%>/admin/article/cancelRelease/${article.id}" class="tablelink">取消发布</a></c:if>
                            <c:if test="${article.state eq 0}"><a href="<%=basePath%>/admin/article/release/${article.id}" class="tablelink">发布</a></c:if>
                            <a href="<%=basePath%>/admin/article/delete/${article.id}" class="tablelink" onclick="return del()"> 删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <jsp:include page="../../tools/page/page2.jsp"></jsp:include>
        </div>
    </div>
    <script type="text/javascript">
        $("#usual1 ul").idTabs();
    </script>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
</div>
</body>
</html>