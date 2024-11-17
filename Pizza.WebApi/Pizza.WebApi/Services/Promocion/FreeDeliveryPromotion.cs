using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public class FreeDeliveryPromotion: IPromotionStrategy
    {
        public void ApplyPromotion(OrderRequest order)
        {
            order.DeliveryCost = 0;
        }
    }
}
