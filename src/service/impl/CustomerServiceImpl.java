package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CustomerService;
import dao.CustomerDao;
import dao.TalkRecordDao;
import entity.Customer;
<<<<<<< HEAD
import entity.Statistics;
=======
import entity.Salesman;
import entity.Status;
>>>>>>> parent of 60a567f... 初步完成功能
import entity.TalkRecord;
import entity.Way;

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
		return customerDao.update(customer);
	}

	@Override
	public int add(Customer customer) {
		int result = customerDao.insert(customer);//可以做一个事务
		int result2 = -1;
		if (result > 0) {
			int cusId = customer.getId();
			String dates= customer.getDates();
			int wId = customer.getWay().getId();
			int staId =customer.getStatus2().getId();
			int salesId = customer.getSalesman().getId();
			TalkRecord talkRecord = new TalkRecord();
			Status status = new Status();
			Customer customer2 = new Customer();
			customer2.setStatus2(status);
			Way way = new Way();
			Salesman salesman = new Salesman();
			talkRecord.setCustomer(customer2);
			talkRecord.setSalesman(salesman);
			talkRecord.setWay(way);
			talkRecord.getCustomer().setId(cusId);
			talkRecord.setDates(dates);
			talkRecord.getWay().setId(wId);
			talkRecord.getCustomer().getStatus2().setId(staId);
			talkRecord.getSalesman().setId(salesId);
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

	@Override
	public List<Statistics> searchStatis() {
		return customerDao.searchStatis();
	}

}
