package com.momo.dto;

public class Person {
	
	// 필드
	private String name ;
	private int age ;
	
	// 생성자
	public Person() {}
	public Person(String name, int age) {
		this.name = name ;
		this.age = age ;
	}

	// Getter & Setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return name + " / " + age;
	}

}
