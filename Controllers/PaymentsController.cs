using Iyzipay;
using Iyzipay.Model;
using Iyzipay.Request;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using MUDEK.Data;
using Newtonsoft.Json;
using StajProje.Hubs;
using StajProje.Models;



namespace StajProje.Controllers;

[Route("api/[controller]/[action]")]
[ApiController]
public class PaymentsController : Controller 
{
    private readonly OtelDbContext _context;
    private readonly IHubContext<PayHub> _hubContext;
    private readonly HomeController _homeController;


    public PaymentsController(OtelDbContext context , IHubContext<PayHub> hubContext)
    {
        _context = context;
        _hubContext = hubContext;
    }

    
    public IActionResult DenemeCard()   
    {
        
       var roomId = HttpContext.Session.GetInt32("RoomId");
       var roomCheck = _context.rooms.FirstOrDefault(x=>x.RoomId == roomId);
       var viewModel = new RoomViewModel
        {
            PricePerNight = roomCheck.PricePerNight
            
            
        };

       

    return View(viewModel);

   
        
        
    }
    [HttpPost]
    public async Task<IActionResult> Pay([FromForm] OdemeCard odemeCard)
    {
        Options options = new()
        {
            ApiKey = "sandbox-31ZtnOgYpg7NMceyAa75spZjiGvIaRIc",
            SecretKey = "uvAzcDmnyn5iycUH79MMaoeyYxH8Onzr",
            BaseUrl = "https://sandbox-api.iyzipay.com"
        };
    

    CreatePaymentRequest request = new CreatePaymentRequest();
        request.Locale = Locale.TR.ToString();
        request.ConversationId = Guid.NewGuid().ToString();

        PayHub.TransactionConnections[request.ConversationId] =  HttpContext.Connection.Id;
        Console.WriteLine($"ConversationId {request.ConversationId} sözlüğe ekleniyor.");


        request.Price = "1";
        request.PaidPrice = "1.2";
        request.Currency = Currency.TRY.ToString();
        request.Installment = 1;
        request.BasketId = "B67832";
        request.PaymentChannel = PaymentChannel.WEB.ToString();
        request.PaymentGroup = PaymentGroup.PRODUCT.ToString();
        request.CallbackUrl = "http://localhost:5245/api/Payments/PayCallBack";

        PaymentCard paymentCard = new PaymentCard();
        paymentCard.CardHolderName = odemeCard.CardFullName;
        paymentCard.CardNumber = odemeCard.CardNumber;
        paymentCard.ExpireMonth = odemeCard.ExpireMonth;
        paymentCard.ExpireYear = odemeCard.ExpireYear;
        paymentCard.Cvc = odemeCard.Cvc.ToString();
        paymentCard.RegisterCard = 0;
        request.PaymentCard = paymentCard;

        Buyer buyer = new Buyer();
        buyer.Id = "BY789";
        buyer.Name = "John";
        buyer.Surname = "Doe";
        buyer.GsmNumber = "+905350000000";
        buyer.Email = "email@email.com";
        buyer.IdentityNumber = "74300864791";
        buyer.LastLoginDate = "2015-10-05 12:43:35";
        buyer.RegistrationDate = "2013-04-21 15:12:09";
        buyer.RegistrationAddress = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
        buyer.Ip = "85.34.78.112";
        buyer.City = "Istanbul";
        buyer.Country = "Turkey";
        buyer.ZipCode = "34732";
        request.Buyer = buyer;

        Address shippingAddress = new Address();
        shippingAddress.ContactName = "Jane Doe";
        shippingAddress.City = "Istanbul";
        shippingAddress.Country = "Turkey";
        shippingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
        shippingAddress.ZipCode = "34742";
        request.ShippingAddress = shippingAddress;

        Address billingAddress = new Address();
        billingAddress.ContactName = "Jane Doe";
        billingAddress.City = "Istanbul";
        billingAddress.Country = "Turkey";
        billingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
        billingAddress.ZipCode = "34742";
        request.BillingAddress = billingAddress;

        List<BasketItem> basketItems = new List<BasketItem>();
        BasketItem firstBasketItem = new BasketItem();
        firstBasketItem.Id = "BI101";
        firstBasketItem.Name = "Binocular";
        firstBasketItem.Category1 = "Collectibles";
        firstBasketItem.Category2 = "Accessories";
        firstBasketItem.ItemType = BasketItemType.PHYSICAL.ToString();
        firstBasketItem.Price = "0.3";
        basketItems.Add(firstBasketItem);

        BasketItem secondBasketItem = new BasketItem();
        secondBasketItem.Id = "BI102";
        secondBasketItem.Name = "Game code";
        secondBasketItem.Category1 = "Game";
        secondBasketItem.Category2 = "Online Game Items";
        secondBasketItem.ItemType = BasketItemType.VIRTUAL.ToString();
        secondBasketItem.Price = "0.5";
        basketItems.Add(secondBasketItem);

        BasketItem thirdBasketItem = new BasketItem();
        thirdBasketItem.Id = "BI103";
        thirdBasketItem.Name = "Usb";
        thirdBasketItem.Category1 = "Electronics";
        thirdBasketItem.Category2 = "Usb / Cable";
        thirdBasketItem.ItemType = BasketItemType.PHYSICAL.ToString();
        thirdBasketItem.Price = "0.2";
        basketItems.Add(thirdBasketItem);
        request.BasketItems = basketItems;

        ThreedsInitialize threedsInitialize = ThreedsInitialize.Create(request, options);

        var model = new PaymentViewModel
        {
            HtmlContent = threedsInitialize.HtmlContent,
            ConversationId = request.ConversationId
        };
        
        // return Ok(new { Content = threedsInitialize.HtmlContent, ConversationId = request.ConversationId});
        return View(model);
    }

    


    [HttpPost]
    public async Task<IActionResult> PayCallBack([FromForm] IFormCollection collections)
    {
        var model = new PayCallBackViewModel{
            Status = collections["status"],
            PaymentId = collections["paymentId"],
            ConversationData = collections["conversationData"],
            ConversationId = collections["conversationId"],
            MDStatus = collections["mdStatus"]
        };
        

        if (model.Status != "success")
        {   
            
            return BadRequest("Basarisiz!");
        }
        

        if (PayHub.TransactionConnections.ContainsKey(model.ConversationId))
        {
            Console.WriteLine(PayHub.TransactionConnections[model.ConversationId]);
            await _hubContext.Clients.Client(PayHub.TransactionConnections[model.ConversationId]).SendAsync("Receive", model);
        }
        else
        {
            
            Console.WriteLine($"Key not found: {model.ConversationId}");
            
            return BadRequest("Geçersiz ConversationId");
        }

        
        return View(model);
        }


        
}



