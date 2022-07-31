using IWeShop.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IWeShop.Controllers
{
    [Authorize(Roles = "Customer")]
    public class CustomerAccountController : Controller
    {
        private Entities db = new Entities();
        public ActionResult MyAccount()
        {
            string UserName = User.Identity.GetUserName();
            var CustomerInfo = db.Customers.Where(c => c.Email == UserName).SingleOrDefault();
            return View(CustomerInfo);
        }
    }
}