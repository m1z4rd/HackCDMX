using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using HackCDMX.AppCivica.DataService;

namespace DataServiceUnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            DataService client = new DataService();
            
  
            Assert.AreEqual(!client.GetData("Salud").Equals(string.Empty), false);
        }
    }
}
