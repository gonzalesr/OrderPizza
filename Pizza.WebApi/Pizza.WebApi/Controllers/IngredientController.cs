using Microsoft.AspNetCore.Mvc;
using Pizza.WebApi.Model;
using Pizza.WebApi.Services.Ingrediente;

namespace Pizza.WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class IngredientController : Controller
    {
        private readonly IIngredientService _ingredientService;

        public IngredientController(IIngredientService ingredientService)
        {
            _ingredientService = ingredientService;
        }

        // Obtener ingredientes disponibles
        [HttpGet]
        public IActionResult GetIngredients()
        {
            var ingredients = _ingredientService.GetAvailableIngredients();
            return Ok(ingredients);
        }
    }
}
