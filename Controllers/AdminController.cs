using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MUDEK.Data;
using StajProje.Models;
using StajProje.Services;

namespace StajProje.Controllers;

public class AdminController : Controller
{
    private readonly OtelDbContext _context;
    
    public AdminController(OtelDbContext context)

    {   
        _context = context;
        
    }
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Profil()
    {
        return View();
    }
    public IActionResult Odalar()
    {
        return View();
    }

    [HttpGet]
    public JsonResult GetRoomDetails(int id)
    {
        var room = _context.rooms.FirstOrDefault(r => r.RoomId == id);
        if (room == null)
        {
            return Json(new { error = "Oda bulunamadı" });
        }
        return Json(room);
    }
    
    [HttpPost]
    public IActionResult Guncelle(Room room)
    {
        if (!ModelState.IsValid)
        {
            return View(room);
        }

        var existingRoom = _context.rooms.FirstOrDefault(r => r.RoomId == room.RoomId);
        if (existingRoom == null)
        {
            return NotFound();
        }

        existingRoom.Capacity = room.Capacity;
        existingRoom.mKare = room.mKare;
        existingRoom.PricePerNight = room.PricePerNight;

        _context.rooms.Update(existingRoom);
        _context.SaveChanges();

        return RedirectToAction("Odalar"); 
    }

    [HttpPost]
    public IActionResult Odalar(Room room)
    {
        var room1 = new Room{
            Capacity = room.Capacity,
            mKare = room.mKare,
            PricePerNight = room.PricePerNight,
            IsAvailable = true,

        };
        _context.rooms.Add(room1);
        _context.SaveChanges();
        return View();
    }
    public IActionResult OdalarListele()
    {
        var odalar = _context.rooms.ToList();
        return Json(odalar);
    }
    
    public IActionResult Kullanicilar()
    {
        return View();
    }
    [HttpPost]
    public IActionResult Kullanicilar(User user)
    {
        var user1 = new User{
            FullName = user.FullName,
            Email = user.Email,
            Password = user.Password,
            Phone = user.Phone,
        };
        _context.users.Add(user1);
        _context.SaveChanges();
        return View();
    }
    [HttpPost]
    public IActionResult KullaniciGuncelle(User user)
    {
        if (!ModelState.IsValid)
        {
            return View(user);
        }

        var existingUser = _context.users.FirstOrDefault(r => r.UserId == user.UserId);
        if (existingUser == null)
        {
            return NotFound();
        }

        existingUser.FullName = user.FullName;
        existingUser.Email = user.Email;
        existingUser.Password = user.Password;
        existingUser.Phone = user.Phone;
        

        _context.users.Update(existingUser);
        _context.SaveChanges();

        return RedirectToAction("Kullanicilar","Admin");
    }
    [HttpGet]
    public JsonResult GetUserDetails(int id)
    {
        var user = _context.users.FirstOrDefault(r => r.UserId == id);
        if (user == null)
        {
            return Json(new { error = "Kullanıcı bulunamadı" });
        }
        return Json(user);
    }
    public IActionResult KullanicilarListele()
    {
        var kullanicilar = _context.users.ToList();
        return Json(kullanicilar);
    }
    public IActionResult Rezervasyonlar()
    {
        return View();
    }
    [HttpPost]
    public IActionResult Rezervasyonlar(Guest guest, Reservation rez)
    {
        
        var userId = HttpContext.Session.GetInt32("UserId");
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
        var reservation = new Reservation
        {
            CheckInDate = rez.CheckInDate,
            CheckOutDate = rez.CheckOutDate,
            Aciklama = rez.Aciklama,
            RoomId = rez.RoomId,
            UserId = (int)userId,
            GuestId = guest1.GuestId,
            // Diğer alanlar
        };

        _context.reservations.Add(reservation);
        _context.SaveChanges();

        return RedirectToAction("Rezervasyonlar","Admin"); 
    }
    
    public IActionResult RezervasyonlarListele()
    {
        var reservations = _context.reservations.ToList();
        return Json(reservations);
    }
    [HttpPost]
    public IActionResult RezGuncelle(Reservation rez,Guest guest)
    {
        var existingGuest= _context.guests.FirstOrDefault(r => r.GuestId == guest.GuestId);

        existingGuest.MisafirAd = guest.MisafirAd;
        existingGuest.MisafirSoyad = guest.MisafirSoyad;
        existingGuest.Phone = guest.Phone;
        existingGuest.Yetiskin = guest.Yetiskin;
        existingGuest.Cocuk = guest.Cocuk;

        _context.guests.Update(existingGuest);
        _context.SaveChanges();



        var userId = HttpContext.Session.GetInt32("UserId");

        var existingRez = _context.reservations.FirstOrDefault(r => r.Id == rez.Id);
        if (existingRez == null)
        {
            return NotFound();
        }

        existingRez.CheckInDate = rez.CheckInDate;
        existingRez.CheckOutDate = rez.CheckOutDate;
        existingRez.Aciklama = rez.Aciklama;
        existingRez.RoomId = rez.RoomId;
        existingRez.UserId = (int)userId;
        existingRez.GuestId = existingGuest.GuestId;
        

        _context.reservations.Update(existingRez);
        _context.SaveChanges();

        return RedirectToAction("Rezervasyonlar","Admin");
    }
    [HttpGet]
    public IActionResult GetRezDetails(int id)
    {
        var reservation = _context.reservations
            .Include(r => r.Guest) 
            .FirstOrDefault(r => r.Id == id);

        if (reservation == null)
        {
            return NotFound();
        }

        var result = new
        {
            reservation.Id,
            reservation.CheckInDate,
            reservation.CheckOutDate,
            reservation.Aciklama,
            reservation.RoomId,
            reservation.UserId,
            GuestId = reservation.Guest.GuestId,
            MisafirAd = reservation.Guest.MisafirAd,
            MisafirSoyad = reservation.Guest.MisafirSoyad,
            Phone = reservation.Guest.Phone,
            Yetiskin = reservation.Guest.Yetiskin,
            Cocuk = reservation.Guest.Cocuk
        };

        return Json(result); 
    }

     [HttpGet]
    public JsonResult GetUserCount()
    {
        var count = _context.users.Count();
        return Json(new { count });
    }

    [HttpGet]
    public JsonResult GetReservationCount()
    {
        var count = _context.reservations.Count();
        return Json(new { count });
    }

    [HttpDelete]
    public IActionResult DeleteRezervasyon(int id)
    {
        var reservation = _context.reservations.Find(id);
        if (reservation == null)
        {
            return NotFound(new { error = "Rezervasyon bulunamadı." });
        }

        _context.reservations.Remove(reservation);
        _context.SaveChanges();

        return Ok();
    }


}