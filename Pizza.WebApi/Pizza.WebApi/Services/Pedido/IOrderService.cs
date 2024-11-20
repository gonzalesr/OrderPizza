using Microsoft.AspNetCore.Mvc;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Pedido
{
    public interface IOrderService
    {
        public OrderRequestDTO CreateOrder(OrderRequestDTO request);
        public OrderRequestDTO GetOrderById(int id);
    }
}
