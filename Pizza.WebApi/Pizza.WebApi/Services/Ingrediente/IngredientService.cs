using Pizza.WebApi.Data;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Ingrediente
{
    public class IngredientService : IIngredientService
    {
        private readonly ApplicationDbContext _context;
        public IngredientService(ApplicationDbContext context)
        {
            _context = context;
        }

        public  List<Ingredient> GetAvailableIngredients() 
        {
           var ingredients = _context.Ingredients.ToList();
            return ingredients;
        }
    }
}
