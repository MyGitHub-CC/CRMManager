package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CustomerService;
import dao.CustomerDao;
import dao.TalkRecordDao;
import entity.Customer;
import entity.TalkRecord;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	TalkRecordDao talkRecordDao;

	@Override
	public List<Customer> search(int begin, Customer customer,int del) {
		return customerDao.search(begin, customer,del);
	}

	@Override
	public int searchCount(Customer customer,int del) {
		return customerDao.searchCount(customer,del);
	}

	@Override
	public Customer searchById(int cId,int del) {
		return customerDao.searchById(cId,del);
	}

	@Override
	public int modify(Customer customer) {
		int result = customerDao.update(customer);
		int result2 = 0;
		if (result > 0) {
			int cId = customer.getId();
			int id = talkRecordDao.searchMaxIdByCustomer(cId);
			TalkRecord talkRecord = new TalkRecord();
			talkRecord.setId(id);
			talkRecord.setCustomer(customer);
			result2 = talkRecordDao.update(talkRecord);
		}
		return result2;
	}

	@Override
	public int add(Customer customer) {
		int result = customerDao.insert(customer);//可以做一个事务
		int result2 = 0;
		if (result > 0) {
			TalkRecord talkRecord = new TalkRecord();
			talkRecord.setCustomer(customer);
			result2 = talkRecordDao.insert(talkRecord);
		}
		return result2;
	}

	@Override
	public int deleteUpdate(int cId,int del) {
		return customerDao.deleteUpdate(cId,del);
	}

	@Override
	public int delete(int cId) {
		return customerDao.delete(cId);
	}

}
