package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Customer;

public interface CustomerDao {

	public List<Customer> search(@Param(value="begin")int begin,
			@Param(value="customer")Customer customer);
	
	public int searchCount(Customer customer);

	public Customer searchById(int cId);

	public int insert(Customer customer);
	
	public int update(Customer customer);

	public int delete(int cId);

}
