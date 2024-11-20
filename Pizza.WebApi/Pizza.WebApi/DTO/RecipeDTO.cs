namespace Pizza.WebApi.DTO
{
   
    public class RecipeDto
    {
        public int Id { get; set; }
        public int IngredientId { get; set; }
        public string Name { get; set;}
        public decimal Quantity { get; set; }
    }

}
