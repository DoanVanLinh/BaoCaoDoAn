using ElectronicDeviceShop.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ElectronicDeviceShop.ViewModels.Accounts
{
    class BillViewModel
    {
        public int ID_Bill { get; set; }

        public int ID_Account { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name ="Tên người nhận")]
        public string ReceiverName { get; set; }

        [Required]
        [StringLength(255)]
        [Display(Name = "Địa chỉ người nhận")]
        public string ReceiverAddress { get; set; }

        [Required]
        [StringLength(255)]
        [Display(Name = "Email người nhận")]
        public string ReceiverEmail { get; set; }

        [Required]
        [StringLength(20)]
        [Display(Name = "Số điện thoại người nhận")]
        public string ReceiverPhone { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Ghi chú")]
        public string Note { get; set; }

        [Required]
        [StringLength(255)]
        [Display(Name = "Kiểu thanh toán")]
        public string PayType { get; set; }

        [Column(TypeName = "date")]
        public DateTime BuyDate { get; set; }

        public virtual Account Account { get; set; }
    }
}
