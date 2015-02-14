using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FVS.Models;
using FVSDomain;

namespace FVS.Controllers.Account
{
    public class LogOnController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LogOn()
        {

            return View();
        }

    }
}
