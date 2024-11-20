using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public class TwoForOnePromotion:IPromotionStrategy
    {
        public void ApplyPromotion(OrderRequestDTO order)
        {
            foreach (var pizza in order.Details)
            {
                if (pizza.Quantity >= 2)
                {
                    int freePizzas = Convert.ToInt32( pizza.Quantity / 2);
                    pizza.Discount += freePizzas * pizza.Price;
                }
            }
            
        }
    }
}
