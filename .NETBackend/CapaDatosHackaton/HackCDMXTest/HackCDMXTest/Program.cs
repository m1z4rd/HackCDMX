using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;

using HackCDMX.AppCivica.DataAccess;
using HackCDMX.AppCivica.Entities.Core;


namespace HackCDMXTest
{
    class Program
    {
        static void Main(string[] args)
        {
            TestJSONEntidadDeSalud();
        }


        public static void TestJSONEntidadDeSalud()
        {

            // Read the file as one string. 
            string txtJSON =
                System.IO.File.ReadAllText(@"C:\_Hackaton\Datos\csharpToJSon.json");
            //System.IO.File.ReadAllText(@"C:\_Hackaton\Datos\CentrosDeSalud.json");

            Console.WriteLine(txtJSON);
            Console.WriteLine("\n\n***** Archivo JSON leido");
            Console.ReadKey();

            List<EntidadDeSalud> listEntidadSalud = new List<EntidadDeSalud>();

            // Deserializar el JSON
            listEntidadSalud = JsonConvert.DeserializeObject<List<EntidadDeSalud>>(txtJSON);

            //Imprimir Entidades
            //ImprimirEntidades(listEntidadSalud);
            Console.WriteLine("\n\n***** Entiades importadas");
            Console.ReadKey();

            GuardarEntidades(listEntidadSalud);
            Console.WriteLine("\n\n***** Entiades insertadas en BD");
            Console.ReadKey();

            //List<EntidadDeSalud> listaEntidadObtenida = new List<EntidadDeSalud>();
            //listaEntidadObtenida = LeerEntidades();
            Console.WriteLine("\n\n***** Entiades recuperadas de la  BD");
            Console.ReadKey();

            ImprimirEntidades(listEntidadSalud);
     
            // Serializar de nuevo el objeto
            string serializedTxt = JsonConvert.SerializeObject(listEntidadSalud);            
            //Console.WriteLine(serializedTxt);

            //System.IO.File.WriteAllText(@"C:\_Hackaton\Datos\csharpToJSon3.json", serializedTxt);
            Console.ReadKey();

        }


        private static void ImprimirEntidades(List<EntidadDeSalud> lista)
        {
            string txt;

            // Imprimir las entidades
            foreach (EntidadDeSalud e in lista)
            {

                txt = (e.NUMERO != null) ? e.NUMERO.ToString() : "null";
                Console.WriteLine("NUMERO: {0}", txt);

                txt = (e.INSTITUCION != null) ? e.INSTITUCION.ToString() : "null";
                Console.WriteLine("INSTITUCION: {0}", txt);

                txt = (e.TIPO != null) ? e.TIPO.ToString() : "null";
                Console.WriteLine("TIPO: {0}", txt);

                txt = (e.SUBTIPO != null) ? e.SUBTIPO.ToString() : "null";
                Console.WriteLine("SUBTIPO: {0}", txt);

                txt = (e.NOMBRE_CENTRO != null) ? e.NOMBRE_CENTRO.ToString() : "null";
                Console.WriteLine("NOMBRE_CENTRO: {0}", txt);

                txt = (e.NOMBRE_LOCALIDAD != null) ? e.NOMBRE_LOCALIDAD.ToString() : "null";
                Console.WriteLine("NOMBRE_LOCALIDAD: {0}", txt);

                txt = (e.NOMBRE_MUNICPIO != null) ? e.NOMBRE_MUNICPIO.ToString() : "null";
                Console.WriteLine("NOMBRE_MUNICPIO: {0}", txt);

                txt = (e.NOMBRE_ESTADO != null) ? e.NOMBRE_ESTADO.ToString() : "null";
                Console.WriteLine("NOMBRE_ESTADO: {0}", txt);

                txt = (e.LATITUD != null) ? e.LATITUD.ToString() : "null";
                Console.WriteLine("LATITUD: {0}", txt);

                txt = (e.LONGITUD != null) ? e.LONGITUD.ToString() : "null";
                Console.WriteLine("LONGITUD: {0}", txt);

                txt = (e.TELEFONO != null) ? e.TELEFONO.ToString() : "null";
                Console.WriteLine("TELEFONO: {0}", txt);

                txt = (e.DOMICILIO != null) ? e.DOMICILIO.ToString() : "null";
                Console.WriteLine("DOMICILIO: {0}", txt);

                txt = (e.HORARIO != null) ? e.HORARIO.ToString() : "null";
                Console.WriteLine("HORARIO: {0}", txt);

                Console.WriteLine("\n_________________________________________________________\n");

                //Console.ReadKey();
            }

        }


