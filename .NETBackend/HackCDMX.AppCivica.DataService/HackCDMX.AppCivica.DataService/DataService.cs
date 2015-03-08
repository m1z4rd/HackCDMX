using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using HackCDMX.AppCivica.JsonDatosZen;

namespace HackCDMX.AppCivica.DataService
{
     public class DataService : IDataService
    {
         /// <summary>
         /// Obtiene la información en formato JSON
         /// </summary>
         /// <param name="entidad"></param>
         /// <returns></returns>
        public string GetData(string entidad)
        {
            var estructuraJson = string.Empty;

            if (ModulosEntidadesGobierno.Entidades.Salud.ToString().Equals(entidad))
            { 
                estructuraJson = JsonDatosSalud.GetJason();
            }
            else if (ModulosEntidadesGobierno.Entidades.CarteraCultural.ToString().Equals(entidad))
            {
                estructuraJson = JsonDatosCarteraCultural.GetJason();
            }
            else if (ModulosEntidadesGobierno.Entidades.SeguridadPublica.ToString().Equals(entidad))
            {
                estructuraJson = JsonDatosSeguridadPublica.GetJason();
            }
            else if (ModulosEntidadesGobierno.Entidades.Transporte.ToString().Equals(entidad))
            {
                estructuraJson = JsonDatosTransporte.GetJason();
            }
            

            return estructuraJson;
        }
    }
}
