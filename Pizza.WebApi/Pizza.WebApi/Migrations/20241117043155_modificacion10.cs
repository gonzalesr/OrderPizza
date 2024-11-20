using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pizza.WebApi.Migrations
{
    /// <inheritdoc />
    public partial class modificacion10 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId",
                table: "CustomPizzaDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes");

            migrationBuilder.AlterColumn<int>(
                name: "PizzaModelId",
                table: "Recipes",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CustomPizzaRequestId",
                table: "CustomPizzaDetails",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_CustomPizzaDetails_IngredientId",
                table: "CustomPizzaDetails",
                column: "IngredientId");

            migrationBuilder.AddForeignKey(
                name: "FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId",
                table: "CustomPizzaDetails",
                column: "CustomPizzaRequestId",
                principalTable: "CustomPizzas",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_CustomPizzaDetails_Ingredients_IngredientId",
                table: "CustomPizzaDetails",
                column: "IngredientId",
                principalTable: "Ingredients",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes",
                column: "PizzaModelId",
                principalTable: "Pizzas",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId",
                table: "CustomPizzaDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_CustomPizzaDetails_Ingredients_IngredientId",
                table: "CustomPizzaDetails");

            migrationBuilder.DropForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes");

            migrationBuilder.DropIndex(
                name: "IX_CustomPizzaDetails_IngredientId",
                table: "CustomPizzaDetails");

            migrationBuilder.AlterColumn<int>(
                name: "PizzaModelId",
                table: "Recipes",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CustomPizzaRequestId",
                table: "CustomPizzaDetails",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId",
                table: "CustomPizzaDetails",
                column: "CustomPizzaRequestId",
                principalTable: "CustomPizzas",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Recipes_Pizzas_PizzaModelId",
                table: "Recipes",
                column: "PizzaModelId",
                principalTable: "Pizzas",
                principalColumn: "Id");
        }
    }
}
