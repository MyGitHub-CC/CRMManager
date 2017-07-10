package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.SalesmanService;
import dao.SalesmanDao;
import entity.Salesman;

@Service
public class SalesmanServiceImpl implements SalesmanService {
	@Autowired
	SalesmanDao salesmanDao;

	@Override
	public List<Salesman> searchAll() {
		return salesmanDao.searchAll();
	}

}
