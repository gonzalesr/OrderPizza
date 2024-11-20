using Pizza.WebApi.Data;
using Pizza.WebApi.Model;
using Pizza.WebApi.DTO;

namespace Pizza.WebApi.Services.Ingrediente
{
    public class IngredientService : IIngredientService
    {
        private readonly ApplicationDbContext _context;
        public IngredientService(ApplicationDbContext context)
        {
            _context = context;
        }

        public  List<IngredientDTO> GetAvailableIngredients() 
        {
           var ingredients = _context.Ingredients.ToList();
            var listIngredient = new List<IngredientDTO>();
            foreach (var ingredient in ingredients)
            {
                var ling = new IngredientDTO
                {
                    Id = ingredient.Id,
                    Name = ingredient.Name,
                };
                listIngredient.Add(ling);
            }

            return listIngredient;
        }
    }
}
