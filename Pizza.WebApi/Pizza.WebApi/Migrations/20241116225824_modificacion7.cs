using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pizza.WebApi.Migrations
{
    /// <inheritdoc />
    public partial class modificacion7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Recipe_Ingredients_IngredientId",
                table: "Recipe");

            migrationBuilder.DropForeignKey(
                name: "FK_Recipe_Pizzas_PizzaModelId",
                table: "Recipe");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Recipe",
                table: "Recipe");

            migrationBuilder.RenameTable(
                name: "Recipe",
                newName: "Recipes");

            migrationBuilder.RenameIndex(
                name: "IX_Recipe_PizzaModelId",
                table: "Recipes",
                newName: "IX_Recipes_PizzaModelId");

            migrationBuilder.RenameIndex(
                name: "IX_Recipe_IngredientId",
                table: "Recipes",
                newName: "IX_Recipes_IngredientId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Recipes",
                table: "Recipes",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Recipes_Ingredients_IngredientId",
                table: "Recipes",
                column: "IngredientId",
                principalTable: "Ingredients",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes",
                column: "PizzaModelId",
                principalTable: "Pizzas",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Recipes_Ingredients_IngredientId",
                table: "Recipes");

            migrationBuilder.DropForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Recipes",
                table: "Recipes");

            migrationBuilder.RenameTable(
                name: "Recipes",
                newName: "Recipe");

            migrationBuilder.RenameIndex(
                name: "IX_Recipes_PizzaModelId",
                table: "Recipe",
                newName: "IX_Recipe_PizzaModelId");

            migrationBuilder.RenameIndex(
                name: "IX_Recipes_IngredientId",
                table: "Recipe",
                newName: "IX_Recipe_IngredientId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Recipe",
                table: "Recipe",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Recipe_Ingredients_IngredientId",
                table: "Recipe",
                column: "IngredientId",
                principalTable: "Ingredients",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Recipe_Pizzas_PizzaModelId",
                table: "Recipe",
                column: "PizzaModelId",
                principalTable: "Pizzas",
                principalColumn: "Id");
        }
    }
}
