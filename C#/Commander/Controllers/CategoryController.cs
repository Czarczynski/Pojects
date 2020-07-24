﻿using System;
using System.Collections.Generic;
using AutoMapper;
using Commander.Data;
using Commander.DTOs;
using Commander.Models;
using Microsoft.AspNetCore.Mvc;

namespace Commander.Controllers
{
    [Route("api/categories")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly IApp _repository;
        private readonly IMapper _mapper;

        public CategoryController(IApp repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        [HttpGet]
        public ActionResult<IEnumerable<CategoryReadDTO>> getAllCategories()
        {
            var categories = _repository.Category.GetAllCategories();
            if (categories != null)
                return Ok(_mapper.Map<IEnumerable<CategoryReadDTO>>(categories));
            return NotFound();
        }

        [HttpGet("{id}")]
        public ActionResult<Category> getCategoryById(int id)
        {
            var category = _repository.Category.GetCategoryById(id);

            if (category != null)
                return Ok(category);
            return NotFound();
        }
    }
}