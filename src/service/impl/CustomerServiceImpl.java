package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDao;

import entity.Customer;
import service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Customer> search(int begin, Customer customer) {
		return customerDao.search(begin, customer);
	}

	@Override
	public int searchCount(Customer customer) {
		return customerDao.searchCount(customer);
	}

	@Override
	public Customer searchById(int cId) {
		return customerDao.searchById(cId);
	}

	@Override
	public int modify(Customer customer) {
		return customerDao.update(customer);
	}

	@Override
	public int add(Customer customer) {
		return customerDao.insert(customer);
	}

	@Override
	public int delete(int cId) {
		return customerDao.delete(cId);
	}

}
