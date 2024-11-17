using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pizza.WebApi.Migrations
{
    /// <inheritdoc />
    public partial class modificacion2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
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

            migrationBuilder.CreateTable(
                name: "CustomPizzaDetails",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CustomPizzaId = table.Column<int>(type: "int", nullable: false),
                    IngredientId = table.Column<int>(type: "int", nullable: false),
                    CustomPizzaRequestId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CustomPizzaDetails", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CustomPizzaDetails_CustomPizzas_CustomPizzaRequestId",
                        column: x => x.CustomPizzaRequestId,
                        principalTable: "CustomPizzas",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_CustomPizzaDetails_CustomPizzaRequestId",
                table: "CustomPizzaDetails",
                column: "CustomPizzaRequestId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CustomPizzaDetails");

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
    }
}
