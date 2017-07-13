package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Customer;
import entity.TalkRecord;

public interface CustomerDao {

	public List<Customer> search(@Param(value="begin")int begin,
			@Param(value="customer")Customer customer,@Param(value="del")int del);
	
	public int searchCount(@Param(value="customer")Customer customer,
			@Param(value="del")int del);

	public Customer searchById(int cId,int del);

	public int insert(Customer customer);
	
	public int update(Customer customer);

	public int deleteUpdate(int cId,int del);

	public int delete(int cId);

	public int updateTalkRecord(TalkRecord talkRecord);

}
