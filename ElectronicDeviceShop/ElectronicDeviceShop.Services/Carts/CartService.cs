using AutoMapper;
using ElectronicDeviceShop.Core.Infrastructures;
using ElectronicDeviceShop.Models;
using ElectronicDeviceShop.Models.Enums;
using ElectronicDeviceShop.ViewModels.Results;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ElectronicDeviceShop.ViewModels.Carts;

namespace ElectronicDeviceShop.Services.Carts
{
    public class CartService : ICartService
    {
        private readonly IUnitOfWork unitOfWork;
        public CartService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        public ResponseResult Edit(EditCartViewModel request)
        {
            try
            {
                var cart = Mapper.Map<Cart>(request);
                this.unitOfWork.CartRepository.Update(cart);
                this.unitOfWork.SaveChange();
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }

        public EditCartViewModel GetEditCartById(int id)
        {
            var cart = unitOfWork.CartRepository.GetById(id);
            return Mapper.Map<EditCartViewModel>(cart);
        }
        public CartDetailViewModel GetDetailCartById(int id)
        {
            var cart = unitOfWork.CartRepository.GetById(id);
            return Mapper.Map<CartDetailViewModel>(cart);
        }

        public ResponseResult Create(CreateCartViewModel request)
        {
            try
            {
                var cart = Mapper.Map<Cart>(request);
                this.unitOfWork.CartRepository.Add(cart);
                this.unitOfWork.SaveChange();
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }
        public IEnumerable<CartViewModel> GetCartByAccount(int id)
        {
            var cart = unitOfWork.CartRepository.GetAll().Where(c => c.ID_Account == id && c.Amount!=0);
            return Mapper.Map<IEnumerable<CartViewModel>>(cart);
        }
    }
}
