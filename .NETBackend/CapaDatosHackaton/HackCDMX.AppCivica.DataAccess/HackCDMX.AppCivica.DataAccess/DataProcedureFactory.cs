using System;
using System.Configuration;

namespace HackCDMX.AppCivica.DataAccess
{
    internal static class DataProcedureFactory
    {
        private const string AppCivica_ConnString_ConfigKey = 
            @"Server=NEURONA\SQLEXPRESS;Database=Hackaton;User Id=HackCDMX_Usr;Password=AppC1v1c4;";

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        /// <exception cref="InvalidOperationException"/>
        public static DataConnection CreateConnection()
        {
            try
            {
                //var configInfo = ConfigurationManager.ConnectionStrings[AppCivica_ConnString_ConfigKey];

                //if (configInfo == null)
                //{
                //    throw new InvalidOperationException("CNN00: No existe la información de configuración de la clave " + AppCivica_ConnString_ConfigKey);
                //}

                //var cnnString = configInfo.ConnectionString;

                //if (string.IsNullOrEmpty(cnnString))
                //{
                //    throw new InvalidOperationException("CNN00: No se ha especificado la información de configuración de conexión al repositorio.");
                //}

                return new DataConnection(AppCivica_ConnString_ConfigKey);
            }
            catch (ConfigurationErrorsException configError)
            {
                throw new InvalidOperationException("CNN001. No fue posible obtener la información de configuración.", configError);
            }
        }
    }
}
