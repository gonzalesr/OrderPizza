namespace Pizza.WebApi.Model
{
    public class CustomPizzaRequest
    {
        public int Id { get; set; }
        public ICollection<CustomPizzaDetail> Ingredients { get; set; } // Lista de ingredientes seleccionados
        public decimal Price { get; set; }
    }
}
