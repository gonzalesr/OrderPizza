using Pizza.WebApi.Model;
namespace Pizza.WebApi.Services.PizzaS
{
    public interface IPizzaService
    {
        public List<PizzaModel> GetAllPizzas();
        public PizzaModel? GetPizzaById(int id);
        public CustomPizzaRequest? CreateCustomPizza(CustomPizzaRequest request);
        bool AddPresetPizzaToOrder(int id);


    }
}
