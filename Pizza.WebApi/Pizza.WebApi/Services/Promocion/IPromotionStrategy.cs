using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public interface IPromotionStrategy
    {
        void ApplyPromotion(OrderRequestDTO order);
    }
}
