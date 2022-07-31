using IWeShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IWeShop.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductController : Controller
    {
        private Entities db = new Entities();
        #region Product Category
        public ActionResult Category_List()
        {
            var result = db.Product_Category_Master.ToList();
            return View(result);
        }

        #region Create/Update
        public ActionResult Category_Add()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Category_Add([Bind(Include = "CategoryID,CategoryName")] Product_Category_Master categoryMaster)
        {
            if (ModelState.IsValid)
            {

                db.Product_Category_Master.Add(categoryMaster);
                db.SaveChanges();

                return RedirectToAction("Category_List");
            }

            return View(categoryMaster);
        }

        public ActionResult Category_Edit(int id)
        {
            Product_Category_Master categoryMaster = db.Product_Category_Master.Find(id);
            return View(categoryMaster);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Category_Edit(Product_Category_Master categoryMaster)
        {
            if (ModelState.IsValid)
            {
                Product_Category_Master _CategoryMaster = db.Product_Category_Master.Find(categoryMaster.CategoryID);

                _CategoryMaster.CategoryName = categoryMaster.CategoryName;
                db.SaveChanges();

                return RedirectToAction("Category_List");
            }

            return View(categoryMaster);
        }
        #endregion
        #endregion

        #region Products

        public ActionResult Product_List(byte id)
        {
            ViewBag.InCategoryID = id;
            var result = db.Product_List(id).ToList();
            return View(result);
        }
        #region Create/Update
        public ActionResult Product_Add(byte id)
        {
            ViewBag.InCategoryID = id;
            ViewBag.CategoryID = new SelectList(db.Product_Category_Master, "CategoryID", "CategoryName", id);
            return View();
        }

        public ActionResult Product_Edit(int id)
        {
            var Product = db.Product_Master.Find(id);
            if (Product != null)
            {
                ViewBag.InProductID = id;
                ViewBag.InCategoryID = Product.CategoryID;
                ViewBag.CategoryID = new SelectList(db.Product_Category_Master, "CategoryID", "CategoryName", Product.CategoryID);

                ViewBag.Product_Master = db.Product_Master.Where(p => p.ProductID == id).ToList();

                return View();
            }
            else
            {
                return RedirectToAction("Category_List");
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Product_Add_Edit(Product_Master product)
        {
            if (product.ProductID == 0)
            {
                Product_Master _Master = new Product_Master();
                _Master.CategoryID = product.CategoryID;
                _Master.ProductName = product.ProductName;
                _Master.ProductDesc = product.ProductDesc;
                _Master.Price = product.Price;
                _Master.Discount = product.Discount;
                _Master.IsActive = false;
                db.Product_Master.Add(_Master);
                db.SaveChanges();

                TempData["success"] = "Product added successfully";
                string CategoryName = db.Product_Category_Master.Where(c => c.CategoryID == product.CategoryID).Select(c=>c.CategoryName).FirstOrDefault();

                return RedirectToAction("Product_List", new { id = product.CategoryID, Category = CategoryName });
            }
            else
            {
                Product_Master _Master = db.Product_Master.Find(product.ProductID);
                _Master.CategoryID = product.CategoryID;
                _Master.ProductName = product.ProductName;
                _Master.ProductDesc = product.ProductDesc;
                _Master.Price = product.Price;
                _Master.Discount = product.Discount;
                db.SaveChanges();
    
                TempData["success"] = "Product is updated successfully";
                string CategoryName = db.Product_Category_Master.Where(c => c.CategoryID == product.CategoryID).Select(c => c.CategoryName).FirstOrDefault();
                return RedirectToAction("Product_List", new { id = product.CategoryID, Category = CategoryName });
            }

        }


        public ActionResult Product_Image_List(int ProductID)
        {
            var items = db.Product_Image.Where(p => p.ProductID == ProductID).ToList();
            return View(items);
        }

        [HttpPost]
        public ActionResult Product_Image_Add(int ProductID, string image_url)
        {
            if ((image_url ?? "").Length != 0)
            {
                Product_Image _Image = new Product_Image();
                _Image.ProductID = ProductID;
                _Image.ImagePath = image_url.Replace("|", "");
                db.Product_Image.Add(_Image);
                db.SaveChanges();
            }

            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Product_Image_Delete(int ImageID)
        {
                Product_Image _Image = db.Product_Image.Find(ImageID);
                db.Product_Image.Remove(_Image);
                db.SaveChanges();

            return Json(true, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Product_Mark_IsDefault(int ImageID, bool MarkAs)
        {
            Product_Image _Master = db.Product_Image.Find(ImageID);
            _Master.IsDefault = MarkAs;
            db.SaveChanges();

            return Json(true, JsonRequestBehavior.AllowGet);
        }
        #endregion


        public ActionResult Product_Mark_IsActive(int ProductID, bool MarkAs)
        {
            Product_Master _Master = db.Product_Master.Find(ProductID);
            _Master.IsActive = MarkAs;
            db.SaveChanges();

            return Json(true, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}