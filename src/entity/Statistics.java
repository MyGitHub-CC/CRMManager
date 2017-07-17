package entity;

public class Statistics {
	private int id;
	private Customer customer;
	private Double pre;

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

	public Double getPre() {
		return pre;
	}

	public void setPre(Double pre) {
		this.pre = pre;
	}

	@Override
	public String toString() {
		return "Statistics [id=" + id + ", customer=" + customer + ", pre="
				+ pre + "]";
	}

}
