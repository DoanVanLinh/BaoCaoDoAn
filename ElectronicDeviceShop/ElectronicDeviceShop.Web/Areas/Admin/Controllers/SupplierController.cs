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
        public ActionResult Create(CreateSupplierViewModel supplier,HttpPostedFileBase file)
        {
            var response = supplierService.Create(supplier);
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    file.SaveAs(HttpContext.Server.MapPath("~/wwwroot/ImageProducts/")+ file.FileName);
                    supplier.Icon = file.FileName;
                }

                supplierService.Create(supplier);
                return RedirectToAction("Index");
            }
            return View(supplier);
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
            string imageName = "";
            HttpFileCollectionBase files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                string path = AppDomain.CurrentDomain.BaseDirectory + "ImageProducts/";
                string filename = Path.GetFileName(Request.Files[i].FileName);

                HttpPostedFileBase file = files[i];
                string fname;
                if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                {
                    string[] testfiles = file.FileName.Split(new char[] { '\\' });
                    fname = testfiles[testfiles.Length - 1];
                }
                else
                {
                    fname = file.FileName;
                }
                imageName = fname;
                fname = Path.Combine(Server.MapPath("~/wwwroot/ImageProducts/"), fname);
                file.SaveAs(fname);
            }

            return Json(imageName);

        }

    }
}