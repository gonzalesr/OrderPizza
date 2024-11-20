namespace Pizza.WebApi.Model
{
    public class OrderRequestDTO
    {
        public int Id { get; set; }
        public String OrderStatus { get; set; }
        public string Customer {  get; set; }
        public string Address { get; set; }
        public DateTime OrderDate { get; set; }
        public ICollection<OrderDetailRequestDTO> Details { get; set; }
        public decimal TotalWithoutDisc{ get; set; }
        public decimal Discount { get; set; }
        public decimal DeliveryCost { get; set; }
        public decimal Total { get; set; }

    }
}
