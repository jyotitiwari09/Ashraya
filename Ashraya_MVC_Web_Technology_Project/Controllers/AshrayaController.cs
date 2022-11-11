using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Diagnostics;
using System.Data;
using Ashraya_MVC_Web_Technology_Project.Models;



namespace Ashraya_MVC_Web_Technology_Project.Controllers
{

    public class AshrayaController : Controller
    {

        public static string SessionEmail;
        //
        // GET: /Homepage/

        //Navigations
        //Homepage
        public ActionResult Index()
        {
            return View("~/Views/Ashraya/Homepage/Homepage.aspx");
        }

        //About Us Page
        public ActionResult AboutUS()
        {
            return View("~/Views/Ashraya/AboutUs/AboutUs.aspx");
        }

        //Logout Works for Admin,Customer and Owner and Admin
        public ActionResult Logout()
        {
            Session["ID"] = null;
            Session["AdminID"] = null;
            return RedirectToAction("Index");
        }





        //Functionalities
        //Contact Us
        public ActionResult Contact(String Name, String Email, String Msg)
        {
            bool a = string.IsNullOrEmpty(Name), b = string.IsNullOrEmpty(Email), c = string.IsNullOrEmpty(Msg);
            if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/ContactUs/ContactPageView.aspx");
                //  return null;
            }
            else
            {
                Contacts C = new Contacts();
                C.Contactus(Name, Email, Msg);
                ViewBag.Res1 = C.Res1;
                return View("~/Views/Ashraya/ContactUs/ContactPageView.aspx");
            }
        }



        //Login for Owner and Customer
        public ActionResult Signin(String Email_S, String Password_S)
        {
            bool a = string.IsNullOrEmpty(Email_S), b = string.IsNullOrEmpty(Password_S);
            if (a == true || b == true)
            {
                return View("~/Views/Ashraya/Login/Login.aspx");
            }
            else
            {
                //Calling Model Class
                Login L = new Login();
                L.Logins(Email_S, Password_S);
                ViewBag.Msg = L.Msg;
                if (L.Msg == "Success_Customer")
                {
                    Session["ID"] = L.SessionData.ToString();
                    return RedirectToAction("Dashboard_Customer");
                }
                else if (L.Msg == "Success_Owner")
                {
                    Session["ID"] = L.SessionData.ToString();
                    return RedirectToAction("OwnerDashboard");
                }
                return View("~/Views/Ashraya/Login/Login.aspx");
            }
        }



        //Customer Feedback
        public ActionResult Feedback(String FullName, String Email, String Op)
        {
            bool a = string.IsNullOrEmpty(FullName), b = string.IsNullOrEmpty(Email), c = string.IsNullOrEmpty(Op);
              if(Session["ID"]==null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/Feedback/Feedback.aspx");
            }
            else
            {
                //Calling Model Class
                Feedback F = new Feedback();
                F.Feeds(FullName, Email, Op);
                ViewBag.Msg = F.Msg;
                return View("~/Views/Ashraya/Feedback/Feedback.aspx");
            }
        }

        //Remove Customer Feedback
        //Customer Feedback
        public ActionResult FeedbackRemove(String RemoveF)
        {
            bool b = string.IsNullOrEmpty(RemoveF);
             if(Session["ID"]==null)
            {
                return RedirectToAction("Signin");
            }
            else if (b==true)
            {
                return View("~/Views/Ashraya/Feedback/MyFeedBacks.aspx");
            }
            else
            {
                //Calling Model Class
                FeedbackRemove FR = new FeedbackRemove();
                FR.RemoveMsgs(RemoveF);
                ViewBag.Msg = FR.Msg;
                return View("~/Views/Ashraya/Feedback/MyFeedBacks.aspx");
            }
        }


        //Verification of Registrations
        public ActionResult Verifications(HttpPostedFileBase fileupload, String Email_Verify)
        {
            bool a = string.IsNullOrEmpty(Email_Verify);
            if (a == true)
            {
                return View("~/Views/Ashraya/RegistrationVerification/RegistrationVerification.aspx");
            }
            else
            {
                VerificationOfRegistration V = new VerificationOfRegistration();
                V.Verify(fileupload, Email_Verify);
                ViewBag.infox = V.infox;
                if (V.infox == "Exists")
                {
                    return View("~/Views/Ashraya/RegistrationVerification/RegistrationVerification.aspx");
                }
                else
                {
                    Session["EmailID"] = Email_Verify;
                    SessionEmail = Session["EmailID"].ToString();
                    return RedirectToAction("Codex");
                }
            }
        }


