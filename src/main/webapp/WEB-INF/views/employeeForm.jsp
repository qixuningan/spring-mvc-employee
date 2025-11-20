<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>
        <c:if test="${employee.id != null}">编辑员工</c:if>
        <c:if test="${employee.id == null}">添加员工</c:if>
    </title>
    <style>
        * { box-sizing: border-box; }
        body {
            font-family: "Segoe UI", "Microsoft YaHei", sans-serif;
            background: linear-gradient(135deg, #eef2ff, #f8fafc);
            margin: 0;
            color: #1f2937;
        }
        .container {
            max-width: 640px;
            margin: 40px auto;
            padding: 0 20px 40px;
        }
        h2 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
        }
        .card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(15, 23, 42, 0.12);
            padding: 35px 40px;
        }
        form { display: flex; flex-direction: column; gap: 18px; }
        label {
            font-size: 14px;
            color: #64748b;
            margin-bottom: 6px;
            display: block;
        }
        input {
            width: 100%;
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            font-size: 15px;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }
        input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99,102,241,0.15);
        }
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin-top: 10px;
        }
        .btn {
            border: none;
            border-radius: 999px;
            padding: 10px 28px;
            cursor: pointer;
            font-size: 15px;
            transition: transform 0.15s ease, box-shadow 0.15s ease;
            color: #fff;
        }
        .btn-primary {
            background: linear-gradient(120deg, #6366f1, #8b5cf6);
        }
        .btn-secondary {
            background: #94a3b8;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 12px 20px rgba(15, 23, 42, 0.15);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>
        <c:if test="${employee.id != null}">编辑员工</c:if>
        <c:if test="${employee.id == null}">添加员工</c:if>
    </h2>
    <div class="card">
        <c:if test="${employee.hireDate != null}">
            <fmt:formatDate value="${employee.hireDate}" pattern="yyyy-MM-dd" var="hireDateStr"/>
        </c:if>
        <form action="${pageContext.request.contextPath}/employee/save" method="post">
            <c:if test="${employee.id != null}">
                <input type="hidden" name="id" value="${employee.id}">
            </c:if>

            <div>
                <label>姓名</label>
                <input type="text" name="name" value="${employee.name}" required placeholder="请输入员工姓名">
            </div>
            <div>
                <label>入职日期</label>
                <input type="date" name="hireDate" value="${hireDateStr}" required>
            </div>
            <div>
                <label>部门</label>
                <input type="text" name="department" value="${employee.department}" required placeholder="例如：市场部、技术部">
            </div>
            <div class="btn-group">
                <button type="submit" class="btn btn-primary">提交</button>
                <a href="${pageContext.request.contextPath}/employee/list" class="btn btn-secondary">返回列表</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>