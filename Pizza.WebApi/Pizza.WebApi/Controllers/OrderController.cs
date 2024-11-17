using Microsoft.AspNetCore.Mvc;
using Pizza.WebApi.Services.Pedido;
using Pizza.WebApi.Model;
using Pizza.WebApi.Services.PizzaS;

namespace Pizza.WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class OrderController : Controller
    {
        private readonly IOrderService _orderService;
        public OrderController(IOrderService orderService)
        {
            _orderService = orderService;
        }
        // Crear un nuevo pedido
        [HttpPost]
        public IActionResult CreateOrder([FromBody] OrderRequest request)
        {
            var order = _orderService.CreateOrder(request);
            return CreatedAtAction(nameof(GetOrderById), new { id = order.Id }, order);
        }

        // Obtener los detalles de un pedido
        [HttpGet("{id}")]
        public IActionResult GetOrderById(int id)
        {
            var order = _orderService.GetOrderById(id);
            if (order == null)
                return NotFound();
            return Ok(order);
        }
    }
}
