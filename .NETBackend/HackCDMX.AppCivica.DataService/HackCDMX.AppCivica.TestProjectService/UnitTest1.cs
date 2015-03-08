using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using HackCDMX.AppCivica.DataService;

namespace HackCDMX.AppCivica.TestProjectService
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            DataService.DataService client = new DataService.DataService();


             var json = client.GetData("Salud");

            Assert.AreNotEqual(!json.Equals(string.Empty), false);
        }
    }
}
