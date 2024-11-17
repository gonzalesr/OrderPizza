using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Ingrediente
{
    public interface IIngredientService
    {
        public List<Ingredient> GetAvailableIngredients();
    }
}
