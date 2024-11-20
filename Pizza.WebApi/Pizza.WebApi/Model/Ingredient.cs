namespace Pizza.WebApi.Model
{
    public class Ingredient
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public ICollection<CustomPizzaDetail> CustomPizzaDetails { get; set; }
        public ICollection<Recipe> Recipes { get; set; }
    }
}
