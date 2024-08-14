using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace StajProje.Models;

public class User 
{
    public int UserId { get; set;}
    [Required]
    public string FullName { get; set;}
   
    public string? Email { get; set;}
    [Required]
    public string Password { get; set;}
    public string Phone { get; set;}

    public List<Reservation> Reservations { get; set; } = new List<Reservation>();


}