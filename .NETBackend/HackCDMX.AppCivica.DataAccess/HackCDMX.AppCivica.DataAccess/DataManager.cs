using HackCDMX.AppCivica.Common.Core;
using System;
using System.Data;
using System.Data.SqlClient;


namespace HackCDMX.AppCivica.DataAccess
{
    public class DataManager
    {
        public static object ExecuteProcedureScalar(string procedureName, SqlParameter[] procedureParameters)
        {
            Guard.ValidateStringParameter("procedureName", procedureName);

            try
            {
                object result = null;

                using (var connection = DataProcedureFactory.CreateConnection())
                {
                    using (var command = connection.CreateCommand(procedureName, procedureParameters))
                    {
                        result = command.ExecuteScalar();
                    }
                }

                return result;
            }
            catch (SqlException sqlEx)
            {
                throw new InvalidOperationException(string.Format("DAT001: Se presento un problema en la ejecución del comando {0}", procedureName), sqlEx);
            }
            catch (InvalidOperationException)
            {
                throw;
            }
        }

        public static int ExecuteProcedure(string procedureName, SqlParameter[] procedureParameters)
        {
            Guard.ValidateStringParameter("procedureName", procedureName);

            try
            {
                int result = 0;

                using (var connection = DataProcedureFactory.CreateConnection())
                {
                    using (var command = connection.CreateCommand(procedureName, procedureParameters))
                    {
                        result = command.ExecuteNonQuery();
                    }
                }

                return result;
            }
            catch (SqlException sqlEx)
            {
                throw new InvalidOperationException(string.Format("DAT002: Se presento un problema en la ejecución del comando {0}", procedureName), sqlEx);
            }
            catch (InvalidOperationException)
            {
                throw;
            }
        }

        public static IDataReader ExecuteReader(string procedureName, SqlParameter[] procedureParameters)
        {
            Guard.ValidateStringParameter("procedureName", procedureName);

            try
            {
                IDataReader reader = null;

                var connection = DataProcedureFactory.CreateConnection();
                
                using (var command = connection.CreateCommand(procedureName, procedureParameters))
                {
                    reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                }
                
                return reader;
            }
            catch (SqlException sqlEx)
            {
                throw new InvalidOperationException(string.Format("DAT003: Se presento un problema en la ejecución del comando {0}", procedureName), sqlEx);
            }
            catch (InvalidOperationException)
            {
                throw;
            }
            finally
            {
                
            }
        }


        public static IDataReader ExecuteReaderWithoutParams(string procedureName)
        {
            Guard.ValidateStringParameter("procedureName", procedureName);

            try
            {
                IDataReader reader = null;

                var connection = DataProcedureFactory.CreateConnection();

                using (var command = connection.CreateCommand(procedureName))
                {
                    reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                }

                return reader;
            }
            catch (SqlException sqlEx)
            {
                throw new InvalidOperationException(string.Format("DAT003: Se presento un problema en la ejecución del comando {0}", procedureName), sqlEx);
            }
            catch (InvalidOperationException)
            {
                throw;
            }
            finally
            {

            }
        }

    }
}
