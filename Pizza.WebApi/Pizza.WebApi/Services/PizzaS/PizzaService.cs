using Pizza.WebApi.Data;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.PizzaS
{
    public class PizzaService : IPizzaService
    {
        private readonly ApplicationDbContext _context;
        public PizzaService(ApplicationDbContext context)
        {
            _context = context;
        }

        public List<PizzaModel> GetAllPizzas()
        {
            // Crear una lista de PizzaModel
            var pizzas = _context.Pizzas.ToList();

            return pizzas;
        }

        public PizzaModel? GetPizzaById(int id)
        {
            var _pizza = _context.Pizzas.FirstOrDefault(p => p.Id == id);
           
            return _pizza;
        }

        public CustomPizzaRequest? CreateCustomPizza(CustomPizzaRequest request)
        {
            //var _pizza = new PizzaModel { Id = 2, Name = "CUSTOM PIZZA", Price = 10.99, Description = "PIZZA PERSONALIZADA: INGREDIENTES..." };
            _context.CustomPizzas.Add(request);
            _context.SaveChanges();
            return request;
        }

       public bool AddPresetPizzaToOrder(int id)
        { 

            return true;
        }


    }
}
