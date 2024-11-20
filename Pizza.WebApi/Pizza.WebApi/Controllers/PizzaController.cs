using Microsoft.AspNetCore.Mvc;
using Pizza.WebApi.Services.PizzaS;
using Pizza.WebApi.DTO;
namespace Pizza.WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PizzaController : Controller
    {
        private readonly IPizzaService _pizzaService;
        public PizzaController(IPizzaService pizzaService)
        {
            _pizzaService = pizzaService;
        }
        // Obtener todas las pizzas
        [HttpGet(Name = "GetAllPizzas")]
        public IActionResult GetAllPizzas()
        {
            var pizzas = _pizzaService.GetAllPizzas();
            return Ok(pizzas);
        }

        // Obtener detalles de una pizza específica
        [HttpGet("{id}")]
        public IActionResult GetPizzaById(int id)
        {
            var pizza = _pizzaService.GetPizzaById(id);
            if (pizza == null)
                return NotFound();
            return Ok(pizza);
        }

        // Crear una pizza personalizada
        [HttpPost("customize")]
        public IActionResult CreateCustomPizza([FromBody] CustomPizzaDTO request)
        {
            var pizza = _pizzaService.CreateCustomPizza(request);
            return CreatedAtAction(nameof(GetPizzaById), new { id = pizza.Id }, pizza);
        }

        // Seleccionar una receta preestablecida
        [HttpPost("preset/{id}")]
        public IActionResult AddPresetPizzaToOrder(int id)
        {
            var success = _pizzaService.AddPresetPizzaToOrder(id);
            if (!success)
                return BadRequest("No se pudo agregar la pizza al pedido.");
            return Ok("Pizza agregada al pedido exitosamente.");
        }
    }







}
