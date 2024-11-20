using Pizza.WebApi.Model;

namespace Pizza.WebApi.DTO
{
    public class CustomPizzaDetailDTO
    {
        public int IngredientId { get; set; }

        public string Ingredient { get; set; }
        public decimal Quantity { get; set; }
        public decimal Price { get; set; } 
    }
}
