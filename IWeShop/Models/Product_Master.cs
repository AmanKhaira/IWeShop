//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IWeShop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Master
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product_Master()
        {
            this.Product_Image = new HashSet<Product_Image>();
        }
    
        public int ProductID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public string ProductName { get; set; }
        public string ProductDesc { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public bool IsActive { get; set; }
    
        public virtual Product_Category_Master Product_Category_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product_Image> Product_Image { get; set; }
    }
}
