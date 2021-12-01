using ElectronicDeviceShop.Services.Suppliers;
using ElectronicDeviceShop.ViewModels.Suppliers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Areas.Admin.Controllers
{
    public class SupplierController : Controller
    {
        private readonly ISupplierService supplierService;

        public SupplierController(ISupplierService supplierService)
        {
            this.supplierService = supplierService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAll()
        {
            var suppliers = supplierService.GetAll();

            return Json(suppliers, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Details(int id)
        {
            var supplier = supplierService.GetDetailSupplierById(id);
            return View(supplier);
        }

        [HttpPost]
        public ActionResult Create(CreateSupplierViewModel supplier)
        {
            var response = supplierService.Create(supplier);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }


        //public ActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Create(CreateSupplierViewModel request)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var response = supplierService.Create(request);
        //        if (response.IsSuccessed)
        //        {
        //            TempData["Message"] = "Thêm thành công!";
        //            return RedirectToAction(nameof(Index));
        //        }
        //        ModelState.AddModelError(string.Empty, response.ErrorMessage);
        //    }
        //    return View(request);
        //}

        public ActionResult Edit(int id)
        {
            EditSupplierViewModel supplier = supplierService.GetEditSupplierById(id);
            return View(supplier);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(EditSupplierViewModel request)
        {
            if (ModelState.IsValid)
            {
                var response = supplierService.Edit(request);
                if (response.IsSuccessed)
                {
                    TempData["Message"] = "Sửa thành công!";
                    return RedirectToAction(nameof(Index));
                }
                ModelState.AddModelError(string.Empty, response.ErrorMessage);
            }
            return View(request);
        }

        public ActionResult Delete(int id)
        {
            DeleteSupplierViewModel supplier = supplierService.GetDeleteSupplierById(id);
            return View(supplier);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateInput(false)]
        public ActionResult DeleteConfirmed(DeleteSupplierViewModel request)
        {
            if (ModelState.IsValid)
            {
                var response = supplierService.Delete(request);
                if (response.IsSuccessed)
                {
                    TempData["Message"] = "Xóa thành công!";
                    return RedirectToAction(nameof(Index));
                }
                ModelState.AddModelError(string.Empty, response.ErrorMessage);
            }
            return View(request);
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