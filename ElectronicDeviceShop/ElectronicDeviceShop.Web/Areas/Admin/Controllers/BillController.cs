using ElectronicDeviceShop.Models.Enums;
using ElectronicDeviceShop.Services.Bills;
using ElectronicDeviceShop.ViewModels.Bills;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Areas.Admin.Controllers
{
    public class BillController : Controller
    {
        private readonly IBillService billService;
        private readonly int pageSize = 4;
        public BillController(IBillService billService)
        {
            this.billService = billService;
        }

        public ActionResult Index()
        {
            return View();
        }
        //public JsonResult GetAll(string txtSearch, int? page)
        //{
        //    var bills = billService.GetAll();
        //    if (!String.IsNullOrEmpty(txtSearch))
        //    {
        //        ViewBag.txtSearch = txtSearch;
        //        bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
        //    }

        //    if (page <= 0)
        //        page = 1;
        //    int totalPage = bills.Count();
        //    float totalNumsize = (totalPage / (float)pageSize);
        //    int numSize = (int)Math.Ceiling(totalNumsize);
        //    if (page > numSize)
        //        page = numSize;

        //    ViewBag.pageCurrent = page;
        //    ViewBag.pageSize = pageSize;
        //    ViewBag.numSize = numSize;
        //    ViewBag.all = bills;

        //    int start = (int)(page - 1) * pageSize;
        //    var dataBill = bills.Skip(start).Take(pageSize);
        //    return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        //}
        public JsonResult GetNewOrder(string txtSearch, int? page)
        {
            var bills = billService.GetDetailBillByStatus(Status.NewOrders);
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                
                bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = bills.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = bills;

            int start = (int)(page - 1) * pageSize;
            var dataBill = bills.Skip(start).Take(pageSize);
            return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetConfirmOrder(string txtSearch, int? page)
        {
            var bills = billService.GetDetailBillByStatus(Status.ConfirmOrders);
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = bills.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = bills;

            int start = (int)(page - 1) * pageSize;
            var dataBill = bills.Skip(start).Take(pageSize);
            return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetShippingOrder(string txtSearch, int? page)
        {
            var bills = billService.GetDetailBillByStatus(Status.ShippingOrders);
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = bills.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = bills;

            int start = (int)(page - 1) * pageSize;
            var dataBill = bills.Skip(start).Take(pageSize);
            return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetSuccessOrder(string txtSearch, int? page)
        {
            var bills = billService.GetDetailBillByStatus(Status.SuccessOrders);
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = bills.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = bills;

            int start = (int)(page - 1) * pageSize;
            var dataBill = bills.Skip(start).Take(pageSize);
            return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCancelOrder(string txtSearch, int? page)
        {
            var bills = billService.GetDetailBillByStatus(Status.CancelOrders);
            if (!String.IsNullOrEmpty(txtSearch))
            {
                ViewBag.txtSearch = txtSearch;
                bills = bills.Where(s => s.ReceiverName.ToLower().Contains(txtSearch.ToLower()));
            }

            if (page <= 0)
                page = 1;
            int totalPage = bills.Count();
            float totalNumsize = (totalPage / (float)pageSize);
            int numSize = (int)Math.Ceiling(totalNumsize);
            if (page > numSize)
                page = numSize;

            ViewBag.pageCurrent = page;
            ViewBag.pageSize = pageSize;
            ViewBag.numSize = numSize;
            ViewBag.all = bills;

            int start = (int)(page - 1) * pageSize;
            var dataBill = bills.Skip(start).Take(pageSize);
            return Json(new { all = bills, data = dataBill, pageCurrent = page, numSize = numSize, pageSize = pageSize }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetById(int id)
        {
            var bill = billService.GetEditBillById(id);
            return Json(bill, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Edit(EditBillViewModel bill)
        {
            var response = billService.Edit(bill);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
    }
}