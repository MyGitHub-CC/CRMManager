package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.RankService;
import dao.RankDao;
import entity.Rank;

@Service
public class RankServiceImpl implements RankService {

	@Autowired
	RankDao rankDao;
	
	@Override
	public List<Rank> searchAll() {
		return rankDao.searchAll();
	}

	

}
