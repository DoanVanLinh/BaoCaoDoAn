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
using ElectronicDeviceShop.ViewModels.PermissionDetails;
using System.Data.Entity;
using ElectronicDeviceShop.Services.PermissionDetails;
using ElectronicDeviceShop.Services.Permissions;

namespace ElectronicDeviceShop.Services.PermissionDetails
{
    public class PermissionDetailService : IPermissionDetailService
    {
        private readonly IUnitOfWork unitOfWork;
        public PermissionDetailService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        PermissionDetailDetailViewModel IPermissionDetailService.GetDetailPermissionDetailByIdAccountIdPermission(int idAccount, int idPermission)
        {
            var permission = unitOfWork.PermissionDetailRepository.GetAll().Where(p => p.ID_Permission == idPermission && p.ID_Account == idAccount).FirstOrDefault();
            return Mapper.Map<PermissionDetailDetailViewModel>(permission);
        }
    }
}
