namespace MUDEK.Data;
using Microsoft.EntityFrameworkCore;
using StajProje.Models;

public class OtelDbContext : DbContext
{
    public OtelDbContext(DbContextOptions options) : base(options)
    {
        
    }
    public DbSet<Admin> admins { get; set; }
    public DbSet<Reservation> reservations{ get; set; }
    public DbSet<Room> rooms{ get; set; }
    public DbSet<User> users{ get; set; }
    public DbSet<Guest> guests{ get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
        
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Room>()
            .HasMany(r => r.Reservations)
            .WithOne(r => r.Room)
            .HasForeignKey(r => r.RoomId);

        modelBuilder.Entity<User>()
            .HasMany(r => r.Reservations)
            .WithOne(r => r.User)
            .HasForeignKey(r => r.UserId);
        modelBuilder.Entity<Guest>()
            .HasMany(r => r.Reservations)
            .WithOne(r => r.Guest)
            .HasForeignKey(r => r.GuestId);

    }
}