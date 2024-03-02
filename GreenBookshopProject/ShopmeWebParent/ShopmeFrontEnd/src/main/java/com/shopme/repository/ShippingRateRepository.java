package com.shopme.repository;

import org.springframework.data.repository.CrudRepository;

import com.shopme.common.entity.Province;
import com.shopme.common.entity.ShippingRate;

public interface ShippingRateRepository extends CrudRepository<ShippingRate, Integer> {

	public ShippingRate findByProvinceAndDistrict(Province province, String district);
	
}