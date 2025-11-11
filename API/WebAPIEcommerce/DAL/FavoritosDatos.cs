using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.DAL
{
    public class FavoritosDatos
    {
        public void ToggleFavorito(int idCliente, int sku)
        {
            string sp = "sp_ToggleFavorito";
            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IDCliente", idCliente);
                    cmd.Parameters.AddWithValue("@SKU", sku);
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException sqlEx)
                {
                    // Captura RAISERROR de validaciones (ej. "El artículo no existe")
                    throw new Exception(sqlEx.Message);
                }
                catch (Exception ex)
                {
                    throw new Exception("Error en la base de datos al cambiar favorito: " + ex.Message);
                }
            }
        }
    }
}