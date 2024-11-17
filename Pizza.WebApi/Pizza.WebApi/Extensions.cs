using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.JSInterop;
using Pizza.WebApi.Data;
using Pizza.WebApi.Model;
using Pizza.WebApi.Services.Delivery;
using Pizza.WebApi.Services.Ingrediente;
using Pizza.WebApi.Services.Pedido;


//using Pizza.WebApi.Services.Pedido;
using Pizza.WebApi.Services.PizzaS;
using Pizza.WebApi.Services.Promocion;

namespace Pizza.WebApi;

public static class Extensions
{

    
    public static void ConfigureServices(this IServiceCollection services,
        IConfiguration configuration)
    {
     
        services.AddScoped<IPizzaService, PizzaService>();
        services.AddScoped<IIngredientService, IngredientService>();
        services.AddScoped<IOrderService, OrderService>();
        services.AddScoped<IPromotionService, PromotionService>();
        services.AddScoped<IDeliveryService, DeliveryService>();

        services.AddDbContext<ApplicationDbContext>(option =>
        option.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));
    }

}
