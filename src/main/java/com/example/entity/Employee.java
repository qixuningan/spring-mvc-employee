package com.example.entity;

import java.util.Date;

public class Employee {
    private Integer id;  // 员工ID（主键）
    private String name;  // 姓名
    private Date hireDate;  // 入职日期
    private String department;  // 部门

    // 无参构造
    public Employee() {}

    // 全参构造（便于测试）
    public Employee(Integer id, String name, Date hireDate, String department) {
        this.id = id;
        this.name = name;
        this.hireDate = hireDate;
        this.department = department;
    }

    // getter/setter 方法
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public Date getHireDate() { return hireDate; }
    public void setHireDate(Date hireDate) { this.hireDate = hireDate; }
    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    @Override
    public String toString() {
        return "Employee{id=" + id + ", name='" + name + "', hireDate=" + hireDate + ", department='" + department + "'}";
    }
}
