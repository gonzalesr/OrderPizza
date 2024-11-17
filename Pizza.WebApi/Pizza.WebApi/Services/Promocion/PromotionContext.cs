using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public class PromotionContext
    {
        private IPromotionStrategy _promotionStrategy;

        public void SetPromotionStrategy(IPromotionStrategy promotionStrategy)
        {
            _promotionStrategy = promotionStrategy;
        }

        public void ApplyPromotion(OrderRequest order)
        {
            _promotionStrategy.ApplyPromotion(order);
        }
    }
}
