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

    public class DealerCreatedViewModel : Domain.Dealer
    {
        public string DealerName{get;set;}
        public int? DealerID{get;set;}

        public DealerCreatedViewModel(string dealerName, int? dealerID)
        {
            DealerName = dealerName;
            DealerID = dealerID;
        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

    }
}
