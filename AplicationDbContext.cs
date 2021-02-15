using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_practica
{
    public class AplicationDbContext : DbContext
    {
        public DbSet<Models.employees> empleados { get; set; }

        public AplicationDbContext()
        {

        }

        public AplicationDbContext(DbContextOptions options) : base(options)
        {

        }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if(!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=localhost;Database=API_practica;User Id=sa;Password=123;");
            }
            
        }
    }
}
