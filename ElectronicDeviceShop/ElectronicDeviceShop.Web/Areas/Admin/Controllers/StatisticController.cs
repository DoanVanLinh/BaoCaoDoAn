using ElectronicDeviceShop.Services.BillDetails;
using ElectronicDeviceShop.Services.Bills;
using ElectronicDeviceShop.Services.Categories;
using ElectronicDeviceShop.Services.Products;
using ElectronicDeviceShop.ViewModels.Categories;
using ElectronicDeviceShop.Web.Areas.Admin.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Areas.Admin.Controllers
{
    [CustomAuthorize(Roles = "Admin")]

    public class StatisticController : Controller
    {
        private readonly ICategoryService categoryService;
        private readonly IBillService billService;
        private readonly IProductService productService;
        private readonly IBillDetailService billDetailService;

        public StatisticController(ICategoryService categoryService, IBillService billService, IProductService productService, IBillDetailService billDetailService)
        {
            this.categoryService = categoryService;
            this.billService = billService;
            this.productService = productService;
            this.billDetailService = billDetailService;
        }

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAllCategory()
        {
            var allCategory = categoryService.GetAll();
            var detailBill = billDetailService.GetAllSuccessBillDetail();
            var i = detailBill.GroupBy(db => db.ID_Product).Select(group => new { amount = group.Sum(item => item.Amount), id = group.Key });
            Dictionary<string, int> cateAmount = new Dictionary<string, int>();
            foreach (var item in i)
            {
                var product = productService.GetDetailProductById(item.id);
                foreach (var item2 in allCategory)
                {
                    if (item2.ID_Category == product.ID_Category)
                    {
                        if (!cateAmount.ContainsKey(item2.Name))
                            cateAmount.Add(item2.Name, item.amount);
                        else
                            cateAmount[item2.Name] += item.amount; 
                    }    
                }
            }

            return Json(cateAmount, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllProDuctByCategory()
        {
            var allProduct = productService.GetAllDetail().GroupBy(db => db.ID_Category).Select(group => new { amount = group.Sum(item => item.Amount), category =categoryService.GetAll().Where(c=>c.ID_Category == group.Key).FirstOrDefault().Name });
            return Json(allProduct, JsonRequestBehavior.AllowGet);
        }
    }
}