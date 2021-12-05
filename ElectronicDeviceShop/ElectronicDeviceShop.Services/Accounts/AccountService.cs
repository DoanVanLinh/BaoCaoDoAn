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
using ElectronicDeviceShop.ViewModels.Accounts;

namespace ElectronicDeviceShop.Services.Accounts
{
    public class AccountService : IAccountService
    {
        private readonly IUnitOfWork unitOfWork;
        public AccountService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        public ResponseResult Create(CreateAccountViewModel request)
        {
            try
            {
                var category = Mapper.Map<Account>(request);
                this.unitOfWork.AccountRepository.Add(category);
                this.unitOfWork.SaveChange();
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }

        public ResponseResult Delete(DeleteAccountViewModel request)
        {
            try
            {
                var category = Mapper.Map<Account>(request);
                this.unitOfWork.AccountRepository.Delete(category.ID_Account);
                this.unitOfWork.SaveChange();
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }

        public ResponseResult Edit(EditAccountViewModel request)
        {
            try
            {
                var category = Mapper.Map<Account>(request);
                category.Status = Status.Active;
                this.unitOfWork.AccountRepository.Update(category);
                this.unitOfWork.SaveChange();
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }

        public IEnumerable<AccountViewModel> GetAll()
        {
            var categorys = this.unitOfWork.AccountRepository.GetAll().Where(p => p.Status != Status.IsDeleted);
            return Mapper.Map<IEnumerable<AccountViewModel>>(categorys);
        }

        public EditAccountViewModel GetEditAccountById(int id)
        {
            var category = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<EditAccountViewModel>(category);
        }
        public DeleteAccountViewModel GetDeleteAccountById(int id)
        {
            var category = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<DeleteAccountViewModel>(category);
        }
        public AccountDetailViewModel GetDetailAccountById(int id)
        {
            var category = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<AccountDetailViewModel>(category);
        }
    }
}
