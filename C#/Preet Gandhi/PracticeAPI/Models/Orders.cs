using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace PracticeAPI.Models
{
    public partial class Orders
    {
        public Orders()
        {
            ProductOrders = new HashSet<ProductOrders>();
        }

        public int Id { get; set; }
        public DateTime OrderPlaced { get; set; }
        public DateTime? OrderFulfilled { get; set; }
        public int CustomerId { get; set; }

        public virtual Customers Customer { get; set; }
        public virtual ICollection<ProductOrders> ProductOrders { get; set; }
    }
}
