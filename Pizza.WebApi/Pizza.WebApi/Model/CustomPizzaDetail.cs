namespace Pizza.WebApi.Model
{
    public class CustomPizzaDetail
    {
        public int Id { get; set; }
        public int IngredientId { get; set; }

        public CustomPizzaRequest CustomPizzaRequest { get; set; }
        public Ingredient Ingredient { get; set; }
        
    }
}
