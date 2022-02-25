using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PracticeAPI.Models;

namespace PracticeAPI.IServices
{
    public interface IProduct
    {
        public IEnumerable<Products> GetAllProducts();
        public Products GetProductById(long id);
        public bool CreateProduct(Products products);
        public bool EditProduct(long id, Products products);
        public bool DeleteProduct(long id);
        public Products GetProductByName(string pName);
    }
}
