package entity;

public class Car {
	private int id;
	private String brand;
	private int sales;
	private int inventory;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", brand=" + brand + ", sales=" + sales
				+ ", inventory=" + inventory + "]";
	}

}
