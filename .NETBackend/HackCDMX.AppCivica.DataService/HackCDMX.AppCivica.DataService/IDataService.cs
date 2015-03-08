using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace HackCDMX.AppCivica.DataService
{
    [ServiceContract]
    public interface IDataService
    {
        [OperationContract]
        string GetData(string entidad);        
    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    // You can add XSD files into the project. After building the project, you can directly use the data types defined there, with the namespace "HackCDMX.AppCivica.DataService.ContractType".
    [DataContract]
    public class Salud
    {
        [DataMember]
        public string NUMERO { get; set; }
        [DataMember]
        public string INSTITUCION { get; set; }
        [DataMember]
        public string TIPO { get; set; }
        [DataMember]
        public string SUBTIPO { get; set; }
        [DataMember]
        public string NOMBRE_CENTRO { get; set; }
        [DataMember]
        public string CLAVE_LOCALIDAD { get; set; }
        [DataMember]
        public string NOMBRE_LOCALIDAD { get; set; }
        [DataMember]
        public string CLAVE_MUNICIPIO { get; set; }
        [DataMember]
        public string NOMBRE_MUNICPIO { get; set; }
        [DataMember]
        public string CLAVE_ESTATAL { get; set; }
        [DataMember]
        public string NOMBRE_ESTADO { get; set; }
        [DataMember]
        public string POBLACION_BENEFICIADA { get; set; }
        [DataMember]
        public string EQUIPOS_COMPUTO { get; set; }
        [DataMember]
        public string LATITUD { get; set; }
        [DataMember]
        public string Conversion { get; set; }
        [DataMember]
        public string LONGITUD { get; set; }
        [DataMember]
        public string TELEFONO { get; set; }
        [DataMember]
        public string DOMICILIO { get; set; }
        [DataMember]
        public string HORARIO { get; set; }
    }
}
