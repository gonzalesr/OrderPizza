using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public class PromotionService : IPromotionService
    {
        private readonly PromotionContext _promotionContext;

        public PromotionService()
        {
            _promotionContext = new PromotionContext();
        }

        public void ApplyPromotions(OrderRequest order, DateTime date)
        {
            // Determinar la estrategia según el día de la semana
            switch (date.DayOfWeek)
            {
                case DayOfWeek.Tuesday:
                case DayOfWeek.Wednesday:
                    _promotionContext.SetPromotionStrategy(new TwoForOnePromotion());
                    break;
                case DayOfWeek.Thursday:
                    _promotionContext.SetPromotionStrategy(new FreeDeliveryPromotion());
                    break;
                default:
                    _promotionContext.SetPromotionStrategy(new NoPromotion());
                    break;
            }

            // Aplicar la promoción seleccionada
            _promotionContext.ApplyPromotion(order);
            order.Discount = order.Details.Sum(x => x.Discount);
            order.Total = order.Details.Sum(x => x.Subtotal) - order.Discount;
        }
    }
}
