using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebAPIEcommerce.DAL
{
    public class CheckoutDatos
    {
        // Llama a sp_RegistrarPago
        
        public void RegistrarPago(int idPedido, string metodoPago, decimal monto, int? idDomicilio)
        {
            string sp = "sp_RegistrarPago";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IDPedido", idPedido);
                    cmd.Parameters.AddWithValue("@MetodoPago", metodoPago);
                    cmd.Parameters.AddWithValue("@Monto", monto);

                    
                    // Si idDomicilio tiene valor, lo usa. Si es null, envía DBNull.Value.
                    cmd.Parameters.AddWithValue("@IDDomicilio", (object)idDomicilio ?? DBNull.Value);

                    cmd.ExecuteNonQuery();
                }
                catch (SqlException sqlEx)
                {
                    //  RAISERROR (ej. "No hay stock", "El domicilio no pertenece...")
                    throw new Exception(sqlEx.Message);
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al registrar el pago: " + ex.Message);
                }
            }
        }
    }
}