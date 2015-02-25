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

    public class InventorySearchViewModel
    {
        public InventorySearchInputModel Input { get; set; }
        public List<Inventory> InventoryList{get;set;}

        public List<string> MessageList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public InventorySearchViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, InventorySearchInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            if (InventoryList == null)
            {
                InventoryList = new List<Inventory>();
            }

            Input = input;



            MessageList = new List<string>();
            
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        /// <summary>
        /// Saves or updates one or more Inventory items. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void SearchInventoryItem(InventorySearchInputModel input)
        {
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();

            InventorySearch search = new InventorySearch();
            search.Vendor = input.Vendor;
            search.StockNumber = input.StockNumber;
            search.State = input.State;
            search.Style = input.Style;
            search.VIN = input.VIN;
            search.Year = input.Year;

            InventoryList = AdminRepository.SearchInventoryItems(search);
        }

    }
}
