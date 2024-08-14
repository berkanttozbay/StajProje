using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StajProje.Migrations
{
    /// <inheritdoc />
    public partial class Init8 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Cocuk",
                table: "reservations");

            migrationBuilder.DropColumn(
                name: "MisafirAd",
                table: "reservations");

            migrationBuilder.DropColumn(
                name: "MisafirSoyad",
                table: "reservations");

            migrationBuilder.RenameColumn(
                name: "Yetiskin",
                table: "reservations",
                newName: "GuestId");

            migrationBuilder.RenameColumn(
                name: "Phone",
                table: "reservations",
                newName: "Aciklama");

            migrationBuilder.CreateTable(
                name: "guests",
                columns: table => new
                {
                    GuestId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MisafirAd = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MisafirSoyad = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Phone = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Yetiskin = table.Column<int>(type: "int", nullable: false),
                    Cocuk = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_guests", x => x.GuestId);
                });

            migrationBuilder.CreateIndex(
                name: "IX_reservations_GuestId",
                table: "reservations",
                column: "GuestId");

            migrationBuilder.AddForeignKey(
                name: "FK_reservations_guests_GuestId",
                table: "reservations",
                column: "GuestId",
                principalTable: "guests",
                principalColumn: "GuestId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_reservations_guests_GuestId",
                table: "reservations");

            migrationBuilder.DropTable(
                name: "guests");

            migrationBuilder.DropIndex(
                name: "IX_reservations_GuestId",
                table: "reservations");

            migrationBuilder.RenameColumn(
                name: "GuestId",
                table: "reservations",
                newName: "Yetiskin");

            migrationBuilder.RenameColumn(
                name: "Aciklama",
                table: "reservations",
                newName: "Phone");

            migrationBuilder.AddColumn<int>(
                name: "Cocuk",
                table: "reservations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "MisafirAd",
                table: "reservations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "MisafirSoyad",
                table: "reservations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
