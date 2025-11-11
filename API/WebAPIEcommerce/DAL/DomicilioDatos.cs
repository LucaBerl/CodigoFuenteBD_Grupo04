using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.DAL
{
    public class DomicilioDatos
    {
        public void EliminarDomicilio(int idDomicilio, int idCliente)
        {
            
            string query = "DELETE FROM DomicilioCliente WHERE IDDomicilio = @IDDomicilio AND IDCliente = @IDCliente";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(query, cnn);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@IDDomicilio", idDomicilio);
                    cmd.Parameters.AddWithValue("@IDCliente", idCliente); 

                    int filasAfectadas = cmd.ExecuteNonQuery();

                    if (filasAfectadas == 0)
                    {
                        throw new Exception("No se encontró el domicilio o no pertenece al cliente.");
                    }
                    
                }
                catch (SqlException sqlEx)
                {
                   
                    throw new Exception("Error de base de datos: " + sqlEx.Message);
                }
            }
        }
    }
}