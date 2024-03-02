package com.shopme.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.shopme.common.entity.Province;
import com.shopme.common.entity.District;

public interface DistrictRepository extends CrudRepository<District, Integer> {

	public List<District> findByProvinceOrderByNameAsc(Province province);
}
