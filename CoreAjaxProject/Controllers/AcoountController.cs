using CoreAjaxProject.Data;
using CoreAjaxProject.Models.Accountt;
using CoreAjaxProject.Models.ViewModel;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace CoreAjaxProject.Controllers
{
    public class AcoountController : Controller
    {
        public readonly ApplicationDbContext Context;
        public AcoountController(ApplicationDbContext Context)
        {
            this.Context = Context;
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(LoginViewModel model)
        {
            if (!ModelState.IsValid)
            {
                var data = Context.userrs.Where(e => e.EMail == model.EMail).SingleOrDefault();
                if (data != null)
                {
                    bool isValid = (data.EMail == model.EMail && data.Passwordd == model.Passwordd);
                    if (isValid)
                    {
                        var identity = new ClaimsIdentity(new[] { new Claim(ClaimTypes.Name, model.EMail) },
                        CookieAuthenticationDefaults.AuthenticationScheme);
                        var prinp=new ClaimsPrincipal(identity);
                        HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, prinp);
                        HttpContext.Session.SetString("EMail", model.EMail); 
                        return RedirectToAction("EmployeeIndex", "Employee");
                    }
                    else
                    {
                        TempData["errorpsw"] = "hatalı Şifre";
                        return View(model);
                    }
                }
                else
                {
                    TempData["errormail"] = "hatalı mail";
                    return View(model);
                }
            }
            else
            {
                return View(model);
            }
           
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ForgotPassword(string email)
        {
            var user = Context.userrs.FirstOrDefault(u => u.EMail == email);

            if (user != null)
            {
                TempData["resetMessage"] = "Şifre sıfırlama bağlantısı gönderildi. Lütfen e-posta adresinizi kontrol edin.";
            }
            else
            {
                TempData["resetError"] = "Bu e-posta adresi ile kayıtlı bir kullanıcı bulunamadı.";
            }

            return View();
        }
        public IActionResult Logout()
        {
            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            var storedCookies = Request.Cookies.Keys;
            foreach (var key in storedCookies) 
            { 
                Response.Cookies.Delete(key);

            }
            return RedirectToAction("Login", "Acoount");
        }
        public IActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignUp(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var data = new Userr()
                {
                   UserNamee= model.UserNamee,
                   EMail = model.EMail,
                   Passwordd = model.Passwordd,
                   PhoneNumber = model.PhoneNumber,
                   IsActive = model.IsActive,
                   
                };
                Context.userrs.Add(data);
                Context.SaveChanges();
                TempData["successMessage"] = "Kayıt Başarılı"; 
                return RedirectToAction("Login", "Acoount");



            }
            else
            {
                TempData["errorMessage"] = "Kayıt Başarısız";
                return View(model);
            }
           

        }

    }
}
