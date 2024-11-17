using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Delivery
{
    public interface IDeliveryService
    {
        public decimal CalculateDeliveryCost(OrderRequest order);
    }
}
