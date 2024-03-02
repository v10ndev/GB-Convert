package com.shopme.admin.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.shopme.common.entity.Province;
import com.shopme.common.entity.District;

public interface DistrictRepository extends CrudRepository<District, Integer> {

	public List<District> findByProvinceOrderByNameAsc(Province province);
	
	@Query("SELECT s FROM District s LEFT JOIN s.province ON s.province.id = s.id WHERE s.name = :name")
	public District findByName(String name);
}
