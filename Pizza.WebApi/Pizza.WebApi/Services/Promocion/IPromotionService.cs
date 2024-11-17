using Pizza.WebApi.Model;

namespace Pizza.WebApi.Services.Promocion
{
    public interface IPromotionService
    {
        public void ApplyPromotions(OrderRequest order, DateTime date);
    }
}
