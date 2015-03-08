using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using HackCDMX.AppCivica.JsonDatosZen.Entidades;

namespace HackCDMX.AppCivica.JsonDatosZen
{
    public class JsonDatosSeguridadPublica
    {
        public JsonDatosSeguridadPublica()
        {  }

        public static string GetJason()
        {
            var json = Backend.GetFromBacked();

            //** Aquí se Deserializa sólo para transformar el JSON en crudo en objeto C#, para después volverlo a Serializar
            List<EntidadSaludFake> listSalud = new List<EntidadSaludFake>();
            listSalud = JsonConvert.DeserializeObject<List<EntidadSaludFake>>(json);
            //***********

            var res = string.Empty;

            foreach (EntidadSaludFake ent in listSalud)
            {
                res += JsonConvert.SerializeObject(ent, Formatting.None);
            }

            return res;
        }
    }
}
