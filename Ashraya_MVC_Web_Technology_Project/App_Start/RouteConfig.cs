using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Ashraya_MVC_Web_Technology_Project
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            //Admin Displays and Removes Verifiation Data
            routes.MapRoute(
              "ACV",
           "Ashraya/VerficationData/{DeleteVVV}",
            new { controller = "Ashraya", action = "VerficationData", DeleteVVV = UrlParameter.Optional}
       );


            //Admin Profile Update
            routes.MapRoute(
              "FP",
           "Ashraya/AdminProfileUpdate/{AOP}/{ ANP}",
            new { controller = "Ashraya", action = "AdminProfileUpdate", AOP = UrlParameter.Optional, ANP = UrlParameter.Optional }
       );


            //Admin Remove Feedback
            routes.MapRoute(
              "AdminFeedbackRemoving",
           "Ashraya/Display_All_Feedbacks/{DeleteFeedback}",
            new { controller = "Ashraya", action = "Display_All_Feedbacks", DeleteFeedback = UrlParameter.Optional }
       );


            //Remove Feedback
            routes.MapRoute(
              "FeedbackRemoving",
           "Ashraya/FeedbackRemove/{RemoveF}",
            new { controller = "Ashraya", action = "FeedbackRemove", RemoveF = UrlParameter.Optional}
       );



            //Feedback
            routes.MapRoute(
              "FeedbackForm",
           "Ashraya/Feedback/{FullName}/{Email}/{Op}",
            new { controller = "Ashraya", action = "Feedback", FullName = UrlParameter.Optional, Email = UrlParameter.Optional, Op = UrlParameter.Optional }
       );



            //Forget Password
            routes.MapRoute(
              "PasswordNew",
           "Ashraya/ForgetPassword/{PasswordX}",
            new { controller = "Ashraya", action = "ForgetPassword", PasswordX = UrlParameter.Optional }
       );
  


            //Owner Delete
            routes.MapRoute(
              "ADO",
           "Ashraya/AdminDeleteOwner/{DeleteOwner}",
            new { controller = "Ashraya", action = "AdminDeleteOwner", DeleteOwner = UrlParameter.Optional}
       );

            //Customer Delete
            routes.MapRoute(
              "ADC",
           "Ashraya/AdminDeleteCustomer/{DeleteCustomer}",
            new { controller = "Ashraya", action = "AdminDeleteCustomer", DeleteCustomer = UrlParameter.Optional }
       );

            //Admin Login
            routes.MapRoute(
                 "Alogin",
              "Ashraya/AdminLogin/{EA}/{EP}",
               new { controller = "Ashraya", action = "AdminLogin",EA=  UrlParameter.Optional ,EP= UrlParameter.Optional }
          );

            //::Delete Booking 
            routes.MapRoute(
                    "DeleteBook",
                 "Ashraya/MyBookings/{DeleteBooking}",
                  new { controller = "Ashraya", action = "MyBookings", DeleteBooking = UrlParameter.Optional }
             );


            //::After Booking 
            routes.MapRoute(
                    "PaymentPage",
                 "Ashraya/PaymentCard/{CardName}/{CardNo}/{ExpiryMonth}/{ExpiryYear}/{CVV}",
                  new { controller = "Ashraya", action = "PaymentCard", CardName = UrlParameter.Optional, CardNo = UrlParameter.Optional, ExpiryMonth = UrlParameter.Optional, ExpiryYear = UrlParameter.Optional, CVV = UrlParameter.Optional }
             );


             //::Before Booking
            routes.MapRoute(
                    "BookPG",
                 "Ashraya/Book/{TransferX}/{CheckInDate}/{CheckOutDate}/{People}",
                  new { controller = "Ashraya", action = "Book", TransferX=UrlParameter.Optional,CheckInDate = UrlParameter.Optional, CheckOutDate = UrlParameter.Optional, People = UrlParameter.Optional }
             );


            //Display PG Owner
            routes.MapRoute(
                    " PGDEL",
                 "Ashraya/MyPGY/{pgdeleted}",
                  new { controller = "Ashraya", action = "MyPGY", pgdeleted = UrlParameter.Optional }
             );


            //Display Room Owner
            routes.MapRoute(
                    " RoomAddUD",
                 "Ashraya/MyRoomMyPGX/{PriceR}/{Option}",
                  new { controller = "Ashraya", action = "MyRoomMyPGX", PriceR = UrlParameter.Optional, Option = UrlParameter.Optional }
             );


            //Customer Profile
            routes.MapRoute(
                    "updatecustomer",
                 "Ashraya/CustomerProfile/{pass_u}/{cpass_u}/{add_u}",
                  new { controller = "Ashraya", action = "CustomerProfile", pass_u = UrlParameter.Optional, cpass_u = UrlParameter.Optional, add_u = UrlParameter.Optional }
             );

            //Display Room Owner
            routes.MapRoute(
                    "roomchangex",
                 "Ashraya/MyRoomMyPG/{TransferR}",
                  new { controller = "Ashraya", action = "MyRoomMyPG", TransferR = UrlParameter.Optional }
             );

       

            //PG Add
            routes.MapRoute(
                    "PGAdd",
                 "Ashraya/PGAdd/{PGName}/{PGLocation}/{PGZip}/{Img1P}/{Img2P}/{Img3P}",
                  new { controller = "Ashraya", action = "PGAdd", PGName = UrlParameter.Optional, PGLocation = UrlParameter.Optional, PGZip = UrlParameter.Optional, Img1P = UrlParameter.Optional, Img2P = UrlParameter.Optional, Img3P = UrlParameter.Optional }
             );



            //Room Add
            routes.MapRoute(
                    "RoomAdd",
                 "Ashraya/RoomAdd/{Price}/{RoomType}/{Img1}/{Img2}/{Img3}/{Television}/{Refridgerator}/{AC}/{select}",
                  new { controller = "Ashraya", action = "RoomAdd", Price = UrlParameter.Optional, RoomType = UrlParameter.Optional, Img1 = UrlParameter.Optional, Img2 = UrlParameter.Optional, Img3 = UrlParameter.Optional, Img4 = UrlParameter.Optional, Television = UrlParameter.Optional, Refridgerator = UrlParameter.Optional, AC = UrlParameter.Optional, select = UrlParameter.Optional }
             );


          


           /* //Dashboard Customer
            routes.MapRoute(
                    "RoomChoose",
                 "Ashraya/RoomBookPage/{Transfer}",
                  new { controller = "Ashraya", action = "RoomBookPage", Transfer = UrlParameter.Optional }
             );
            */

            //Dashboard Customer
            routes.MapRoute(
                    "DashboardCustomers",
                 "Ashraya/Dashboard_Customer/{Transfer}",
                  new { controller = "Ashraya", action = "Dashboard_Customer", Transfer = UrlParameter.Optional }
             );


            //Calling Code Verification
            routes.MapRoute(
                     "Codes",
                  "Ashraya/Codex/{OTPX}",
                   new { controller = "Ashraya", action = "Codex", OTPX=UrlParameter.Optional}
              );



            //Calling  Registration Verification
            routes.MapRoute(
                     "Verification_Register",
                  "Ashraya/Verifications/{fileupload}/{Email_Verify}",
                   new { controller = "Ashraya", action = "Verifications", fileupload = UrlParameter.Optional,Email_Verify = UrlParameter.Optional }
              );



            //Calling Registration
            routes.MapRoute(
                      "Register",
                   "Ashraya/Registrations/{FirstName}/{LastName}/{Phone}/{Email}/{gender}/{Address}/{DOB}/{Username}/{Password}/{Role}",
                    new { controller = "Ashraya", action = "Registrations", FirstName = UrlParameter.Optional, LastName = UrlParameter.Optional, Phone = UrlParameter.Optional, Email = UrlParameter.Optional, gender = UrlParameter.Optional, Address = UrlParameter.Optional, DOB = UrlParameter.Optional, Username = UrlParameter.Optional, Password = UrlParameter.Optional}
               );
            //Calling Contact Us
            routes.MapRoute(
                         "Contact",
                "Ashraya/Contact/{Name}/{Email}/{Msg}",
                  new { controller = "Ashraya", action = "Contact",   Name = UrlParameter.Optional, Email = UrlParameter.Optional, Msg = UrlParameter.Optional }
               );
         
            //Calling Login Page
           routes.MapRoute(
                    "logins",
                   "Ashraya/Signin/{Email_S}/{Password_S}",
                  new { controller = "Ashraya", action = "Signin",  Email_S = UrlParameter.Optional, Password_S = UrlParameter.Optional }
               );

         //Calling HomePage
         routes.MapRoute(
             name: "Default",
             url: "{controller}/{action}",
             defaults: new { controller = "Ashraya", action = "Index", id = UrlParameter.Optional }
         );


        }
    }
}