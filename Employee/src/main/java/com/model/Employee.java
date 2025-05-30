package com.model;


import java.sql.Date;

public class Employee {
    private int empno;
    private String empName;
    private Date doj;
    private String gender;
    private double bsalary;

    public int getEmpno() {
        return empno;
    }

    public void setEmpno(int empno) {
        this.empno = empno;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDoj() {
        return doj;
    }

    public void setDoj(Date doj) {
        this.doj = doj;
    }

    public double getBsalary() {
        return bsalary;
    }

    public void setBsalary(double salary) {
        this.bsalary = bsalary;
    }

}