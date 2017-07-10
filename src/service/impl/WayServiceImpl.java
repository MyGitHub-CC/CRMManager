package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.WayService;
import dao.WayDao;
import entity.Way;

@Service
public class WayServiceImpl implements WayService {
	@Autowired
	WayDao wayDao;

	@Override
	public List<Way> searchAll() {
		return wayDao.searchAll();
	}

}
