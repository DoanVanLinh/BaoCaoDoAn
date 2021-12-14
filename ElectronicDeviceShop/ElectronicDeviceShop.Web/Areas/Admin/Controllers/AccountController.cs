using ElectronicDeviceShop.Services.Accounts;
using ElectronicDeviceShop.Services.Categories;
using ElectronicDeviceShop.ViewModels.Accounts;
using ElectronicDeviceShop.ViewModels.Categories;
using ElectronicDeviceShop.Web.Areas.Admin.Filters;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        private readonly IAccountService accountService;
        private readonly int pageSize = 4;
        public AccountController(IAccountService accountService)
        {
            this.accountService = accountService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll(string txtSearch, int? page)
        {
            var accounts = accountService.GetAll();
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                accounts = accounts.Where(s => s.UserName.ToLower().Contains(txtSearch.ToLower()) ||
                                                s.Email.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = accounts.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = accounts;

            int start = (int)(page - 1) * pageSize;
            var dataAccount = accounts.Skip(start).Take(pageSize);
            return Json(new { all = accounts, data = dataAccount, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetById(int id)
        {
            var account = accountService.GetEditAccountById(id);
            return Json(account, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Create(CreateAccountViewModel account)
        {
            var response = accountService.Create(account);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Edit(EditAccountViewModel account)
        {
            var response = accountService.Edit(account);

            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var account = accountService.GetDeleteAccountById(id);
            var response = accountService.Delete(account);

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