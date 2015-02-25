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

    public class AccountViewModel : Domain.Account
    {

        public AccountInputModel Input { get; set; }
        public List<Domain.Account> AccountList { get; set; }
        public List<Domain.Dealer> DealerList { get; set; }
        public List<string> ErrorList { get; set; }

        /// <summary>
        /// Constructor
        /// </summary>
        public AccountViewModel(Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository, AccountInputModel input)
        {

            //Set datacontext
            AdminRepository = repository;

            //Set Input.
            Input = input;

            //Set Dealer List data
            DealerList = new List<Dealer>();
            Dealer filter = new Dealer();
            DealerList = this.GetDealerList(filter);

            //instance of ErrorList
            ErrorList = new List<string>();

        }

        //Data Context.
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository AdminRepository { get; set; }

        public List<Dealer> GetDealerList(Dealer filter)
        {
            List<Dealer> result = new List<Dealer>();
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.GetDealerItems(filter);
            return result;
        }

        public bool IsUsernameInUse(string username)
        {
            bool result = false;
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.IsUsernameInUse(username);
            return result;
        }

        public bool CreateAccount(Domain.Account account)
        {
            bool result = false;
            AdminRepository = new Providers.FVSSqlRepositoryRepository.AdminSqlRepository();
            result = AdminRepository.CreateAccount(account);
            return result;
        }

    }
}
