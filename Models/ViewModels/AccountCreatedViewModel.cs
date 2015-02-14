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

    public class AccountCreatedViewModel
    {
        public string UserName{get;set;}
        public Guid SessionID{get;set;}

        public AccountCreatedViewModel()
        {

        }
    }
}
