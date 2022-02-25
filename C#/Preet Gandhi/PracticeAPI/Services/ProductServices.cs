using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PracticeAPI.IServices;
using PracticeAPI.Models;

namespace PracticeAPI.Services
{
    public class ProductServices : IProduct
    {

        private readonly ContosoPetsContext _contosoPetsContext;
        public ProductServices(ContosoPetsContext contosoPetsContext)
        {
            _contosoPetsContext = contosoPetsContext;
        }
        public bool CreateProduct(Products products)
        {
            if (products != null)
            {
                var result = _contosoPetsContext.Products.Add(products);
                _contosoPetsContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool DeleteProduct(long id)
        {
            var existingProduct = _contosoPetsContext.Products.SingleOrDefault(x => x.Id == id);

            if (existingProduct != null)
            {
                _contosoPetsContext.Products.Remove(existingProduct);
                _contosoPetsContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool EditProduct(long id, Products products)
        {
            var existingProduct = _contosoPetsContext.Products.SingleOrDefault(x => x.Id == id);

            if(existingProduct != null)
            {
                existingProduct.Name = products.Name;
                existingProduct.Price = products.Price;
                _contosoPetsContext.SaveChanges();
                return true;
            }
            return false;
        }

        public IEnumerable<Products> GetAllProducts()
        {
            var products = _contosoPetsContext.Products.ToList();
            return products;
        }

        public Products GetProductById(long id)
        {
            var product = _contosoPetsContext.Products.SingleOrDefault(x => x.Id == id);
            return product;
        }

        public Products GetProductByName(string pName)
        {
            var product = _contosoPetsContext.Products.SingleOrDefault(x => x.Name == pName);
            return product;
        }
    }
}
