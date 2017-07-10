package entity;

public class Customer {
	private int id;
	private String name;
	private String sex;
	private Integer age;
	private String works;
	private Integer income;
	private String phone;
	private Car car;
	private String dates;
	private Status status2;
	private Salesman salesman;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getWorks() {
		return works;
	}

	public void setWorks(String works) {
		this.works = works;
	}

	public Integer getIncome() {
		return income;
	}

	public void setIncome(Integer income) {
		this.income = income;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public Status getStatus2() {
		return status2;
	}

	public void setStatus2(Status status2) {
		this.status2 = status2;
	}

	public Salesman getSalesman() {
		return salesman;
	}

	public void setSalesman(Salesman salesman) {
		this.salesman = salesman;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", sex=" + sex
				+ ", age=" + age + ", works=" + works + ", income=" + income
				+ ", phone=" + phone + ", car=" + car + ", dates=" + dates
				+ ", status2=" + status2 + ", salesman=" + salesman + "]";
	}

}
