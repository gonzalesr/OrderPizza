using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Delivery
{
    public class DeliveryService: IDeliveryService
    {
        private const decimal StandardDeliveryCost = 5.00m; // Costo estándar de entrega
        private const decimal FreeDeliveryThreshold = 0.00m; // Envío gratis los jueves

        public decimal CalculateDeliveryCost(OrderRequestDTO order)
        {
            // Verificar si el pedido cumple con las condiciones de envío gratis
            if (IsFreeDeliveryDay(order.OrderDate))
            {
                return FreeDeliveryThreshold;
            }

            // Calcular el costo estándar de entrega
            return StandardDeliveryCost;
        }

        private bool IsFreeDeliveryDay(DateTime deliveryDate)
        {
            // Envío gratis si el día es jueves
            return deliveryDate.DayOfWeek == DayOfWeek.Thursday;
        }
    }
}
