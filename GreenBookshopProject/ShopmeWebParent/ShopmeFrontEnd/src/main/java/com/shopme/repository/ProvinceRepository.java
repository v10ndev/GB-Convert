package com.shopme.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.shopme.common.entity.Province;

public interface ProvinceRepository extends CrudRepository<Province, Integer>{
	
	public List<Province> findAllByOrderByNameAsc();
	
	@Query("SELECT c FROM Province c WHERE c.code = ?1")
	public Province findByCode(String code);
}
