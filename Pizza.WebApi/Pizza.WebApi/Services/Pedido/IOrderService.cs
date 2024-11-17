using Microsoft.AspNetCore.Mvc;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Pedido
{
    public interface IOrderService
    {
        public OrderRequest CreateOrder(OrderRequest request);
        public OrderRequest GetOrderById(int id);
    }
}
