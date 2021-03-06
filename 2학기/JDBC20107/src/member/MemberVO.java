package member;

import java.util.Date;

public class MemberVO {
	int memno;
	String name;
	String id;
	String password;
	int birth;
	String gender;
	String job;
	String city;
	Date registeDate;
	
	public MemberVO(int memno, String name, String id, String password, int birth, String gender, String job, String city, Date registeDate) {
		this.memno = memno;
		this.name = name;
		this.id = id;
		this.password = password;
		this.birth = birth;
		this.gender = gender;
		this.job = job;
		this.city = city;
		this.registeDate = registeDate;
	}
	
	public int getMemno() {
		return memno;
	}
	
	public void setMemno(int memno) {
		this.memno = memno;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getJob() {
		return job;
	}
	
	public void setJob(String job) {
		this.job = job;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public Date getRegisteDate() {
		return registeDate;
	}
	
	public void setRegisteDate(Date registeDate) {
		this.registeDate = registeDate;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "id : "+this.id + " pw : "+this.password;
	}
}
