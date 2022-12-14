using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IWeShop.Models;

namespace IWeShop.Controllers
{
    public class AspNetUserLoginsController : Controller
    {
        private Entities db = new Entities();

        // GET: AspNetUserLogins
        public ActionResult Index()
        {
            return View(db.AspNetUserLogins.ToList());
        }

        // GET: AspNetUserLogins/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUserLogin aspNetUserLogin = db.AspNetUserLogins.Find(id);
            if (aspNetUserLogin == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUserLogin);
        }

        // GET: AspNetUserLogins/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AspNetUserLogins/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LoginProvider,ProviderKey,UserId")] AspNetUserLogin aspNetUserLogin)
        {
            if (ModelState.IsValid)
            {
                db.AspNetUserLogins.Add(aspNetUserLogin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(aspNetUserLogin);
        }

        // GET: AspNetUserLogins/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUserLogin aspNetUserLogin = db.AspNetUserLogins.Find(id);
            if (aspNetUserLogin == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUserLogin);
        }

        // POST: AspNetUserLogins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LoginProvider,ProviderKey,UserId")] AspNetUserLogin aspNetUserLogin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aspNetUserLogin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(aspNetUserLogin);
        }

        // GET: AspNetUserLogins/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AspNetUserLogin aspNetUserLogin = db.AspNetUserLogins.Find(id);
            if (aspNetUserLogin == null)
            {
                return HttpNotFound();
            }
            return View(aspNetUserLogin);
        }

        // POST: AspNetUserLogins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            AspNetUserLogin aspNetUserLogin = db.AspNetUserLogins.Find(id);
            db.AspNetUserLogins.Remove(aspNetUserLogin);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
