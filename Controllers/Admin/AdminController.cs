using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FVS.Models;
using FVSDomain;

namespace FVS.Controllers.Admin
{
    public class AdminController : Controller
    {
        public Providers.FVSSqlRepositoryRepository.AdminSqlRepository repository { get; set; }

        //
        // GET: /Inventory/

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult ViewVendor()
        {
            var model = new VendorViewModel(repository, null);

            //Populate vendor list
            model.VendorList = model.GetVendorItems();


            return View(model);
        }

        [HttpGet]
        public ActionResult ViewInventory()
        {
            var model = new InventorySearchViewModel(repository, null);


            return View(model);
        }

        [HttpPost]
        public ActionResult ViewInventory(InventorySearchInputModel input, string process)
        {
            var model = new InventorySearchViewModel(repository, input);

            //which button pressed
            switch (process)
            {
                case "Search":
                    model.SearchInventoryItem(input);
                    break;
            }

            return View(model);
        }

        [HttpGet]
        public ActionResult AddInventory()
        {
            var model = new InventoryViewModel(repository, null);

            //get list of dealers to populate DDL.
            Domain.Dealer dealerFilter = new Domain.Dealer();
            model.DealerList = model.GetDealerList(dealerFilter);

            return View(model);
        }

        [HttpPost]
        public ActionResult AddInventory(InventoryInputModel input, string process)
        {
            var model = new InventoryViewModel(repository, input);

            //get list of dealers to populate DDL.
            Domain.Dealer dealerFilter = new Domain.Dealer();
            model.DealerList = model.GetDealerList(dealerFilter);

            //which button pressed
            switch (process)
            {
                case "Save":
                    if (model.ValidateAddInventory(input))
                    {
                        model.SaveInventoryItem(input);
                    }
                    else
                    {
                        //Failed pass validation 
                    }
                    break;
                case "Clear":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;

            }

            return View(model);
        }

        [HttpGet]
        public ActionResult EditInventory(int? InventoryID)
        {
            //new model
            var model = new InventoryViewModel(repository, null);

            //new filter
            Domain.Inventory inventory = new Domain.Inventory();
            inventory.InventoryID = InventoryID;

            //populate object
            inventory = model.GetInventoryItem(inventory).SingleOrDefault();

            //case
            InventoryInputModel input = new InventoryInputModel();
            input.City = inventory.City;
            input.State = inventory.State;
            input.Cost = inventory.Cost;
            input.Drivetrain = inventory.Drivetrain;
            input.ExteriorColor = inventory.ExteriorColor;
            input.Fuel = inventory.Fuel;
            input.InventoryID = inventory.InventoryID;
            input.IsActive = inventory.IsActive;
            input.Make = inventory.Make;
            input.Model = inventory.Model;
            input.StockNumber = inventory.StockNumber;
            input.Style = inventory.Style;
            input.Transmission = inventory.Transmission;
            input.VIN = inventory.VIN;
            input.Year = inventory.Year;

            //set input 
            model.Input = input;


            //get list of dealers to populate DDL.
            Domain.Dealer dealerFilter = new Domain.Dealer();
            model.DealerList = model.GetDealerList(dealerFilter);

            return View(model);
        }

        [HttpPost]
        public ActionResult EditInventory(InventoryInputModel input, string process)
        {
            //new model
            var model = new InventoryViewModel(repository, null);

            //which button pressed
            switch (process)
            {
                case "Save":
                    if (model.ValidateAddInventory(input))
                    {
                        model.SaveInventoryItem(input);
                    }
                    else
                    {
                        //Failed pass validation 
                    }
                    break;
                case "Clear":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;

            }

            //Saved, probably go back to inventory grid view? Maybe go back to inventory search view with search crit as params.
            return View(model);
        }

        [HttpGet]
        public ActionResult AddDealer()
        {
            var model = new DealerViewModel(repository, null);

            return View(model);
        }

