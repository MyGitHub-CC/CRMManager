package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Car;

public interface CarDao {

	public List<Car> searchAll();

	public List<Car> search(@Param(value="begin")int begin);
	
	public int searchCount();

	public int insert(Car car);

	public Car searchById(int cId);

	public int update(Car car);

	public int delete(int cId);
	
}
