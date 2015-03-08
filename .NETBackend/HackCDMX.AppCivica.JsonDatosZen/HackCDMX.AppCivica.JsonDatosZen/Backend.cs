using System;
using System.Collections.Generic;
using System.IO; //** Sólo para emular
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HackCDMX.AppCivica.JsonDatosZen
{
    internal class Backend
    {
        public static string GetFromBacked()
        {
            //*** Aquí emula la obtención del Json Transformado desde la Base de Datos 
            string jsonfile = File.ReadAllText(@"C:\HackCDMXJsonFiles\testSalud.json");

            return jsonfile;
        }
    }
}
