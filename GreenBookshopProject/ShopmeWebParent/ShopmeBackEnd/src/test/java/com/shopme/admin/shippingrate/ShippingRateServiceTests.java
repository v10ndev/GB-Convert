package com.shopme.admin.shippingrate;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.function.Executable;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.springframework.boot.test.mock.mockito.MockBean;

import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shopme.admin.repository.ProductRepository;
import com.shopme.admin.repository.ShippingRateRepository;
import com.shopme.admin.service.ShippingRateService;
import com.shopme.common.entity.ShippingRate;
import com.shopme.common.entity.product.Product;
import com.shopme.common.exception.ShippingRateNotFoundException;

@ExtendWith(MockitoExtension.class)
@ExtendWith(SpringExtension.class)
public class ShippingRateServiceTests {

	@MockBean 
	private ShippingRateRepository shipRepo;
	
	@MockBean 
	private ProductRepository productRepo;
	
	@InjectMocks
	private ShippingRateService shipService;

	@Test
	public void testCalculateShippingCost_NoRateFound() {
		Integer productId = 1;
		Integer provinceId = 234;
		String district = "ABCDE";

		Mockito.when(shipRepo.findByProvinceAndDistrict(provinceId, district)).thenReturn(null);

		assertThrows(ShippingRateNotFoundException.class, new Executable() {

			@Override
			public void execute() throws Throwable {
				shipService.calculateShippingCost(productId, provinceId, district);
			}
		});
	}

	@Test
	public void testCalculateShippingCost_RateFound() throws ShippingRateNotFoundException {
		Integer productId = 1;
		Integer provinceId = 234;
		String district = "New York";

		ShippingRate shippingRate = new ShippingRate();
		shippingRate.setRate(10);

		Mockito.when(shipRepo.findByProvinceAndDistrict(provinceId, district)).thenReturn(shippingRate);

		Product product = new Product();
		product.setWeight(5);
		product.setWidth(4);
		product.setHeight(3);
		product.setLength(8);		

		Mockito.when(productRepo.findById(productId)).thenReturn(Optional.of(product));

		float shippingCost = shipService.calculateShippingCost(productId, provinceId, district);

		assertEquals(50, shippingCost);
	}
}