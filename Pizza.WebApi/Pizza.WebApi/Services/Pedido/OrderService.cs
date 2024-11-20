using Pizza.WebApi.Data;
using Pizza.WebApi.Model;
using Pizza.WebApi.Services.Delivery;
using Pizza.WebApi.Services.Promocion;

namespace Pizza.WebApi.Services.Pedido
{
    public class OrderService : IOrderService
    {
        private readonly IPromotionService _promotionService;
        private readonly IDeliveryService _deliveryService;
        private readonly ApplicationDbContext _context;
                public OrderService(IPromotionService promotionService,IDeliveryService deliveryService, ApplicationDbContext context)
        {
            _promotionService = promotionService;
            _deliveryService = deliveryService;
            _context = context;
        }

        public OrderRequestDTO CreateOrder(OrderRequestDTO request)
        {
          
            foreach (var detail in request.Details)
            {
                detail.UpdateSubtotal();

            }
            var DeliveryCost = _deliveryService.CalculateDeliveryCost(request);
            var TotalWithoutDisc = request.Details.Sum(p => p.Subtotal);

            var order = request;

            order.DeliveryCost = DeliveryCost;
            order.TotalWithoutDisc = TotalWithoutDisc;             
            

            // Aplicar promociones según la fecha
            _promotionService.ApplyPromotions(order, request.OrderDate);
            order.Total = order.Total + order.DeliveryCost;

            // Guardar el pedido en la base de datos
            _context.Add(order);
            _context.SaveChanges();
            return order;
        }
        public OrderRequestDTO GetOrderById(int id)
        {
            
            var order = _context.Orders.FirstOrDefault(p=>p.Id == id);
            return order;
        }
    }
}