        [HttpPost]
        public ActionResult AddDealer(DealerInputModel input, string process)
        {
            var model = new DealerViewModel(repository, input);

            //which button pressed
            switch (process)
            {
                case "Save":
                    if (model.ValidateAddDealer(input))
                    {
                        model.SaveDealerItem(input);
                    }
                    else
                    {
                        //Failed pass validation 
                    }
                    break;
                case "Clear":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;

            }

            return View(model);
        }

        [HttpGet]
        public ActionResult AddVendor()
        {
            var model = new VendorViewModel(repository, null);

            return View(model);
        }

        [HttpPost]
        public ActionResult AddVendor(VendorInputModel input, string process)
        {
            var model = new VendorViewModel(repository, input);

            //which button pressed
            switch (process)
            {
                case "Save":
                    if (model.ValidateAddVendor(input))
                    {
                        model.SaveVendorItem(input);
                    }
                    else
                    {
                        //Failed pass validation 
                    }
                    break;
                case "Clear":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;

            }

            return RedirectToAction("VendorCreated", new { VendorID = model.Input.VendorID });
        }

        [HttpGet]
        public ActionResult VendorCreated(int? VendorID)
        {
            var model = new VendorViewModel(repository, null);

            Domain.Vendor vendor = new Domain.Vendor();

            //Get Vendor By Vendor ID
            
                vendor = model.GetVendorByID((int)VendorID);
                model.Address1 = vendor.Address1;
                model.Address2 = vendor.Address2;
                model.Fax = vendor.Fax;
                model.Region = vendor.Region;
                model.VendorID = vendor.VendorID;
                model.VendorName = vendor.VendorName;
                model.VendorNumber = vendor.VendorNumber;
            

            return View(model);
        }

        [HttpGet]
        public ActionResult BulkAddInventory()
        {
            //new model
            BulkInventoryViewModel model = new BulkInventoryViewModel(repository, null);

            return View(model);
        }

        [HttpPost]
        public ActionResult BulkAddInventory(HttpPostedFileBase file, string process, BulkInventoryInputModel input)
        {
            //new guid.
            Guid id = Guid.NewGuid();

            //clean the guid of dashes.
            string strID = id.ToString().Replace("-", "");


            //get path.
            string path = System.IO.Path.Combine(Server.MapPath("~/App_Data/Uploads"), System.IO.Path.GetFileName(file.FileName));

            //split path
            int lastPeriod = path.LastIndexOf('.');
            string prefix = path.Substring(0, lastPeriod);
            string suffix = path.Substring(lastPeriod, path.Count() - prefix.Count());


            //rejoin
            System.Text.StringBuilder completePath = new System.Text.StringBuilder();
            completePath.Append(prefix);
            completePath.Append(strID);
            completePath.Append(suffix);

            file.SaveAs(completePath.ToString());

            //process excel list
            List<Domain.Inventory> saveList = FVSDomain.Util.ExcelUtil.Parse(completePath.ToString(), input.VendorNumber );

            BulkInventoryViewModel model = new BulkInventoryViewModel(repository, input);

            foreach (var item in saveList)
            {
                InventoryInputModel newInv = new InventoryInputModel();
                newInv.VendorID = item.VendorID;
                newInv.Cost = item.Cost;
                newInv.City = item.City;
                newInv.Trim = item.Trim;
                newInv.State = item.State;
                newInv.Drivetrain = item.Drivetrain;
                newInv.ExteriorColor = item.ExteriorColor;
                newInv.Fuel = item.Fuel;
                newInv.InventoryID = item.InventoryID;
                newInv.IsActive = item.IsActive;
                newInv.Make = item.Make;
                newInv.Model = item.Model;
                newInv.StockNumber = item.StockNumber;
                newInv.Style = item.Style;
                newInv.Transmission = item.Transmission;
                newInv.VIN = item.VIN;
                newInv.Year = item.Year;
                newInv.Mileage = item.Mileage;
                newInv.LastUpdatedByID = 1;

                model.Input.Inventory.Add(newInv);
            }


            //which button pressed
            switch (process)
            {
                case "Upload Inventory":
                    //Before you upload the latest list, delete all of the old entries for a given Vendor number.
                    model.DeleteInventoryItem(model.Input.VendorNumber);
                    model.SaveInventoryItem(model.Input.Inventory);
                    break;
                case "Clear":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;
            }

            return View(model);
        }

