package entity;

public class Salesman {
	private int id;
	private String name;
	private Rank rank;

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

	public Rank getRank() {
		return rank;
	}

	public void setRank(Rank rank) {
		this.rank = rank;
	}

	@Override
	public String toString() {
		return "Salesman [id=" + id + ", name=" + name + ", rank=" + rank + "]";
	}

}
