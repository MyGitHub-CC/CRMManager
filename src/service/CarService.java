package service;

import java.util.List;

import entity.Car;

public interface CarService {

	public List<Car> searchAll();

	public List<Car> search(int begin,Car car);
	
	public int searchCount(Car car);

	public int add(Car car);

	public Car searchById(int cId);

	public int modify(Car car);

	public int delete(int cId);

}