        //Code
        public ActionResult Codex(String OTPX)
        {
            bool a = string.IsNullOrEmpty(OTPX);
            if(Session["EmailID"]==null)
            {
                return RedirectToAction("Verifications");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/Code/Code.aspx");
            }
            else
            {
                Code C = new Code();
                C.OneTimePassword(OTPX, Session["EmailID"].ToString());
                ViewBag.infoz = C.infoz;
                if (ViewBag.infoz == "Fail")
                {
                    return View("~/Views/Ashraya/Code/Code.aspx");
                }
                else if (ViewBag.infoz == "Pass")
                {
                    return RedirectToAction("Registrations");
                }
                return View("~/Views/Ashraya/Code/Code.aspx");
            }
        }


        //Registration
        //[HttpGet]
        public ActionResult Registrations(String FirstName, String LastName, String Phone, String Email, String gender, String Address, String DOB, String Username, String Password, String CPassword, String Role)
        {
            bool a = string.IsNullOrEmpty(FirstName), b = string.IsNullOrEmpty(LastName), c = string.IsNullOrEmpty(Phone), d = string.IsNullOrEmpty(Email), e = string.IsNullOrEmpty(gender), f = string.IsNullOrEmpty(Address), g = string.IsNullOrEmpty(DOB), h = string.IsNullOrEmpty(Username), i = string.IsNullOrEmpty(Password),j = string.IsNullOrEmpty(CPassword) , k = string.IsNullOrEmpty(Role);
            if (Session["EmailID"] == null)
            {
                  return RedirectToAction("Verifications");
            }
            else  if (a == true || b == true || c == true || d == true || e == true || f == true || g == true || h == true || i == true || j==true || k == true)
            {
                return View("~/Views/Ashraya/Registration/Registration.aspx");
            }
            else if (Password != CPassword)
            {
                ViewBag.Response1 = "Error4";
                return View("~/Views/Ashraya/Registration/Registration.aspx");
            }
            else
            {
                //Calling Model Class
                Registration R = new Registration();
                Email = Session["EmailID"].ToString();
                ViewBag.ResponseMail = SessionEmail;
                R.Registrations(FirstName, LastName, Phone, Email, gender, Address, DOB, Username, Password,Role);
                ViewBag.Response1 = R.Response1;
                if (ViewBag.Response1 == "Error1")
                {
                    return View("~/Views/Ashraya/Registration/Registration.aspx");
                }
                else if (ViewBag.Response1 == "Error2")
                {
                    return View("~/Views/Ashraya/Registration/Registration.aspx");
                }
                else if (ViewBag.Response1 == "Error3")
                {
                    return View("~/Views/Ashraya/Registration/Registration.aspx");
                }
                else if (ViewBag.Response1 == "Error4")
                {
                    return View("~/Views/Ashraya/Registration/Registration.aspx");
                }
                else if (ViewBag.Response1 == "success")
                {
                    Response.Write("<script>alert('s');</script>");
                    return RedirectToAction("Signin");
                }
                return View("~/Views/Ashraya/Registration/Registration.aspx");
            }
        }

