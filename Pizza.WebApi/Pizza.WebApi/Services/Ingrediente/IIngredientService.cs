using Pizza.WebApi.DTO;

namespace Pizza.WebApi.Services.Ingrediente
{
    public interface IIngredientService
    {
        public List<IngredientDTO> GetAvailableIngredients();
    }
}
