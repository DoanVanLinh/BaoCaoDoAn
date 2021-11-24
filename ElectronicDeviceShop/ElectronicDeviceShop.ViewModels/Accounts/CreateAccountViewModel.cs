using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ElectronicDeviceShop.ViewModels.Accounts
{
    class CreateAccountViewModel
    {
        public int ID_Account { get; set; }

        [Required()]
        [StringLength(30)]
        [Display(Name = "Tên tài khoản")]
        public string UserName { get; set; }

        [Required()]
        [StringLength(30)]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [Required()]
        [StringLength(255)]
        [Display(Name = "Họ và tên")]
        public string FullName { get; set; }

        [Required()]
        [StringLength(10)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [Required()]
        [StringLength(255)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Required()]
        [StringLength(255)]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required()]
        [StringLength(255)]
        [Display(Name = "Ảnh đại diện")]
        public string Avatar { get; set; }

        [Required()]
        [Display(Name = "Vai trò")]
        public short Role { get; set; }
    }
}
