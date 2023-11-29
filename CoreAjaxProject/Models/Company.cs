using System.ComponentModel.DataAnnotations;

namespace CoreAjaxProject.Models
{
    public class Company
    {
        [Key]
        public int CompanyNo { get; set; }
        [Required]
        public string? CompanyName { get; set; }
        public string? Description { get; set; }
        [Required]
        public string ContactName { get; set; }
        [Required]
        public string ContactPhone { get; set; }
        public string? TaxAdministration { get; set; }
    }
}
