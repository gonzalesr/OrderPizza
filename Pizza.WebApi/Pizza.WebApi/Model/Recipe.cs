﻿namespace Pizza.WebApi.Model
{
    public class Recipe
    {
        public int Id { get; set; }
        public int IngredientId { get; set; }
        public Ingredient Ingredient { get; set; }
        public decimal Quantity { get; set; }

    }
}
