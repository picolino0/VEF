using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Recorder.Controllers
{
    public class RecordController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}