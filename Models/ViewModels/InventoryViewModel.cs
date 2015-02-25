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

    public class InventoryViewModel
    {
        public InventoryInputModel Input { get; set; }
        public List<Inventory> InventoryList { get; set; }
        public List<Dealer> DealerList { get; set; }
        public int InventoryID { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string StockNumber { get; set; }
        public string VIN { get; set; }
        public int Year { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string Style { get; set; }
        public string Fuel { get; set; }
        public string Transmission { get; set; }
        public string Drivetrain { get; set; }
        public string ExteriorColor { get; set; }
        public int Mileage { get; set; }
        public int MileageRangeBottom { get; set; }
        public int MileageRangeTOp { get; set; }
        public decimal Cost { get; set; }
        public int LastUpdatedByID { get; set; }
        public bool IsActive { get; set; }

        public List<string> ErrorList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public InventoryViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, InventoryInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            //Set Input.
            Input = input;

            ErrorList = new List<string>();
            InventoryList = new List<Inventory>();
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        /// <summary>
        /// Saves or updates one or more Inventory items. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void SaveInventoryItem(InventoryInputModel inputModel)
        {
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            AdminRepository.SaveInventoryItem(inputModel, null);
        }

        /// <summary>
        /// Gets one or more inventory items based on the filter supplied. 
        /// </summary>
        /// <param name="filter"></param>
        public List<Inventory> GetInventoryItem(Inventory filter)
        {
            List<Inventory> result = new List<Inventory>();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetInventoryItems(filter);
            return result;

        }

        /// <summary>
        /// Used to validate the inventory object, before it is saved.
        /// </summary>
        public bool ValidateAddInventory(InventoryInputModel inputModel)
        {
            bool result = false;

            if (String.IsNullOrWhiteSpace(inputModel.StockNumber))
                ErrorList.Add("Stock Number Required.");
            if (string.IsNullOrWhiteSpace(inputModel.VIN))
                ErrorList.Add("VIN Required.");

            if (ErrorList.Count == 0)
            {
                result = true;
            }


            //TODO: Complete list of Validations.

            return result;
        }

        public List<Dealer> GetDealerList(Dealer filter)
        {
            List<Dealer> result = new List<Dealer>();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetDealerItems(filter);
            return result;
        }
    }
}
