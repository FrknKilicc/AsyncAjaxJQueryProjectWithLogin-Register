using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CoreAjaxProject.Models
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        [Required]
        public string StockCode { get; set; }
        [Required()]
        public string Barcode { get; set; }
        [Required()]
        public string ProductName { get; set; }
        [Required()]
        public int Quantity { get; set; }
        public string? Brand { get; set; }

        [ForeignKey("CategoryID")]
        public int CategoryID { get; set; }

        Category Category { get; set; }
    }
}
