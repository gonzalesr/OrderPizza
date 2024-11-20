using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public class FreeDeliveryPromotion: IPromotionStrategy
    {
        public void ApplyPromotion(OrderRequestDTO order)
        {
            order.DeliveryCost = 0;
        }
    }
}
