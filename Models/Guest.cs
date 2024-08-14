namespace StajProje.Models;

public class Guest
{
    public int GuestId { get; set; }
    public string MisafirAd { get; set; }
    public string MisafirSoyad { get; set; }
    public string Phone {get; set; }
    public int Yetiskin { get; set; }
    public int Cocuk {get; set; }

    public List<Reservation> Reservations { get; set; } = new List<Reservation>();
}