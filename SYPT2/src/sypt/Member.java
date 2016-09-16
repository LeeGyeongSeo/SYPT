package sypt;

public class Member {

	private String id_mem;
	private String password;
	private String name_mem;
	private String gender;
	private String birthday;
	private String register_date;
	private String uuid;
	private int auth_state;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRdate() {
		return register_date;
	}

	public void setRdate(String register_date) {
		this.register_date = register_date;
	}
	
	public String getBirthday(){
		return birthday;
	}
	
	public void setBirthday(String birthday){
		this.birthday = birthday;
	}
	
	public String getUuid(){
		return uuid;
	}
	
	public void setUuid(String uuid){
		this.uuid = uuid;
	}
	
	public int getAuth_state(){
		return auth_state;
	}
	
	public void setAuth_state(int auth_state){
		this.auth_state = auth_state;
	}
	
}
