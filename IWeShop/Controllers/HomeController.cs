using IWeShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IWeShop.Controllers
{
    public class HomeController : Controller
    {
        private Entities db = new Entities();
        public ActionResult Index()
        {
            ViewBag.ProductList = db.Product_List(0).Where(p => p.IsActive == true).ToList();
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }

        public void LoadMenu()
        {
            Session["Categories"] = db.Product_Category_Master.ToList();
            Session["Products"] = db.Product_Master.Where(p=>p.IsActive == true).ToList();
        }
    }
}