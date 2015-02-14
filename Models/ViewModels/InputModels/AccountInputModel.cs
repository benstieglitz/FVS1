using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;

namespace FVS.Models
{

    public class AccountInputModel : Domain.Account
    {
        public string RepeatPassword { get; set; }
        public bool IsUber { get; set; }
    }
}
