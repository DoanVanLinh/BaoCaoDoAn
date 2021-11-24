using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Areas.Admin.Controllers
{
    public class BillController : Controller
    {
        // GET: Admin/Bill
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult NewOrders()
        {
            return PartialView();
        }
        public ActionResult ConfirmOrders()
        {
            return View();
        }
        public ActionResult ShippingOrders()
        {
            return View();
        }
        public ActionResult SuccessOrders()
        {
            return View();
        }
        public ActionResult CancelOrders()
        {
            return View();
        }
    }
}