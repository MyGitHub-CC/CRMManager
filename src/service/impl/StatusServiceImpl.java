package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.StatusService;
import dao.StatusDao;
import entity.Status;


@Service
public class StatusServiceImpl implements StatusService {

	@Autowired
	StatusDao statusDao;
	
	@Override
	public List<Status> searchAll() {
		return statusDao.searchAll();
	}



}
