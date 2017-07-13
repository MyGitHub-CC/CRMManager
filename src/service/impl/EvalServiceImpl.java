package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.EvalService;
import dao.EvalDao;
import entity.Eval;

@Service
public class EvalServiceImpl implements EvalService {
	@Autowired
	EvalDao evalDao;

	@Override
	public List<Eval> searchAll() {
		return evalDao.searchAll();
	}

}
