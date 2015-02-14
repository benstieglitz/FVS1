using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using FVS.Domain;
using Providers;

namespace FVS.Models
{

    public class BulkInventoryViewModel
    {
        public BulkInventoryInputModel Input { get; set; }
        public bool OverwriteExisting{get;set;}
        public bool UseStockPhoto{get;set;}
        public int LastUpdatedByID { get; set; }
        public int? VendorID { get; set; }

        public List<string> ErrorList { get; set; }
        public List<string> SuccessList { get; set; }
        public List<Vendor> VendorList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public BulkInventoryViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, BulkInventoryInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            //Set Input.
            if (input == null)
            {
                input = new BulkInventoryInputModel();
            }
            Input = input;

            ErrorList = new List<string>();
            SuccessList = new List<string>();
            VendorList = new List<Vendor>();
            
            //populate list
            GetVendorItems();

            
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        /// <summary>
        /// Saves or updates one or more Inventory items. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void SaveInventoryItem(List<InventoryInputModel> inputModel)
        {
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();

            int count = 1;


            foreach (var item in inputModel)
            {
                if (item.Year != null)
                {
                    //Step 1. check to see if this Year/Make/Model already has an image in the general images table.
                    if (/*item.HasImage*/true)
                    {
                        //Set the main image id to the image
                    }

                    //Step 2. 
                    AdminRepository.SaveInventoryItem(item, count);
                    count++;

                    if (count > 99999)
                    {
                        throw new System.InvalidOperationException();
                    }
                }
            }

            this.SuccessList.Add(String.Format("{0} new inventory items have been saved.", count));
        }

        /// <summary>
        /// Deletes old inventory items for a given Vendor number. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void DeleteInventoryItem(string VendorNumber)
        {
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();

            AdminRepository.DeleteInventoryItem(VendorNumber);

            this.SuccessList.Add(String.Format("Old inventory items have been purged."));
        }
    
        /// <summary>
        /// Returns a list of the current vendors. 
        /// </summary>
        public void GetVendorItems()
        {
            if (VendorList == null)
            {
                VendorList = new List<Vendor>();
            }

            if (AdminRepository == null)
            {
                AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            }

            //Get the list from DB.
            VendorList = AdminRepository.GetVendorItems();
                
        }

    }
}
