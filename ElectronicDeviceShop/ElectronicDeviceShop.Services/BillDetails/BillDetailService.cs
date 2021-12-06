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
using ElectronicDeviceShop.ViewModels.BillDetails;

namespace ElectronicDeviceShop.Services.BillDetails
{
    public class BillDetailService : IBillDetailService
    {
        private readonly IUnitOfWork unitOfWork;
        public BillDetailService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        public IEnumerable<BillDetailDetailViewModel> GetDetailBillDetailByBill(int bill)
        {
           var billDetails = unitOfWork.BillDetailRepository.GetAll().Where(b => b.ID_Bill == bill);
            return Mapper.Map<IEnumerable<BillDetailDetailViewModel>>(billDetails);
        }
    }
}
