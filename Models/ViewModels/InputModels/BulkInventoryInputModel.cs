using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;

namespace FVS.Models
{

    public class BulkInventoryInputModel
    {
        public List<InventoryInputModel> Inventory { get; set; }
        public string VendorNumber{get;set;}

        public BulkInventoryInputModel()
        {
            if (Inventory == null)
            {
                Inventory = new List<InventoryInputModel>();
            }
        }
    }
}
