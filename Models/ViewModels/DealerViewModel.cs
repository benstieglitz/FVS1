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

    public class DealerViewModel : Domain.Dealer
    {
        public DealerInputModel Input { get; set; }
        public List<Dealer> DealerList {get;set;}

        public List<string> ErrorList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public DealerViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, DealerInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            //Set Input.
            Input = input;

            ErrorList = new List<string>();
            DealerList = new List<Dealer>();
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        /// <summary>
        /// Saves or updates one or more Dealer items. 
        /// </summary>
        /// <param name="inputModel"></param>
        public void SaveDealerItem(DealerInputModel inputModel)
        {
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            AdminRepository.SaveDealerItem(inputModel);
        }

        /// <summary>
        /// Gets one or more dealer items based on the filter supplied. 
        /// </summary>
        /// <param name="filter"></param>
        public List<Dealer> GetDealerItems(Dealer filter)
        {
            List<Dealer> result = new List<Dealer>();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetDealerItems(filter);
            return result;

        }

        /// <summary>
        /// Used to validate the dealer object, before it is saved.
        /// </summary>
        public bool ValidateAddDealer(DealerInputModel inputModel)
        {
            bool result = false;

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


            //TODO: Complete list of Validations.

            return result;
        }
    }
}
