using ElectronicDeviceShop.Services.Accounts;
using ElectronicDeviceShop.ViewModels.Accounts;
using ElectronicDeviceShop.ViewModels.Results;
using System;
using System.Collections.Generic;
using System.IO;
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
        public ActionResult Detail()
        {
            if (Session["ID_Account"] != null)
            {
                int id = int.Parse(Session["ID_Account"].ToString());
                if (id > 0)
                {
                    var account = accountService.GetDetailAccountById(id);
                    return View(account);
                }
                else
                    return RedirectToAction("Index", "Account");
            }
            else
                return RedirectToAction("Index", "Account");
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
        [HttpPost]
        public ActionResult Edit(EditAccountViewModel account)
        {
            var response = accountService.Edit(account);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult UploadFiles()
        {
            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }

                        // Get the complete folder path and store the file inside it.  
                        fname = Path.Combine(Server.MapPath("~/wwwroot/ImageProducts/"), fname);
                        file.SaveAs(fname);
                    }
                    // Returns message that successfully uploaded  
                    return Json("File Uploaded Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }
        }
    }
}