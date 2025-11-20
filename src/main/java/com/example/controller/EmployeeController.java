package com.example.controller;

import com.example.entity.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/employee")  // 类级映射（命名空间）
public class EmployeeController {

    // 内存模拟数据库（实际开发替换为DAO层）
    private static List<Employee> employeeList = new ArrayList<>();

    // 初始化测试数据
    static {
        employeeList.add(new Employee(1, "张三", new Date(), "技术部"));
        employeeList.add(new Employee(2, "李四", new Date(), "市场部"));
        employeeList.add(new Employee(3, "王五", new Date(), "人事部"));
    }

    // 1. 员工列表页（GET请求）
    @GetMapping("/list")
    public String showEmployeeList(Model model) {
        model.addAttribute("employees", employeeList);  // 数据传递到页面
        return "employeeList";  // 跳转列表页
    }

    // 2. 跳转添加/编辑表单页（GET请求）
    // 新增：/employee/form（无id参数）；编辑：/employee/form?id=1
    @GetMapping("/form")
    public String showForm(@RequestParam(required = false) Integer id, Model model) {
        if (id != null) {
            // 编辑：根据id查询员工，回显到表单
            Employee employee = employeeList.stream()
                    .filter(e -> e.getId().equals(id))
                    .findFirst()
                    .orElseThrow(() -> new RuntimeException("员工不存在"));
            model.addAttribute("employee", employee);
        } else {
            // 新增：传递空对象，避免页面报错
            model.addAttribute("employee", new Employee());
        }
        return "employeeForm";  // 跳转表单页
    }

    // 3. 提交添加/编辑表单（POST请求）
    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute Employee employee) {
        if (employee.getId() == null) {
            // 新增：生成自增ID
            Integer maxId = employeeList.stream().mapToInt(Employee::getId).max().orElse(0);
            employee.setId(maxId + 1);
            employeeList.add(employee);
        } else {
            // 编辑：替换原有员工信息
            employeeList = employeeList.stream()
                    .map(e -> e.getId().equals(employee.getId()) ? employee : e)
                    .collect(Collectors.toList());
        }
        return "redirect:/employee/list";  // 重定向到列表页（避免表单重复提交）
    }

    // 4. 员工详情页（GET请求）
    @GetMapping("/detail/{id}")
    public String showDetail(@PathVariable Integer id, Model model) {
        Employee employee = employeeList.stream()
                .filter(e -> e.getId().equals(id))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("员工不存在"));
        model.addAttribute("employee", employee);
        return "employeeDetail";  // 跳转详情页
    }

    // 5. 删除员工（GET请求）
    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Integer id) {
        employeeList.removeIf(e -> e.getId().equals(id));  // 移除指定ID员工
        return "redirect:/employee/list";  // 重定向到列表页
    }
}