        //Customer Dashboard
        public ActionResult Dashboard_Customer(String Transfer)
        {

            bool a = string.IsNullOrEmpty(Transfer);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/CustomerDashboard/Dashboard_Customer.aspx");
            }
            else
            {
                CheckBook CB = new CheckBook();
                CB.CheckBeforeBook(Transfer);
                ViewBag.Data = CB.Data;
                if (CB.Data == "Book")
                {
                    Session["RoomSelect"] = Transfer;
                    return RedirectToAction("Book");
                }
                else
                {
                    return View("~/Views/Ashraya/CustomerDashboard/Dashboard_Customer.aspx");
                 }
            }

        }



        //Customer Profile Update
        public ActionResult CustomerProfile(String pass_u, String cpass_u, String add_u, String ID)
        {
            bool a = string.IsNullOrEmpty(pass_u), b = string.IsNullOrEmpty(cpass_u), c = string.IsNullOrEmpty(add_u);
           if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/CustomerProfile/CustomerProfile.aspx");
            }
            else
            {
                UpdateAccount UP = new UpdateAccount();
                ID = Session["ID"].ToString();
                UP.Updates(pass_u, cpass_u, add_u, ID);
                ViewBag.Message = UP.Message;
                if (ViewBag.Message == "PassNoMatch")
                {
                    return View("~/Views/Ashraya/CustomerProfile/CustomerProfile.aspx");
                }
                else
                {
                    return RedirectToAction("Dashboard_Customer");
                }

            }
        }

        //Owner Dashboard
        public ActionResult OwnerDashboard()
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else
            {
                return View("~/Views/Ashraya/OwnerDashboard/Dashboard_Owner.aspx");
            }
        }


        //Add Room
        public ActionResult RoomAdd(String Price, String RoomType, HttpPostedFileBase Img1, HttpPostedFileBase Img2, HttpPostedFileBase Img3, String Television, String Refridgerator, String AC, String select)
        {
            bool a = string.IsNullOrEmpty(Price), b = string.IsNullOrEmpty(RoomType), g = string.IsNullOrEmpty(Television), h = string.IsNullOrEmpty(Refridgerator), i = string.IsNullOrEmpty(AC), x = string.IsNullOrEmpty(select);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || x == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/OwnerAddRoom.aspx");
            }
            else
            {
                Room R = new Room();
                R.ShowRooms(Price, RoomType, Img1, Img2, Img3, Television, Refridgerator, AC, select);
                ViewBag.Message = R.Message;
                return View("~/Views/Ashraya/OwnerDashboard/OwnerAddRoom.aspx");
            }

        }

        //Add PG
        public ActionResult PGAdd(String PGName, String PGLocation, String PGZip, HttpPostedFileBase Img1P, HttpPostedFileBase Img2P, HttpPostedFileBase Img3P, String ID)
        {
            bool a = string.IsNullOrEmpty(PGName), b = string.IsNullOrEmpty(PGLocation), c = string.IsNullOrEmpty(PGZip);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/OwnerAddPG.aspx");
            }
            else
            {
                PG PP = new PG();
                ID = Session["ID"].ToString();
                PP.PGAdd(PGName, PGLocation, PGZip, Img1P, Img2P, Img3P, ID);
                ViewBag.Message = PP.Message;
                return View("~/Views/Ashraya/OwnerDashboard/OwnerAddPG.aspx");
            }

        }


        //Owner Profile Update
        public ActionResult OwnerProfile(String pass_u, String cpass_u, String add_u, String ID)
        {
            bool a = string.IsNullOrEmpty(pass_u), b = string.IsNullOrEmpty(cpass_u), c = string.IsNullOrEmpty(add_u);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/Profile.aspx");
            }
            else
            {
                UpdateAccount UP = new UpdateAccount();
                ID = Session["ID"].ToString();
                UP.Updates(pass_u, cpass_u, add_u, ID);
                ViewBag.Message = UP.Message;
                if (ViewBag.Message == "PassNoMatch")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/Profile.aspx");
                }
                else
                {
                    return RedirectToAction("OwnerDashboard");
                }

            }
        }


        //Display Rooms
        public ActionResult MyRoomMyPG(String TransferR)
        {
            bool a = string.IsNullOrEmpty(TransferR);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else  if (a == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/MyRooms.aspx");
            }
            else
            {
                Session["RoomSelectR"] = TransferR;
                return RedirectToAction("MyRoomMyPGX");
            }

        }

        //Display Rooms
        public ActionResult RoomBookPageUD()
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else
            {
                return RedirectToAction("OwnerDashboard");
            }
        }


        //Update Delete Display Rooms
        public ActionResult MyRoomMyPGX(String PriceR, String IDF, String Option)
        {
            bool a = string.IsNullOrEmpty(PriceR);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else  if (a == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/UpdateDeleteRoom.aspx");
            }
            else
            {
                RoomUpdate RU = new RoomUpdate();
                IDF = Session["RoomSelectR"].ToString();
                RU.Edit(PriceR, IDF, Option);
                ViewBag.Message = RU.Message;
                if (RU.Message == "Update")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/UpdateDeleteRoom.aspx");
                }
                else if (RU.Message == "CannotDeletex")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/UpdateDeleteRoom.aspx");
                }
                else
                {
                    return RedirectToAction("OwnerDashboard");
                }

            }

        }

        //Delete Display PGS
        public ActionResult MyPG(String TransferRR)
        {
            bool a = string.IsNullOrEmpty(TransferRR);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/MyPGS.aspx");
            }
            else
            {
                Session["PGSelectR"] = TransferRR;
                PGDelete PX = new PGDelete();
                if (PX.Information == "CannotDelete")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/MyPGS.aspx");
                }
                else if (PX.Information == "CannotDelete2")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/MyPGS.aspx");
                }
                else
                {
                    return RedirectToAction("MyRoomMyPGY");
                }
            }

        }

        //Update Delete Display Rooms
        public ActionResult MyPGY(String pgdeleted, String Cattu)
        {
            bool a = string.IsNullOrEmpty(pgdeleted); 
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/OwnerDashboard/DeletePG.aspx");
            }
            else
            {
                PGDelete PD = new PGDelete();
                Cattu = Session["ID"].ToString();
                PD.PGDeletes(pgdeleted, Cattu);
                ViewBag.Information = PD.Information;
                if (PD.Information == "Delete")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/DeletePG.aspx");
                }
                else if (PD.Information == "CannotDelete")
                {
                    return View("~/Views/Ashraya/OwnerDashboard/DeletePG.aspx");
                }
                return View("~/Views/Ashraya/OwnerDashboard/DeletePG.aspx");
            }

        }

        //Booking
        public ActionResult Book(String CheckInDate, String CheckOutDate, String People)
        {
            bool a = string.IsNullOrEmpty(CheckInDate), b = string.IsNullOrEmpty(CheckOutDate), c = string.IsNullOrEmpty(People);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true)
            {
                return View("~/Views/Ashraya/Bookings/Bookings.aspx");
            }
            else
            {
                Session["CheckInDate"]=CheckInDate;
                Session["CheckOutDate"]=CheckOutDate;
                Session["People"]=People;
                return RedirectToAction("PaymentCard");
            }
        }
       
        //Payment Page
        public ActionResult PaymentCard(String RoomChoose, String CheckInDate, String CheckOutDate, String People, String CardName, String CardNo, String ExpiryMonth, String ExpiryYear, String CVV, String CID)
        {
            bool a = string.IsNullOrEmpty(CardName), b = string.IsNullOrEmpty(CardNo), c = string.IsNullOrEmpty(ExpiryMonth), d = string.IsNullOrEmpty(ExpiryYear), e = string.IsNullOrEmpty(CVV);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true || b == true || c == true || d == true || e == true)
            {
                return View("~/Views/Ashraya/Payment/Payment.aspx");
            }
            else
            {
                Payment PY = new Payment();
                RoomChoose = Session["RoomSelect"].ToString();
                CheckInDate = Session["CheckInDate"].ToString();
                CheckOutDate = Session["CheckOutDate"].ToString();
                People = Session["People"].ToString();
                CID = Session["ID"].ToString();
                PY.BOOKPG(RoomChoose, CheckInDate, CheckOutDate, People, CardName, CardNo, ExpiryMonth, ExpiryYear, CVV, CID);
                return RedirectToAction("Bill");
            }
        }

        //Customer's Bookings(Self)
        public ActionResult MyBookings(String DeleteBooking)
        {
            bool a = string.IsNullOrEmpty(DeleteBooking);
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/MyBookings/MyBookings.aspx");
            }
            else
            {
                DeleteBooking DBK = new DeleteBooking();
                DBK.Remove(DeleteBooking);
                ViewBag.Msg = DBK.Msg;
                return View("~/Views/Ashraya/MyBookings/MyBookings.aspx");
                
            }
           
        }



        //Generate Bill
        public ActionResult Bill()
        {
            if (Session["ID"] == null)
            {
                return RedirectToAction("Signin");
            }
            else
            {
                return View("~/Views/Ashraya/Bill/Bill.aspx");
            }
        }

        //Admin Login
        public ActionResult AdminLogin(String EA,String EP)
        {
            bool a = string.IsNullOrEmpty(EA), b = string.IsNullOrEmpty(EP);
            if(a==true||b==true)
            {
                return View("~/Views/Ashraya/AdminDashbaord/AdminLogin.aspx");
            }
            else
            {
                AdminLogin AL = new AdminLogin();
                AL.AL(EA,EP);
                ViewBag.A = AL.A;
                if (AL.A == "Login")
                {
                    Session["AdminID"] = AL.SessionData.ToString();
                    return RedirectToAction("AdminDashboard");
                }
                else 
                {
                    return View("~/Views/Ashraya/AdminDashbaord/AdminLogin.aspx");
                }
            }
           
        }

        //Admin Dashboard
        public ActionResult AdminDashboard()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                return View("~/Views/Ashraya/AdminDashbaord/AdminDashboard.aspx");
            }
        }

        //Admin ==> Display All Customers
        public ActionResult Display_All_Customers()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Customers.aspx");
            }
        }

        //Admin ==> Display All Owner
        public ActionResult Display_All_Owners()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
         else
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Owners.aspx");
              }
        }

        //Admin ==> Display All Rooms
        public ActionResult Display_All_Rooms()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Rooms.aspx");
            }
        }

        //Admin ==> Display All Pgs
        public ActionResult Display_All_PG()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_PG.aspx");
            }
        }

        //Admin ==> Display All Books
        public ActionResult Display_All_Bookings()
        {
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Bookings.aspx");
            }
        }

        //Admin ==> Display and Delete All Feedbacks
        public ActionResult Display_All_Feedbacks(String DeleteFeedback)
        {
            bool a = string.IsNullOrEmpty(DeleteFeedback);
             if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Feedbacks.aspx");
            }
            else
            {
                Admin_Delete_Feedbacks ADF = new Admin_Delete_Feedbacks();
                ADF.DFeedback(DeleteFeedback);
                ViewBag.Messagexxx = ADF.Messagexxx;
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Feedbacks.aspx");
            }
        }

        //Admin ==> Display & Delete Owner
        public ActionResult AdminDeleteOwner(String DeleteOwner)
        {
            bool a = string.IsNullOrEmpty(DeleteOwner);
               if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Owners_Delete.aspx");
            }
            else
            {
                Admin_Delete_Owner ADO = new Admin_Delete_Owner();
                ADO.ADO(DeleteOwner);
                ViewBag.Message = ADO.Message;
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Owners_Delete.aspx");
            }
        }


        //Admin ==> Display & Delete Customer
        public ActionResult AdminDeleteCustomer(String DeleteCustomer)
        {
            bool a = string.IsNullOrEmpty(DeleteCustomer);
               if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else  if (a == true)
            {
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Customers_Delete.aspx");
            }
            else
            {
                Admin_Delete_Customer ADC = new Admin_Delete_Customer();
                ADC.ADC(DeleteCustomer);
                ViewBag.Message=ADC.Message;
                return View("~/Views/Ashraya/AdminDashbaord/Display_All_Customers_Delete.aspx");
            }
        }

        //Admin ==> Get Verfication Data
        public ActionResult VerficationData(String DeleteVVV)
        {
            bool a = string.IsNullOrEmpty(DeleteVVV);
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else if (a == true)
            {
                return View("~/Views/Ashraya/AdminDashbaord/AdminCheckVerificationDetails.aspx");
            }
            else
            {
                Admin_Delete_Verification ADV = new Admin_Delete_Verification();
                ADV.ADC(DeleteVVV);
                ViewBag.Message = ADV.Message;
                return View("~/Views/Ashraya/AdminDashbaord/AdminCheckVerificationDetails.aspx");
            }
        }

        //Forget Password
        public ActionResult ForgetPassword(String PasswordX)
        {
            bool a = string.IsNullOrEmpty(PasswordX);
            if(a==true)
            {
                return View("~/Views/Ashraya/ForgetPassword/ForgetPassword.aspx");
            }
            else
            {
                ForgetPassword FP = new ForgetPassword();
                FP.New_password(PasswordX);
                ViewBag.Data = FP.Data;
                return View("~/Views/Ashraya/ForgetPassword/ForgetPassword.aspx");
            }
        }

       //Admin Profile Update (Password)
        public ActionResult AdminProfileUpdate(String AOP, String ANP,String ACP)
        {
            bool a = string.IsNullOrEmpty(AOP), b = string.IsNullOrEmpty(ANP);
            if (Session["AdminID"] == null)
            {
                return RedirectToAction("AdminLogin");
            }
            else
            {
                if (a == true || b == true)
                {
                    return View("~/Views/Ashraya/AdminDashbaord/Admin_Forget_Password.aspx");
                }
                else if (ANP != ACP)
                {
                    ViewBag.Msg = "Error4";
                    return View("~/Views/Ashraya/AdminDashbaord/Admin_Forget_Password.aspx");
                }
                else
                {
                    Admin_Profile_Update APU = new Admin_Profile_Update();
                    APU.AdminPassword(Session["AdminID"].ToString(), AOP, ANP);
                    ViewBag.Msg = APU.Msg;
                    return View("~/Views/Ashraya/AdminDashbaord/Admin_Forget_Password.aspx");
                }
            }
        }


    }
}
