namespace StajProje.Models;

public class Room
{
    public int RoomId { get; set; }
    
    public int Capacity { get; set; }
    public int mKare { get; set; }
    public decimal PricePerNight { get; set; }
    public bool IsAvailable { get; set; }
    public List<Reservation> Reservations { get; set; } = new List<Reservation>();
}
