using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.DAL
{
    public class ConexionDB
    {
        public static string ObtenerCadenaConexion()
        {
            
            return ConfigurationManager.ConnectionStrings["ECOMMERCE_BD"].ConnectionString;
        }

        public static SqlConnection GetConexion()
        {
            return new SqlConnection(ObtenerCadenaConexion());
        }
    }
}