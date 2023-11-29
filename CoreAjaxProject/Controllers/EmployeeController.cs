using CoreAjaxProject.Data;
using CoreAjaxProject.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace CoreAjaxProject.Controllers
{

    public class EmployeeController : Controller
    {
        public readonly ApplicationDbContext Context;
        public EmployeeController(ApplicationDbContext context)
        {
            this.Context = context;
        }

        public IActionResult EmployeeIndex()
        {
            
            
            var companyList = Context.companies
   .Select(c => new SelectListItem { Value = c.CompanyNo.ToString(), Text = c.CompanyName })
   .ToList();

            ViewData["CompanyList"] = companyList;
            return View();
        }
        public JsonResult EmployeeList()
        {
            

            var data = Context.employees.ToList();
            return new JsonResult(data);
        }
        public JsonResult AddEmployee(Employee employee)
        {
            var emp = new Employee()
            {
                EmployeeId = employee.EmployeeId,
                EmployeeName = employee.EmployeeName,
                EmployeeTitle = employee.EmployeeTitle,
                PhoneNumber = employee.PhoneNumber,
                EmployeeStartDate = employee.EmployeeStartDate,
                EmployeeCompany = employee.EmployeeCompany,
                EmployeeSalary = employee.EmployeeSalary,


            };
            Context.employees.Add(emp);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
        [HttpGet]
        public JsonResult GetEmployee(int id)
        {
            var findid = Context.employees.Find(id);
            return new JsonResult(findid);

        }
        [HttpPost]
        public JsonResult PostEmployee(Employee employee)
        {
            Context.employees.Update(employee);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
        public JsonResult DeleteEmployee(int id)
        {
            var findid = Context.employees.Find(id);
            Context.employees.Remove(findid);
            Context.SaveChanges();
            return new JsonResult("İşlem Başarılı");
        }
    }
}
