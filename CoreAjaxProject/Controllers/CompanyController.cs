using CoreAjaxProject.Data;
using CoreAjaxProject.Models;
using Microsoft.AspNetCore.Mvc;

namespace CoreAjaxProject.Controllers
{
    public class CompanyController : Controller
    {
        public readonly ApplicationDbContext Context;
        public CompanyController(ApplicationDbContext Context)
        {
            this.Context = Context;
        }
        public IActionResult CompanyIndex()
        {
            return View();
        }
        public JsonResult ListCompany()
        {
            var data = Context.companies.ToList();
            return new JsonResult(data);

        }
        public JsonResult AddCompany(Company Company)
        {
            var company = new Company()
            {
                CompanyNo = Company.CompanyNo,
                CompanyName = Company.CompanyName,
                Description = Company.Description,
                ContactName = Company.ContactName,
                ContactPhone = Company.ContactPhone,
                TaxAdministration = Company.TaxAdministration,
            };
            Context.companies.Add(company);
            Context.SaveChanges();
            return new JsonResult("Kayıt Başarılı");

        }
        [HttpGet]
        public JsonResult GetCompany(int id)
        {
            var findid = Context.companies.Find(id);
            return new JsonResult(findid);
        }
        [HttpPost]
        public JsonResult UpdateCompany(Company company) 
        {
            Context.companies.Update(company);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
        [HttpPost]
        public JsonResult DeleteCompany(int id)
        {
            var findid =Context.companies.Find(id);
            Context.companies.Remove(findid);
            Context.SaveChanges();
            return new JsonResult("Silme Başarılı");
        }
    }
}
