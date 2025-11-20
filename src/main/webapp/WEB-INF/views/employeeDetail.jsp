<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>员工详情</title>
    <style>
        body {
            font-family: "Segoe UI", "Microsoft YaHei", sans-serif;
            background: linear-gradient(135deg, #fdfbfb, #ebedee);
            margin: 0;
            color: #111827;
        }
        .detail-container {
            max-width: 600px;
            margin: 60px auto;
            background: #fff;
            border-radius: 24px;
            padding: 40px;
            box-shadow: 0 25px 45px rgba(15, 23, 42, 0.15);
        }
        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 600;
        }
        .detail-item {
            margin: 18px 0;
            font-size: 17px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px dashed #e2e8f0;
            padding-bottom: 12px;
        }
        .detail-item span { font-weight: 600; color: #0f172a; }
        .btn {
            padding: 10px 24px;
            text-decoration: none;
            color: #fff;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
        }
        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 20px rgba(15, 23, 42, 0.1);
        }
        .back-btn { background: #0ea5e9; }
        .edit-btn { background: #f97316; }
        .actions { margin-top: 30px; text-align: center; }
    </style>
</head>
<body>
<div class="detail-container">
    <h2>员工详情</h2>
    <div class="detail-item"><span>ID</span>${employee.id}</div>
    <div class="detail-item"><span>姓名</span>${employee.name}</div>
    <div class="detail-item"><span>入职日期</span><fmt:formatDate value="${employee.hireDate}" pattern="yyyy-MM-dd" /></div>
    <div class="detail-item"><span>部门</span>${employee.department}</div>
    <div class="actions">
        <a href="${pageContext.request.contextPath}/employee/list" class="btn back-btn">返回列表</a>
        <a href="${pageContext.request.contextPath}/employee/form?id=${employee.id}" class="btn edit-btn">编辑</a>
    </div>
</div>
</body>
</html>