package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.SelectedDao;

import service.SelectedService;

@Service
public class SelectedServiceImpl implements SelectedService{
	@Autowired
	SelectedDao serviceDao;
	
	@Override
	public List<String> searchAges() {
		return serviceDao.searchAges();
	}

}
