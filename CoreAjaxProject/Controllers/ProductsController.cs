using CoreAjaxProject.Data;
using CoreAjaxProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CoreAjaxProject.Controllers
{
    public class ProductsController : Controller
    {
        public readonly ApplicationDbContext Context;
        public ProductsController(ApplicationDbContext context)
        {
            this.Context = context;
        }

        public IActionResult ProductsIndex()
        {
            var categoryList = Context.categories
   .Select(c => new SelectListItem { Value = c.CategoryId.ToString(), Text = c.CategoryName })
   .ToList();

            ViewData["CategoryList"] = categoryList;
            return View();
        }
        public JsonResult ProductsList()
        {
            var data = Context.products.ToList();
            return new JsonResult(data);
        }
        public JsonResult AddProducts(Product product)
        {
            var prd = new Product()
            {
                ProductId = product.ProductId,
                StockCode = product.StockCode,
                Barcode = product.Barcode,
                ProductName = product.ProductName,
                Brand = product.Brand,
                Quantity = product.Quantity,
                CategoryID = product.CategoryID,
               


            };
            Context.products.Add(prd);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
        [HttpGet]
        public JsonResult GetProducts(int id)
        {
            var findid = Context.products.Find(id);
            return new JsonResult(findid);

        }
        [HttpPost]
        public JsonResult PostProducts(Product product)
        {
            Context.products.Update(product);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
        public JsonResult DeleteProducts(int id)
        {
            var findid = Context.products.Find(id);
            Context.products.Remove(findid);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
    }
}
