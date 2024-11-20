
namespace Pizza.WebApi.Model
{
    public class PizzaModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public ICollection<Recipe> Recipes { get; set; } 


    }
}
