using Pizza.WebApi.DTO;
using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.PizzaS
{
    public interface IPizzaService
    {
        public List<PizzaListDTO> GetAllPizzas();
        public PizzaDTO GetPizzaById(int id);
        public CustomPizzaDTO? CreateCustomPizza(CustomPizzaDTO request);
        bool AddPresetPizzaToOrder(int id);


    }
}
