using Microsoft.EntityFrameworkCore;
using Pizza.WebApi.Data;
using Pizza.WebApi.Model;
using Pizza.WebApi.DTO;

namespace Pizza.WebApi.Services.PizzaS
{
    public class PizzaService : IPizzaService
    {
        private readonly ApplicationDbContext _context;
        public PizzaService(ApplicationDbContext context)
        {
            _context = context;
        }


        public List<PizzaListDTO> GetAllPizzas()
        {
// Crear una lista de PizzaModel
            var pizzas = _context.Pizzas.ToList();
            var listPizza = new List<PizzaListDTO>();
            foreach (var pizza in pizzas)
                {
                var lpizza = new PizzaListDTO();
                lpizza.Id = pizza.Id;
                lpizza.Name = pizza.Name;
                lpizza.Price = pizza.Price;
                lpizza.Description = pizza.Description;
                listPizza.Add(lpizza);
            };
            return listPizza;
        }
            
        public PizzaDTO GetPizzaById(int id)
        {
            var pizza = _context.Pizzas
                .Include(r => r.Recipes)
                .ThenInclude(i => i.Ingredient)
                .FirstOrDefault(p => p.Id == id);
            var pizzaDto = new PizzaDTO
            {
                Id = pizza.Id,
                Name = pizza.Name,
                Price = pizza.Price,
                Description = pizza.Description,
                Recipe = pizza.Recipes.Select(r => new RecipeDto
                {
                    Id = r.Id,
                    IngredientId = r.IngredientId,
                    Name = r.Ingredient.Name,
                    Quantity = r.Quantity
                }).ToList()
            };

            return pizzaDto;
        }

        public CustomPizzaDTO? CreateCustomPizza(CustomPizzaDTO request)
        {
            var cusPizza = new CustomPizzaRequest
            {
                Ingredients = new List<CustomPizzaDetail>() // Inicializamos la lista Ingredients
            };
            cusPizza.Id = request.Id;
            cusPizza.Price  = request.Price;
            foreach (var ingredient in request.Ingredients)
            {
                var detCusPizza = new CustomPizzaDetail();
                detCusPizza.IngredientId = ingredient.IngredientId;
                cusPizza.Ingredients.Add(detCusPizza);
            }



            _context.CustomPizzas.Add(cusPizza);
            _context.SaveChanges();
            return request;
        }

       public bool AddPresetPizzaToOrder(int id)
        { 

            return true;
        }


    }
}
