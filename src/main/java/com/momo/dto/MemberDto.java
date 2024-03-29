package com.momo.dto;

public class MemberDto {
	
	public String id ;
	public String pass ;
	public String name ;
	public String regidate ;
	public String email ;
	
	public MemberDto() {}
	
	public MemberDto(String id, String pass, String name, String regidate, String email) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "id : " + id + 
				"\nname : " + name + 
				"\npass : " + pass + 
				"\nregidate : " + regidate + 
				"\nemail : " + email ;
	}
	
}
