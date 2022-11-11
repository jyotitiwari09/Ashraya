using System.Web;
using System.Web.Mvc;

namespace Ashraya_MVC_Web_Technology_Project
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}