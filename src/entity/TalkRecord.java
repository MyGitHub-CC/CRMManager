package entity;

public class TalkRecord {
	private int id;
	private Customer customer;
	private String date;
	private Eval eval;

	public int getId() {
		return id;
	}

	public Eval getEval() {
		return eval;
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

	public void setEval(Eval eval) {
		this.eval = eval;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "TalkRecord [id=" + id + ", customer=" + customer + ", date="
				+ date + ", eval=" + eval + "]";
	}

}
