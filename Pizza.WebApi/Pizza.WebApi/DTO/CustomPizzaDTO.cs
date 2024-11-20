using Pizza.WebApi.Model;

namespace Pizza.WebApi.DTO
{
    public class CustomPizzaDTO
    {
        public int Id { get; set; }
        public List<CustomPizzaDetailDTO>? Ingredients { get; set; }
    public decimal Price { get; set; }
    }
}
