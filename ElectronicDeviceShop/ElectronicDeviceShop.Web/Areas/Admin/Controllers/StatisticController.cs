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
    [CustomAuthorize(Roles = "Admin,Staff")]

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
            var allShare = 0;
            foreach (var item in detailBill)
            {
                allShare += item.CurrentlyPrice;
            }
            return Json(new { cateAmount = cateAmount,allShare = allShare }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllProDuctByCategory()
        {
            var allProduct = productService.GetAllDetail().GroupBy(db => db.ID_Category).Select(group => new { amount = group.Sum(item => item.Amount), category =categoryService.GetAll().Where(c=>c.ID_Category == group.Key).FirstOrDefault().Name });
            return Json(allProduct, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllShareOfYear()
        {
            int thisYear = DateTime.Today.Year;
            var allBill = billService.GetAllDetailBill().Where(b=>b.BuyDate.Year == thisYear);
            Dictionary<string,int> data = new Dictionary<string, int>();
            for (int i = 1; i < 13; i++)
            {
                data.Add(i.ToString(),0);
            }

            foreach (var item in allBill)
            {
                var billDetail = billDetailService.GetDetailBillDetailByBill(item.ID_Bill);
                foreach (var item2 in billDetail)
                {
                    var month = item.BuyDate.Month;
                    if (data.ContainsKey(month.ToString()))
                        data[month.ToString()] += item2.CurrentlyPrice;
                }
            }

            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}