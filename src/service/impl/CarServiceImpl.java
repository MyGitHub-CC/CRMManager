package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.CarDao;

import entity.Car;

import service.CarService;

@Service
public class CarServiceImpl implements CarService {
	@Autowired
	CarDao carDao;

	@Override
	public List<Car> searchAll() {
		return carDao.searchAll();
	}

	@Override
	public List<Car> search(int begin) {
		return carDao.search(begin);
	}

	@Override
	public int searchCount() {
		return carDao.searchCount();
	}

	@Override
	public int add(Car car) {
		return carDao.insert(car);
	}

	@Override
	public Car searchById(int cId) {
		return carDao.searchById(cId);
	}

	@Override
	public int modify(Car car) {
		return carDao.update(car);
	}

	@Override
	public int delete(int cId) {
		return carDao.delete(cId);
	}

}