        private static void GuardarEntidades(List<EntidadDeSalud> lista)
        {
            try
            {
                List<SqlParameter> parametros = new List<SqlParameter>();

                foreach (EntidadDeSalud es in lista)
                {
                    parametros.Clear();
                    parametros.Add(new SqlParameter() { ParameterName = "@numero", SqlDbType = SqlDbType.NVarChar, Value = es.NUMERO });
                    parametros.Add(new SqlParameter() { ParameterName = "@institucion", SqlDbType = SqlDbType.NVarChar, Value = es.INSTITUCION });
                    parametros.Add(new SqlParameter() { ParameterName = "@tipo", SqlDbType = SqlDbType.NVarChar, Value = es.TIPO });
                    parametros.Add(new SqlParameter() { ParameterName = "@subtipo", SqlDbType = SqlDbType.NVarChar, Value = es.SUBTIPO });
                    parametros.Add(new SqlParameter() { ParameterName = "@nombre_centro", SqlDbType = SqlDbType.NVarChar, Value = es.NOMBRE_CENTRO });
                    parametros.Add(new SqlParameter() { ParameterName = "@nombre_localidad", SqlDbType = SqlDbType.NVarChar, Value = es.NOMBRE_LOCALIDAD });
                    parametros.Add(new SqlParameter() { ParameterName = "@nombre_municipio", SqlDbType = SqlDbType.NVarChar, Value = es.NOMBRE_MUNICPIO });
                    parametros.Add(new SqlParameter() { ParameterName = "@nombre_estado", SqlDbType = SqlDbType.NVarChar, Value = es.NOMBRE_ESTADO });
                    parametros.Add(new SqlParameter() { ParameterName = "@latitud", SqlDbType = SqlDbType.NVarChar, Value = es.LATITUD });
                    parametros.Add(new SqlParameter() { ParameterName = "@longitud", SqlDbType = SqlDbType.NVarChar, Value = es.LONGITUD });
                    parametros.Add(new SqlParameter() { ParameterName = "@telefono", SqlDbType = SqlDbType.NVarChar, Value = es.TELEFONO });
                    parametros.Add(new SqlParameter() { ParameterName = "@domicilio", SqlDbType = SqlDbType.NVarChar, Value = es.DOMICILIO });
                    parametros.Add(new SqlParameter() { ParameterName = "@horario", SqlDbType = SqlDbType.NVarChar, Value = es.HORARIO });

                    DataManager.ExecuteProcedure("spInsertarEntidadDeSalud", parametros.ToArray());
                }
            }
            catch (Exception ex)
            {
                return;
            }
        }


        private static List<EntidadDeSalud> LeerEntidades()
        {
            List<EntidadDeSalud> listEntidades = new List<EntidadDeSalud>();           
            
            SqlParameter[] sql = new SqlParameter[] { new SqlParameter{ParameterName = "", SqlDbType = SqlDbType.NVarChar, Value = null} }; 


            try
            {
                IDataReader dr = DataManager.ExecuteReaderWithoutParams("spConsultaEntidadesDeSalud");

                while (dr.Read())
                {
                    EntidadDeSalud e = new EntidadDeSalud();
                    
                    e.DOMICILIO = dr["DOMICILIO"].ToString();
                    e.HORARIO = dr["HORARIO"].ToString();
                    e.INSTITUCION = dr["INSTITUCION"].ToString();
                    e.LATITUD = dr["LATITUD"].ToString();
                    e.LONGITUD = dr["LONGITUD"].ToString();
                    e.NOMBRE_CENTRO = dr["NOMBRE_CENTRO"].ToString();
                    e.NOMBRE_ESTADO = dr["NOMBRE_ESTADO"].ToString();
                    e.NOMBRE_LOCALIDAD = dr["NOMBRE_LOCALIDAD"].ToString();
                    e.NOMBRE_MUNICPIO = dr["NOMBRE_MUNICPIO"].ToString();
                    e.NUMERO = dr["NUMERO"].ToString();
                    e.SUBTIPO = dr["SUBTIPO"].ToString();
                    e.TELEFONO = dr["TELEFONO"].ToString();
                    e.TIPO = dr["TIPO"].ToString();

                    listEntidades.Add(e);
                }
            }
            catch (Exception ex)
            {
                listEntidades = null;
            }

            return listEntidades;
        }


        public void TestGenerico()
        {
            
        }
    }
}
