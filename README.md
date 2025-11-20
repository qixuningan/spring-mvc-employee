# 员工信息管理系统

这是一个用 Spring MVC 做的员工管理系统，实现了基本的增删改查功能。主要是为了学习 Spring MVC 的用法，包括请求映射、数据绑定、日期格式化这些知识点。

## 项目介绍

就是一个简单的 Web 应用，可以管理员工的基本信息。用了 Spring MVC 框架，前端用 JSP，能实现员工信息的添加、查询、编辑和删除。

## 主要功能

### 员工列表
- 显示所有员工（ID、姓名、入职日期、部门）
- 可以查看详情和删除
- 有添加新员工的入口

### 添加/编辑员工
- 同一个表单既可以添加也可以编辑
- 需要填姓名、入职日期（yyyy-MM-dd格式）、部门
- 提交后会自动跳回列表页
- 编辑的时候会自动回显之前的数据

### 员工详情
- 显示员工的完整信息
- 可以返回列表或者编辑

## 技术栈

- Spring MVC 5.3.20
- JSP + JSTL
- Maven
- JDK 8
- Tomcat

主要依赖：
- spring-webmvc
- jstl-api 和 taglibs-standard-impl
- javax.servlet-api（provided）
- mysql-connector-java（虽然现在没用数据库，但依赖已经加上了）
- druid 和 commons-dbutils（也是预留的）

## 项目结构

```
src/main/java/com/example/
├── config/
│   ├── MyWebAppInitializer.java    # Web应用初始化
│   └── SpringMvcConfig.java         # Spring MVC配置
├── controller/
│   └── EmployeeController.java      # 控制器
├── entity/
│   └── Employee.java                # 实体类
└── formatter/
    └── DateFormatter.java           # 日期格式化器

src/main/webapp/
├── index.jsp                        # 首页（重定向到列表）
└── WEB-INF/
    ├── web.xml
    └── views/
        ├── employeeList.jsp        # 列表页
        ├── employeeForm.jsp        # 表单页
        └── employeeDetail.jsp      # 详情页
```

## 核心技术点

### 请求映射
用了 `@GetMapping` 和 `@PostMapping` 来处理 GET 和 POST 请求，`@PathVariable` 和 `@RequestParam` 来获取参数。

### 数据绑定
用 `@ModelAttribute` 自动把表单参数绑定到 Employee 对象。日期格式转换比较麻烦，所以自己写了个 `DateFormatter` 来处理 yyyy-MM-dd 和 Date 之间的转换。

### 响应处理
用 `Model` 传数据给 JSP，表单和详情页用转发，提交后用重定向（避免重复提交）。

### 字符编码
配置了 `CharacterEncodingFilter` 解决中文乱码问题，强制用 UTF-8。

## 运行方法

### 环境要求
- JDK 8+
- Maven 3.6+
- Tomcat 8.5+ 或 9.x

### 运行步骤

1. 克隆项目
   ```bash
   git clone <repository-url>
   cd ch-11
   ```

2. 编译打包
   ```bash
   mvn clean package
   ```

3. 部署到 Tomcat
   - 把 `target/ch-11.war` 放到 Tomcat 的 webapps 目录
   - 或者直接用 IDEA 运行

4. 访问
   - 启动 Tomcat 后访问 `http://localhost:8080/ch-11/`
   - 会自动跳转到员工列表页

## 接口说明

| 请求方式 | 路径 | 功能 |
|---------|------|------|
| GET | `/employee/list` | 员工列表 |
| GET | `/employee/form` | 添加表单 |
| GET | `/employee/form?id={id}` | 编辑表单 |
| POST | `/employee/save` | 保存员工 |
| GET | `/employee/detail/{id}` | 员工详情 |
| GET | `/employee/delete/{id}` | 删除员工 |

## 配置说明

### SpringMvcConfig.java
- 启用 Spring MVC 注解
- 配置 JSP 视图解析器（路径是 `/WEB-INF/views/`）
- 注册日期格式化器

### MyWebAppInitializer.java
- 配置 DispatcherServlet
- 注册字符编码过滤器

### DateFormatter.java
- 实现了 `Formatter<Date>` 接口
- 处理 yyyy-MM-dd 格式的日期字符串和 Date 对象的转换

## 遇到的问题和解决

1. **日期格式转换**：Spring MVC 默认不支持 yyyy-MM-dd 格式的日期绑定，所以自己写了个 DateFormatter，在 SpringMvcConfig 里注册一下就行了。

2. **中文乱码**：在 MyWebAppInitializer 里加了 CharacterEncodingFilter，强制用 UTF-8 编码。


## 注意事项

- 现在用的是内存存储（ArrayList），服务器重启后数据就没了
- 数据库相关的依赖已经加上了，但还没实现，可以自己扩展
- 没有做数据验证和异常处理，实际项目里最好加上

## 总结

这个项目主要是用来学习 Spring MVC 的，实现了基本的 CRUD 功能。代码比较简单，适合初学者参考。如果有什么问题或者建议，欢迎提 Issue。
