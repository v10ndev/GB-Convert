package com.shopme.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shopme.admin.service.CategoryService;

@RestController
public class CategoryRestController {

	@Autowired
	private CategoryService service;

	@PostMapping("/categories/check_unique")
	public String checkUnique(Integer id, String name, String alias){
		return service.checkUnique(id, name, alias);
	}
}
