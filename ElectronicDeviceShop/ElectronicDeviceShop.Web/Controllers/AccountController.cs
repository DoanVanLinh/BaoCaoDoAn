using ElectronicDeviceShop.Services.Accounts;
using ElectronicDeviceShop.ViewModels.Accounts;
using ElectronicDeviceShop.ViewModels.Results;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAccountService accountService;
        public AccountController(IAccountService accountService)
        {
            this.accountService = accountService;
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public JsonResult Create(CreateAccountViewModel account)
        {
            var response = accountService.Create(account);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
        public JsonResult CheckUserName(CreateAccountViewModel account)
        {
            var response = accountService.CheckUserName(account);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoginUser(LoginViewModel account)
        {
            ResponseResult response = new ResponseResult();
            var oldAccount = accountService.GetAccountByUserName(account.UserName);
            if (oldAccount == null || oldAccount.Role != 2)
                response = new ResponseResult("Lỗi!");
            else
                response = accountService.Login(account);
            if (response.IsSuccessed)
            {
                Session["ID_Account"] = accountService.GetAll().Where(a=>a.UserName == account.UserName).FirstOrDefault().ID_Account;
            }
            return Json(new { newUrl = Url.Action("Index", "Home"), response = response.IsSuccessed }, JsonRequestBehavior.AllowGet);
        }
    }
}