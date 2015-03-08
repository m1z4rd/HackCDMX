using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Newtonsoft.Json;


namespace HackCDMX.AppCivica.Entities.Core
{
    #region JSON EntidadDeSalud
    public class Rootobject
    {
        public List<EntidadDeSalud> datos { get; set; }

    }

    [JsonObject(MemberSerialization.OptIn)]
    public class EntidadDeSalud
    {
        [JsonProperty]
        public string NUMERO { get; set; }
        [JsonProperty]
        public string INSTITUCION { get; set; }
        [JsonProperty]
        public string TIPO { get; set; }
        [JsonProperty(PropertyName = "SUB-TIPO")]
        public string SUBTIPO { get; set; }
        [JsonProperty]
        public string NOMBRE_CENTRO { get; set; }
        //public int CLAVE_LOCALIDAD { get; set; }
        [JsonProperty]
        public string NOMBRE_LOCALIDAD { get; set; }
        //public int CLAVE_MUNICIPIO { get; set; }
        [JsonProperty]
        public string NOMBRE_MUNICPIO { get; set; }
        //public int CLAVE_ESTATAL { get; set; }
        [JsonProperty]
        public string NOMBRE_ESTADO { get; set; }
        //public string POBLACION_BENEFICIADA { get; set; }
        //public object EQUIPOS_COMPUTO { get; set; }
        [JsonProperty]
        public string LATITUD { get; set; }
        //public object Conversion { get; set; }
        [JsonProperty]
        public string LONGITUD { get; set; }
        [JsonProperty]
        public string TELEFONO { get; set; }
        [JsonProperty]
        public string DOMICILIO { get; set; }
        [JsonProperty]
        public string HORARIO { get; set; }
    }
    #endregion JSON EntidadDeSalud

}
