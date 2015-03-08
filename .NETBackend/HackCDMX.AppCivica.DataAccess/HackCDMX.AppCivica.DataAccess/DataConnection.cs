using System;
using System.Data;
using System.Data.SqlClient;


namespace HackCDMX.AppCivica.DataAccess
{
    internal class DataConnection : IDisposable
    {
        private readonly SqlConnection connection;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="connString"></param>
        /// <exception cref="InvalidOperationException"/>
        public DataConnection(string connString)
        {
            try
            {
                this.connection = new SqlConnection(connString);
                this.connection.Open();
            }
            catch (SqlException sqlEx)
            {
                throw new InvalidOperationException("CNN002. No fue posible establecer la comunicación con el repositorio del sistema.", sqlEx);
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException("CN003. Se presento un problema en la apertura de la comunicación con el repositorio.", ex);
            }
        }

        ~DataConnection()
        {
            Dispose(false);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="procedureParameters"></param>
        /// <returns></returns>
        public SqlCommand CreateCommand(string procedureName, SqlParameter[] procedureParameters)
        {
            var command = this.connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedureName;
            command.CommandTimeout = 0;

            if (procedureParameters != null)
            {
                command.Parameters.AddRange(procedureParameters);
            }

            return command;
        }

        public SqlCommand CreateCommand(string procedureName)
        {
            var command = this.connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = procedureName;
            command.CommandTimeout = 0;            

            return command;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                this.connection.Dispose();
            }
        }
    }
}
