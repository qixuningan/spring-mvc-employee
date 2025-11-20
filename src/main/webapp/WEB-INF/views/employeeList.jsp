<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>员工列表</title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: "Segoe UI", "Microsoft YaHei", sans-serif;
            background: linear-gradient(135deg, #edf2f7 0%, #fdfbfb 100%);
            margin: 0;
            color: #2c3e50;
        }
        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 20px 40px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }
        .card {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(15, 23, 42, 0.1);
            padding: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 14px 12px;
            text-align: center;
        }
        th {
            background-color: #f8fafc;
            color: #64748b;
            font-weight: 600;
            border-bottom: 2px solid #e2e8f0;
        }
        tr {
            transition: background-color 0.2s ease;
        }
        tr:nth-child(even) { background: #f8fafc; }
        tr:hover { background: #eef2ff; }
        .btn {
            display: inline-block;
            padding: 8px 16px;
            text-decoration: none;
            color: #fff;
            border-radius: 999px;
            font-size: 14px;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }
        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .add-btn {
            background: linear-gradient(120deg, #34d399, #10b981);
            margin-bottom: 10px;
        }
        .detail-btn { background-color: #3b82f6; }
        .edit-btn { background-color: #f59e0b; }
        .delete-btn { background-color: #ef4444; }
        .actions a { margin: 0 4px; }
        .toolbar {
            display: flex;
            justify-content: flex-end;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>员工信息管理系统</h2>
    <div class="card">
        <div class="toolbar">
            <a href="${pageContext.request.contextPath}/employee/form" class="btn add-btn">+ 添加新员工</a>
        </div>
        <table>
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>入职日期</th>
                <th>部门</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${employees}" var="emp">
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.name}</td>
                    <td><fmt:formatDate value="${emp.hireDate}" pattern="yyyy-MM-dd" /></td>
                    <td>${emp.department}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/employee/detail/${emp.id}" class="btn detail-btn">详情</a>
                        <a href="${pageContext.request.contextPath}/employee/form?id=${emp.id}" class="btn edit-btn">编辑</a>
                        <a href="${pageContext.request.contextPath}/employee/delete/${emp.id}" class="btn delete-btn" onclick="return confirm('确定删除吗？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>