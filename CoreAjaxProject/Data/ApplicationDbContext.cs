using CoreAjaxProject.Models;
using CoreAjaxProject.Models.Accountt;
using Microsoft.EntityFrameworkCore;

namespace CoreAjaxProject.Data
{
    public class ApplicationDbContext: DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Product> products { get; set; }
        public DbSet<Category> categories { get; set; }
        public DbSet<Company> companies { get; set; }
        public DbSet<Employee> employees { get; set; }
        public DbSet<Userr> userrs { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Userr>()
                .HasIndex(u => u.EMail)
                .IsUnique();

            
        }
    }

   
}
