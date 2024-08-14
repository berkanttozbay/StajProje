using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MUDEK.Data;
using Newtonsoft.Json;
using StajProje.Models;
using StajProje.Services;

namespace StajProje.Controllers;


public class HomeController : Controller
{
    private readonly OtelDbContext _context;
    private readonly TokenService _tokenService;


    
    public HomeController(OtelDbContext context,TokenService _tokenService)
    {
        _context = context;
        _tokenService = _tokenService;
    }
    public IActionResult Index()
    {
        return View();
    }

    

    public IActionResult Register()
    {

        return View();
    }

    
    [HttpPost]
    public IActionResult Register(User user)
    {
        User user1 = new(){
            FullName = user.FullName,
            Email = user.Email,
            Password = user.Password,
            Phone = user.Phone
        
        };

        _context.users.Add(user1);
        _context.SaveChanges();
        return View();
    }
    public IActionResult Login()
    {
        return View();
    }   

    [HttpPost]
    public IActionResult Login(User user)
    {
        var userCheck = _context.users.FirstOrDefault(x => x.Email == user.Email && x.Password == user.Password);
        
        
        if (userCheck != null)
        {
            HttpContext.Session.SetInt32("UserId", userCheck.UserId);
            HttpContext.Session.SetString("UserEmail", userCheck.Email);

            if (userCheck.UserId == 2006 )
            {
            

                return RedirectToAction("Index","Admin");
            }
            return RedirectToAction("Index");
        }
        
        
        else
        {
            ModelState.AddModelError(string.Empty, "Kullanıcı adı veya şifre yanlış.");
            return View();
        }
    }


    
    public IActionResult Rezervasyon()
    {

        
        var userId = HttpContext.Session.GetString("UserId");
        if (string.IsNullOrEmpty(userId))
        {
            return RedirectToAction("Login");
        }
        
        

       
        return View();
    }

    [HttpPost]
public IActionResult Rezervasyon(Guest guest, Reservation reservation)
{
    var userId = HttpContext.Session.GetInt32("UserId");

    if (userId == null || guest == null || reservation == null)
    {
        return BadRequest("Geçersiz veri");
    }
    var roomCheck = _context.rooms.FirstOrDefault(x => x.RoomId == reservation.RoomId);

    // misafir sayisi kontrolü
    if(guest.Yetiskin + guest.Cocuk > roomCheck.Capacity)
    {
        TempData["ErrorMessage"] = "Misafir sayısı oda için fazla.";
        return RedirectToAction("Rezervasyon");
    }
    // Oda için uygunluk kontrolü
    bool isAvailable = IsRoomAvailable(reservation.RoomId, reservation.CheckInDate, reservation.CheckOutDate);
    if (!isAvailable)
    {
        TempData["ErrorMessage"] = "Seçilen tarihlerde bu oda dolu. Lütfen başka bir tarih aralığı seçin.";
        return RedirectToAction("Rezervasyon");
    }

    Guest guest1 = new Guest
    {
        MisafirAd = guest.MisafirAd,
        MisafirSoyad = guest.MisafirSoyad,
        Phone = guest.Phone,
        Yetiskin = guest.Yetiskin,
        Cocuk = guest.Cocuk
    };  
    _context.guests.Add(guest1);
    _context.SaveChanges();

    Reservation reservation1 = new Reservation
    {
        CheckInDate = reservation.CheckInDate,
        CheckOutDate = reservation.CheckOutDate,
        Aciklama = reservation.Aciklama,
        RoomId = reservation.RoomId,
        UserId = (int)userId,
        GuestId = guest1.GuestId
    };

    
    if (roomCheck != null)
    {
        HttpContext.Session.SetInt32("RoomId", roomCheck.RoomId);
    }

    _context.reservations.Add(reservation1);
    _context.SaveChanges();

    return RedirectToAction("DenemeCard", "Payments");
} 
public bool IsRoomAvailable(int roomId, DateTime checkInDate, DateTime checkOutDate)
{
    var existingReservation = _context.reservations
        .Where(r => r.RoomId == roomId &&
                    ((r.CheckInDate <= checkOutDate && r.CheckOutDate >= checkInDate) ||
                     (r.CheckInDate >= checkInDate && r.CheckInDate <= checkOutDate)))
        .FirstOrDefault();

    return existingReservation == null;
}


    

    public IActionResult Logout()
    {
        HttpContext.Session.Clear();
        return RedirectToAction("Login");
    }
    
}
