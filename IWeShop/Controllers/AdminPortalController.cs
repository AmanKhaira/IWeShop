using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IWeShop.Controllers
{
    [Authorize(Roles ="Admin")]
    public class AdminPortalController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}