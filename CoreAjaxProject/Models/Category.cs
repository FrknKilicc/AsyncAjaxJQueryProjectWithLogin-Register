using System.ComponentModel.DataAnnotations;

namespace CoreAjaxProject.Models
{
    public class Category
    {
        [Key]
        public int CategoryId { get; set; }
        [Required]
        public string? CategoryName { get; set; }
        public string? Description { get; set; }

    }
}
