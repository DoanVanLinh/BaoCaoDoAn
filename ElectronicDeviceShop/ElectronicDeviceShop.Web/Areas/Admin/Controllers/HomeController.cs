using ElectronicDeviceShop.Services.Accounts;
using ElectronicDeviceShop.ViewModels.Accounts;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        private readonly IAccountService accountService;
        public HomeController(IAccountService accountService)
        {
            this.accountService = accountService;
        }
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginViewModel account)
        {
            var response = accountService.Login(account);
            if (response.IsSuccessed)
            {
                var accountAd = accountService.GetAll().Where(a => a.UserName == account.UserName).FirstOrDefault();
                //TempData["UserName"] = accountAd.UserName;
                //TempData["Avatar"] = accountAd.Avatar;
                HttpContext.Session.Add("USER", accountAd.UserName);
                HttpContext.Session.Add("Role", "Admin");
                return RedirectToAction("Index", "Product");
            }
            else
                return View(account);
        }
        string ChangeRole(int role)
        {
            switch (role)
            {
                case 0:
                    return "Admin";
                case 1:
                    return "Staff";
                case 2:
                    return "User";
                default:
                    return "";
            }
        }
    }
}