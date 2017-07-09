package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CustomerDeleteDao;

import entity.Customer;

import service.CustomerDeleteService;

@Service
public class CustomerDeleteServiceImpl implements CustomerDeleteService {
	@Autowired
	CustomerDeleteDao cdDao;

	@Override
	public List<Customer> search(int begin, Customer customer) {
		return cdDao.search(begin, customer);
	}

	@Override
	public int searchCount(Customer customer) {
		return cdDao.searchCount(customer);
	}

	@Override
	public Customer searchById(int cId) {
		return cdDao.searchById(cId);
	}

	@Override
	public int add(Customer customer) {
		return cdDao.insert(customer);
	}

	@Override
	public int delete(int cId) {
		return cdDao.delete(cId);
	}


}
