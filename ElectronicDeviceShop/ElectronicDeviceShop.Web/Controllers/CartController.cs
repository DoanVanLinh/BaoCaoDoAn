using ElectronicDeviceShop.Services.Carts;
using ElectronicDeviceShop.Services.Products;
using ElectronicDeviceShop.ViewModels.Carts;
using ElectronicDeviceShop.ViewModels.Products;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectronicDeviceShop.Web.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductService productService;
        private readonly ICartService cartService;
        static IEnumerable<CartViewModel> cart;
        public CartController(IProductService productService, ICartService cartService)
        {
            this.productService = productService;
            this.cartService = cartService;
        }

        public ActionResult Index()
        {
            if (Session["ID_Account"] != null)
            {
                if (int.Parse(Session["ID_Account"].ToString()) > 0)
                {
                    cart = cartService.GetCartByAccount(int.Parse(Session["ID_Account"].ToString()));
                    return View();
                }
                else
                    return RedirectToAction("Index", "Account");
            }
            else
                return RedirectToAction("Index", "Account");
        }
        public JsonResult GetAll()
        {
            cart = cartService.GetCartByAccount(int.Parse(Session["ID_Account"].ToString()));
            var product =new List<ProductViewModel>();
            foreach (var item in cart)
            {
                product.Add(productService.GetAll().Where(p => p.ID_Product == item.ID_Product).FirstOrDefault());
            }
            return Json(new { cart = cart, product = product }, JsonRequestBehavior.AllowGet);

        }

        public JsonResult Edit(EditCartViewModel cart)
        {
            var response = cartService.Edit(cart);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Create(CreateCartViewModel cart)
        {
            var response = cartService.Create(cart);
            return Json(response.IsSuccessed, JsonRequestBehavior.AllowGet);
        }
    }
}