using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HackCDMX.AppCivica.Entities.Core
{
    public class PersonAdditionalInfo
    {
        public int BusinessEntityID                     {get; set;}
        public string FirstName                         {get; set;}
        public string MiddleName                        {get; set;}
        public string LastName                          {get; set;}
        public string TelephoneNumber                   {get; set;}
        public string TelephoneSpecialInstructions      {get; set;}
        public string Street                            {get; set;}
        public string City                              {get; set;}                                   
        public string StateProvince                     {get; set;}
        public int PostalCode                           {get; set;}
        public string CountryRegion                     {get; set;}
        public string HomeAddressSpecialInstructions    {get; set;}
        public string EMailAddress                      {get; set;}
        public string EMailSpecialInstructions          {get; set;}
        public string EMailTelephoneNumber              {get; set;}
        public Guid rowguid                             {get; set;}
        public DateTime ModifiedDate                    {get; set;}
    }
}
