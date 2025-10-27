using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.DAL
{
    public class PedidoDatos
    {
        // Llama a sp_AgregaArticuloEnPedido 
        public void AgregarArticuloEnPedido(int idCliente, int sku, int cantidad)
        {
            string sp = "sp_AgregaArticuloEnPedido";
            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IDCliente", idCliente);
                    cmd.Parameters.AddWithValue("@SKU", sku);
                    cmd.Parameters.AddWithValue("@Cantidad", cantidad);
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException sqlEx)
                {
                    // RAISERROR (ej. "No hay stock")
                    throw new Exception(sqlEx.Message);
                }
               
            }
        }

        // Llama a sp_QuitarArticuloDelPedido 
        public void QuitarArticuloDelPedido(int idCliente, int sku, int cantidad)
        {
            string sp = "sp_QuitarArticuloDelPedido";
            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IDCliente", idCliente);
                    cmd.Parameters.AddWithValue("@SKU", sku);
                    cmd.Parameters.AddWithValue("@Cantidad", cantidad);
                    cmd.ExecuteNonQuery();
                }
                catch (SqlException sqlEx)
                {
                    
                    throw new Exception(sqlEx.Message);
                }
               
            }
        }
    }
}