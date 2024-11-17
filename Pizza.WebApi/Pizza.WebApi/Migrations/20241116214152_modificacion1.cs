using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pizza.WebApi.Migrations
{
    /// <inheritdoc />
    public partial class modificacion1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Ingredients",
                table: "CustomPizzas");

            migrationBuilder.AddColumn<int>(
                name: "CustomPizzaRequestId",
                table: "Ingredients",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Ingredients_CustomPizzaRequestId",
                table: "Ingredients",
                column: "CustomPizzaRequestId");

            migrationBuilder.AddForeignKey(
                name: "FK_Ingredients_CustomPizzas_CustomPizzaRequestId",
                table: "Ingredients",
                column: "CustomPizzaRequestId",
                principalTable: "CustomPizzas",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ingredients_CustomPizzas_CustomPizzaRequestId",
                table: "Ingredients");

            migrationBuilder.DropIndex(
                name: "IX_Ingredients_CustomPizzaRequestId",
                table: "Ingredients");

            migrationBuilder.DropColumn(
                name: "CustomPizzaRequestId",
                table: "Ingredients");

            migrationBuilder.AddColumn<string>(
                name: "Ingredients",
                table: "CustomPizzas",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
