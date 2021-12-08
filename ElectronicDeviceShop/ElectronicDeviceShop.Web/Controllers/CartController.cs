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

        public ActionResult Index(int id)
        {
            Session["ID_Account"] = id;
            cart = cartService.GetCartByAccount(int.Parse(Session["ID_Account"].ToString()));
            if (cart.Count() != 0)
                Session["ID_Cart"] = cart.FirstOrDefault().ID_Cart;
            else
                Session["ID_Cart"] = -1;
            return View();
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