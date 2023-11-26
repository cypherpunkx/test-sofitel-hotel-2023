package com.student.model;

public class Person {
	private String id;
	private String name;
	private String department;
	private int mark;
	private double passPercentage;

	public Person(String id, String name, String department, int mark,double passPercentage) {
		this.id = id;
		this.name = name;
		this.department = department;
		this.mark = mark;
		this.passPercentage=passPercentage;
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getMark() {
		return mark;
	}

	public void setMark(int mark) {
		this.mark = mark;
	}

	public double getPassPercentage() {
		return passPercentage;
	}

	public void setPassPercentage(double passPercentage) {
		this.passPercentage = passPercentage;
	}

}
