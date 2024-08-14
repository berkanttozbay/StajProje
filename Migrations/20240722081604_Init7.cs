using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace StajProje.Migrations
{
    /// <inheritdoc />
    public partial class Init7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Name",
                table: "rooms");

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

            migrationBuilder.AddColumn<string>(
                name: "Phone",
                table: "reservations",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "Yetiskin",
                table: "reservations",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
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

            migrationBuilder.DropColumn(
                name: "Phone",
                table: "reservations");

            migrationBuilder.DropColumn(
                name: "Yetiskin",
                table: "reservations");

            migrationBuilder.AddColumn<string>(
                name: "Name",
                table: "rooms",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
