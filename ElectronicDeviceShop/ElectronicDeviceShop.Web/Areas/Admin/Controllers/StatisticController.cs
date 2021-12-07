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
        // GET: Admin/Statistic
        public ActionResult Index()
        {
            return View();
        }
    }
}