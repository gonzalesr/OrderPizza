using Microsoft.EntityFrameworkCore;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // Define tus DbSet para las entidades
        public DbSet<PizzaModel> Pizzas { get; set; }
        public DbSet<OrderRequest> Orders { get; set; }
        public DbSet<OrderDetailRequest> OrderDetails { get; set; }
        public DbSet<CustomPizzaRequest> CustomPizzas { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public  DbSet<CustomPizzaDetail> CustomPizzaDetails { get; set; }
        public DbSet<Recipe> Recipes { get; set; }



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configuración adicional para entidades, si es necesaria
            modelBuilder.Entity<PizzaModel>().ToTable("Pizzas");
            modelBuilder.Entity<OrderRequest>().ToTable("Orders");
            modelBuilder.Entity<OrderDetailRequest>().ToTable("OrderDetails");
            modelBuilder.Entity<CustomPizzaRequest>().ToTable("CustomPizzas");
            modelBuilder.Entity<Ingredient>().ToTable("Ingredients");
            modelBuilder.Entity<CustomPizzaDetail>().ToTable("CustomPizzaDetails");
            modelBuilder.Entity<Recipe>().ToTable("Recipes");


        }
    }
}
