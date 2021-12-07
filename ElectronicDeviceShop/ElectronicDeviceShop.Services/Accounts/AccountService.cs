﻿using AutoMapper;
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
                var account = Mapper.Map<Account>(request);
                this.unitOfWork.AccountRepository.Add(account);
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
                var account = Mapper.Map<Account>(request);
                this.unitOfWork.AccountRepository.Delete(account.ID_Account);
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
                var account = Mapper.Map<Account>(request);
                account.Status = Status.Active;
                this.unitOfWork.AccountRepository.Update(account);
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
            var accounts = this.unitOfWork.AccountRepository.GetAll().Where(p => p.Status != Status.IsDeleted);
            return Mapper.Map<IEnumerable<AccountViewModel>>(accounts);
        }

        public EditAccountViewModel GetEditAccountById(int id)
        {
            var account = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<EditAccountViewModel>(account);
        }
        public DeleteAccountViewModel GetDeleteAccountById(int id)
        {
            var account = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<DeleteAccountViewModel>(account);
        }
        public AccountDetailViewModel GetDetailAccountById(int id)
        {
            var account = unitOfWork.AccountRepository.GetById(id);
            return Mapper.Map<AccountDetailViewModel>(account);
        }
        public ResponseResult Login(LoginViewModel request)
        {
            try
            {
                var account = GetAccountByUserName(request.UserName);
                if (account == null || account.Password != request.Password)
                    throw new Exception("Sai TK!");
                return new ResponseResult();
            }
            catch (Exception ex)
            {
                return new ResponseResult(ex.Message);
            }
        }

        public LoginViewModel GetAccountByUserName(string userName)
        {
            var account = unitOfWork.AccountRepository.GetAll().Where(a => a.UserName == userName).FirstOrDefault();
            return Mapper.Map<LoginViewModel>(account);
        }
    }
}
