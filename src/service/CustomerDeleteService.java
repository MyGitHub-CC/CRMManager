package service;

import java.util.List;

import entity.Customer;

public interface CustomerDeleteService {

	public List<Customer> search(int begin,Customer customer);
	
	public int searchCount(Customer customer);

	public Customer searchById(int cId);

	public int add(Customer customer);

	public int delete(int cId);

}
