using CoreAjaxProject.Data;
using CoreAjaxProject.Models;
using Microsoft.AspNetCore.Mvc;

namespace CoreAjaxProject.Controllers
{
    public class CategoriesController : Controller
    {
        public readonly ApplicationDbContext Context;
        public CategoriesController(ApplicationDbContext Context)
        {
            this.Context = Context;
        }
        public JsonResult CategoryList()
        {
            var list = Context.categories.ToList();
            return new JsonResult(list);
        }
        public IActionResult CategoryIndex()
        {
            return View();
        }
        [HttpPost]
        public JsonResult AddCategory(Category categories)
        {
            var category = new Category()
            {
                CategoryId = categories.CategoryId,
                CategoryName = categories.CategoryName,
                Description = categories.Description,

            };
            Context.categories.Add(category);
            Context.SaveChanges();
            return new JsonResult("Kayıt Başarıyla Eklendi");

        }
        [HttpGet]
        public JsonResult GetCategory(int id)
        {
            var findId = Context.categories.FirstOrDefault(x=>x.CategoryId== id); 
            return new JsonResult(findId);
        }
        [HttpPost]
        public  JsonResult UpdateCategory(Category category)
        {
            Context.categories.Update(category);
              Context.SaveChanges();
            return new JsonResult("Güncelleme İşlemi Başarılı");
        }
        public JsonResult DeleteCategory(int id)
        {
            var findId = Context.categories.FirstOrDefault(y=>y.CategoryId== id);   
            Context.categories.Remove(findId);
            Context.SaveChanges();
            return new JsonResult("Kayıt Silme İşlemi Başarılı");
        }

    }
}