        [HttpGet]
        public ActionResult LogOn()
        {
            AccountViewModel model = new AccountViewModel(repository, null);
            return View(model);
        }

        [HttpPost]
        public ActionResult LogOn(AccountInputModel input, string process)
        {

            AccountViewModel model = new AccountViewModel(repository, input);

            //which button pressed
            switch (process)
            {
                case "LogIn":
                    //TODO: Save Session, Move to Admin Dashboard
                    Session["Key"] = input.AccountID; //Put value into session
                    return RedirectToAction("AdminDashboard");
                case "Register":
                    //TODO: Clear everything in inputmodel.
                    break;
                case "Cancel":
                    //TODO: Cancel and go some where.
                    break;

            }

            return View(model);
        }

        [HttpGet]
        public ActionResult AdminDashboard()
        {

            AdminDashboardViewModel model = new AdminDashboardViewModel();

            return View(model);
        }

        [HttpGet]
        public ActionResult Register()
        {

            AccountViewModel model = new AccountViewModel(repository, null);
            return View(model);
        }

        /// <summary>
        /// Post action of the register view. Validates user input and creates a new account if needed.
        /// </summary>
        /// <param name="input">input passed from view</param>
        /// <param name="process">comes from the buttons on the view</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Register(AccountInputModel input, string process)
        {
            //Model with input from View.
            AccountViewModel model = new AccountViewModel(repository, input);

            //what button pressed?
            switch (process)
            {
                case "Register":
                    if (input.Password != input.RepeatPassword)
                    {
                        model.ErrorList.Add("Passwords do not match.");
                        model.Input.Password = "";
                        model.Input.RepeatPassword = "";
                    }
                    if (model.Input.Password.Length <= 5 || model.Input.Password.Length >= 13)
                    {
                        model.ErrorList.Add("Password must be a min of 6 characters and a max of 12 characters");
                    }
                    if (model.IsUsernameInUse(model.Input.UserName))
                    {
                        model.ErrorList.Add(String.Format("The Username: {0} is already in use", model.Input.UserName));
                    }

                    if (model.Input.UserName.Contains(" "))
                    {
                        model.ErrorList.Add("The Username cannot contain spaces");
                    }

                    if (input.IsUber == false)
                    {
                        model.ErrorList.Add("Only Uber Admin accounts are available at this time.");
                    }

                    if (model.ErrorList.Count > 0)
                    {
                        return View(model);
                    }
                    else
                    {
                        Domain.Account account = new Domain.Account();
                        account.AccountTypeID = 1;
                        account.UserName = model.Input.UserName;
                        account.Password = model.Input.Password;

                        // Save Account
                        if (model.CreateAccount(account))
                        {
                            //Success, Return 'account created' action.
                            return RedirectToAction("AccountCreated", new { sessionID = Guid.NewGuid() });
                        }
                        else
                        {
                            //fail
                            model.ErrorList.Add("Unable to create new account for User: " + model.Input.UserName);
                        }
                    }
                    break;
                case "Cancel":
                    //TODO: Clear everything in inputmodel.
                    break;

            }

            return View(model);


        }

        [HttpGet]
        public ActionResult AccountCreated(Guid sessionID)
        {
            AccountCreatedViewModel model = new AccountCreatedViewModel();
            model.SessionID = sessionID;
            return View(model);
        }


    }
}
