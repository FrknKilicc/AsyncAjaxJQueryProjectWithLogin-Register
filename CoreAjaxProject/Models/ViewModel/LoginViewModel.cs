using System.ComponentModel.DataAnnotations;

namespace CoreAjaxProject.Models.ViewModel
{
    public class LoginViewModel
    {
        
        public int UserId { get; set; }
        [Required]
        public string UserNamee { get; set; }
        [Required]
        public string EMail { get; set; }
        public string PhoneNumber { get; set; }
        [Required]
        public string Passwordd { get; set; }
        public string ConfirmPasswordd { get; set; }
        public bool IsActive { get; set; }
        public bool IsRemember { get; set; }
    }
}
