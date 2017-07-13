package service;

import java.util.List;

import entity.Customer;

public interface CustomerService {

	public List<Customer> search(int begin,Customer customer,int del);
	
	public int searchCount(Customer customer,int del);

	public Customer searchById(int cId,int del);

	public int modify(Customer customer);

	public int add(Customer customer);

	public int deleteUpdate(int cId,int del);

	public int delete(int cId);

}
