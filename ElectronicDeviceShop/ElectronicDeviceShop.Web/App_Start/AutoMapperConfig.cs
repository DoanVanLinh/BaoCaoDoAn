﻿using AutoMapper;
using ElectronicDeviceShop.Models;
using ElectronicDeviceShop.ViewModels.Accounts;
using ElectronicDeviceShop.ViewModels.Bills;
using ElectronicDeviceShop.ViewModels.Carts;
using ElectronicDeviceShop.ViewModels.Categories;
using ElectronicDeviceShop.ViewModels.Products;
using ElectronicDeviceShop.ViewModels.Suppliers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicDeviceShop.Web.App_Start
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<CreateAccountViewModel, Account>().ReverseMap();
            CreateMap<AccountViewModel, Account>().ReverseMap();
            CreateMap<EditAccountViewModel, Account>().ReverseMap();
            CreateMap<ChangeStatusAccountViewModel, Account>().ReverseMap();
            CreateMap<AccountDetailViewModel, Account>().ReverseMap();

            CreateMap<BillViewModel, Bill>().ReverseMap();
            CreateMap<ChangeStatusBillViewModel, Bill>().ReverseMap();
            CreateMap<BillDetailViewModel, Bill>().ReverseMap();

            CreateMap<CreateCartViewModel, Cart>().ReverseMap();
            CreateMap<CartViewModel, Cart>().ReverseMap();
            CreateMap<EditCartViewModel, Cart>().ReverseMap();
            CreateMap<DeleteCartViewModel, Cart>().ReverseMap();
            CreateMap<CartDetailViewModel, Cart>().ReverseMap();

            CreateMap<CreateCategoryViewModel, Category>().ReverseMap();
            CreateMap<CategoryViewModel, Category>().ReverseMap();
            CreateMap<EditCategoryViewModel, Category>().ReverseMap();
            CreateMap<DeleteCategoryViewModel, Category>().ReverseMap();
            CreateMap<CategoryDetailViewModel, Category>().ReverseMap();

            CreateMap<CreateProductViewModel, Product>().ReverseMap();
            CreateMap<ProductViewModel, Product>().ReverseMap();
            CreateMap<EditProductViewModel, Product>().ReverseMap();
            CreateMap<DeleteProductViewModel, Product>().ReverseMap();
            CreateMap<ProductDetailViewModel, Product>().ReverseMap();

            CreateMap<CreateSupplierViewModel, Supplier>().ReverseMap();
            CreateMap<SupplierViewModel, Supplier>().ReverseMap();
            CreateMap<EditSupplierViewModel, Supplier>().ReverseMap();
            CreateMap<DeleteSupplierViewModel, Supplier>().ReverseMap();
            CreateMap<SupplierDetailViewModel, Supplier>().ReverseMap();
        }
    }
}