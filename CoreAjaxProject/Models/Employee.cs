using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreAjaxProject.Models
{
    public class Employee
    {
        [Key]
        public int EmployeeId { get; set; }
        public string? EmployeeName { get; set; }
        public string? EmployeeTitle { get; set; }
        public string? PhoneNumber { get; set; }
        public DateTime EmployeeStartDate { get; set; }
        [ForeignKey("CompanyNo")]
        public string? EmployeeCompany { get; set; }
        public decimal EmployeeSalary { get; set; }
        Company Company { get; set; }
    }
}
