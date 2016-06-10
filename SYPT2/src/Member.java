

public class Member {

	private String id_mem;
	private String password;
	private String name_mem;
	private String gender;
	private String birthday;
	private String r_date;
	
	public Member()
	{ 
		
	}

	public String getId_mem() {
		return id_mem;
	}

	public void setId_mem(String id_mem) {
		this.id_mem = id_mem;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName_mem() {
		return name_mem;
	}

	public void setName_mem(String name_mem) {
		this.name_mem = name_mem;
	}

	public String getGender_mem() {
		return gender;
	}

	public void setAge_mem(String gender) {
		this.gender = gender;
	}

	public String getRdate() {
		return r_date;
	}

	public void setRdate(String r_date) {
		this.r_date = r_date;
	}
	
	public String getBirthday(){
		return birthday;
	}
	
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}
}
