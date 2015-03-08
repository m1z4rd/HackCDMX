using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HackCDMX.AppCivica.Common.Core
{
    public class Guard
    {
        /// <summary>
        /// Permite validar el valor de un parámetro de tipo String.
        /// </summary>
        /// <param name="name">Nombre del parámetro.</param>
        /// <param name="paramValue">Valor del parámetro.</param>
        /// <exception cref="ArgumentException"/>
        public static void ValidateStringParameter(string name, string paramValue)
        {
            if (string.IsNullOrEmpty(paramValue))
            {
                throw new ArgumentException("Proporcione la información del parámetro", paramValue);
            }

            if (string.IsNullOrWhiteSpace(paramValue))
            {
                throw new ArgumentException("Proporcione la información del parámetro", paramValue);
            }
        }
    }    
}
