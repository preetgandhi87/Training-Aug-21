using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PracticeAPI.IServices;
using PracticeAPI.Models;

namespace PracticeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProduct _product;

        public ProductsController(IProduct product)
        {
            _product = product;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Products>> GetAllProducts()
        {
            return Ok(_product.GetAllProducts());
        }

        [HttpGet("{id}")]
        public ActionResult<Products> GetProduct(long id)
        {
            var product = _product.GetProductById(id);

            if(product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }

        [HttpPost]
        public ActionResult<Products> AddProduct(Products products)
        {
            var existingProduct = _product.GetProductByName(products.Name);

            if(existingProduct != null)
            {
                //return StatusCode(StatusCodes.Status400BadRequest);
                return BadRequest();
            }
            bool created = _product.CreateProduct(products);
            if (created)
            {
                return StatusCode(StatusCodes.Status201Created);
            }
            return StatusCode(StatusCodes.Status500InternalServerError);
        }

        [HttpPut("{id}")]
        public ActionResult<Products> EditProduct(long id, Products products)
        {
            //var existingProduct = _product.GetProductByName(products.Name);
            //if (existingProduct == null)
            //{
            //    //return StatusCode(StatusCodes.Status400BadRequest);
            //    return BadRequest();
            //}

            var product = _product.GetProductById(id);
            if(product == null)
            {
                return NotFound();
            }
            if(_product.EditProduct(id, products))
            {
                return StatusCode(StatusCodes.Status200OK);
            }
            return StatusCode(StatusCodes.Status500InternalServerError);
        }

        [HttpDelete("{id}")]
        public ActionResult<Products> DeleteProduct(long id)
        {
            var existingProduct = _product.GetProductById(id);

            if(existingProduct != null)
            {
                if (_product.DeleteProduct(id))
                {
                    return StatusCode(StatusCodes.Status202Accepted);
                }
                return StatusCode(StatusCodes.Status400BadRequest);
            }
            return NotFound();
        }

        [HttpGet("name/{pName}")]
        public ActionResult<Products> GEtProductByPName( string pName)
        {
            var product = _product.GetProductByName(pName);

            if(product == null)
            {
                return NoContent();
            }
            return Ok(product);

        }
    }
}
