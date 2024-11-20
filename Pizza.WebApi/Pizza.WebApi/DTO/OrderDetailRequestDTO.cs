namespace Pizza.WebApi.Model
{
    public class OrderDetailRequestDTO
    {
        public int Id { get; set; }
        public int PizzaId {  get; set; }
        public string Detail { get; set; }
        public decimal Price { get; set; }
        public decimal Quantity { get; set; }
        public decimal Discount { get; set; }
        public decimal Subtotal { get; private set; }
        public void UpdateSubtotal()
        {
            Subtotal = Price * Quantity;
        }

    }
}
