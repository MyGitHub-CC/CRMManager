package entity;

public class TalkRecord {
	private int id;
	private Customer customer;
	private String dates;
	private Way way;
	private Salesman salesman;
	private Eval eval;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getDates() {
		return dates;
	}

	public void setDates(String dates) {
		this.dates = dates;
	}

	public Way getWay() {
		return way;
	}

	public void setWay(Way way) {
		this.way = way;
	}

	public Salesman getSalesman() {
		return salesman;
	}

	public void setSalesman(Salesman salesman) {
		this.salesman = salesman;
	}

	public Eval getEval() {
		return eval;
	}

	public void setEval(Eval eval) {
		this.eval = eval;
	}

	@Override
	public String toString() {
		return "TalkRecord [id=" + id + ", customer=" + customer + ", dates="
				+ dates + ", way=" + way + ", salesman=" + salesman + ", eval="
				+ eval + "]";
	}

}
