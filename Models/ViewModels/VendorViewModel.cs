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

    public class VendorViewModel : Domain.Vendor
    {
        public VendorInputModel Input { get; set; }
        public List<Vendor> VendorList {get;set;}

        public List<string> ErrorList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public VendorViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, VendorInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            //Set Input.
            Input = input;

            ErrorList = new List<string>();
            VendorList = new List<Vendor>();
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        /// <summary>
        /// Saves or updates Vendor items. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void SaveVendorItem(VendorInputModel inputModel)
        {

            //if the vendor number is null, this is a new item, generate a new number here.
            if (inputModel.VendorID == null && String.IsNullOrEmpty(inputModel.VendorNumber))
            {
                inputModel.VendorNumber = GenerateVendorNumber().ToString();
            }

            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            AdminRepository.SaveVendorItem(inputModel);
        }

        /// <summary>
        /// Gets one or more dealer items based on the filter supplied. 
        /// </summary>
        /// <param name="filter"></param>
        public List<Vendor> GetVendorItems()
        {
            List<Vendor> result = new List<Vendor>();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetVendorItems();
            return result;

        }

        public Vendor GetVendorByID(int ID)
        {
            Vendor result = new Vendor();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetVendorByID(ID);
            return result;
        }

        /// <summary>
        /// Used to validate the vendor object, before it is saved.
        /// </summary>
        public bool ValidateAddVendor(VendorInputModel inputModel)
        {
            bool result = false;

            //TODO: Complete list of Validations.
            //if (inputModel.DealerID == 0)
            //    ErrorList.Add("Dealer Required.");
            //if (String.IsNullOrWhiteSpace(inputModel.StockNumber))
            //    ErrorList.Add("Stock Number Required.");
            //if (string.IsNullOrWhiteSpace(inputModel.VIN))
            //    ErrorList.Add("VIN Required.");

            if (ErrorList.Count == 0)
            {
                result = true;
            }

            return result;
        }

        private int GenerateVendorNumber()
        {
            //TODO: The purpose of generate vendor number is to get a unique number that doesn't already exist and attach it to
            //      a vendor. Right now we are just using rand, but to be 100% complete, it would have to do a number check against the
            //      DB to make sure the number already isn't in use.
            Random r = new Random();
            return r.Next(10000, 99999);
        }
    }
}
