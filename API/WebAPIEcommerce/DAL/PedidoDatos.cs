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


        public EstadoDePedidoView ObtenerResumenPedido(int idPedido)
        {
            EstadoDePedidoView resumen = null;

            
            string query = "SELECT * FROM dbo.vw_EstadoDePedido WHERE IDPedido = @IDPedido";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(query, cnn);
                    cmd.CommandType = CommandType.Text; 
                    cmd.Parameters.AddWithValue("@IDPedido", idPedido);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) 
                        {
                            resumen = new EstadoDePedidoView
                            {
                                IDPedido = (int)reader["IDPedido"],
                                IDCliente = (int)reader["IDCliente"],
                                NombreCliente = reader["NombreCliente"].ToString(),
                                ApellidoCliente = reader["ApellidoCliente"].ToString(),
                                FechaCreacion = (DateTime)reader["FechaCreacion"],
                                EstadoPedido = reader["EstadoPedido"].ToString(),
                                MontoTotal = reader["MontoTotal"] != DBNull.Value ? (decimal?)reader["MontoTotal"] : null,
                                MetodoPago = reader["MetodoPago"] != DBNull.Value ? reader["MetodoPago"].ToString() : null,
                                FechaPago = reader["FechaPago"] != DBNull.Value ? (DateTime?)reader["FechaPago"] : null,
                                EstadoEnvio = reader["EstadoEnvio"].ToString(),
                                Tracking = reader["Tracking"] != DBNull.Value ? reader["Tracking"].ToString() : null
                            };
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Loguear el error (ex)
                    throw new Exception("Error al obtener resumen del pedido: " + ex.Message);
                }
            }
            return resumen; // Devuelve el objeto, or null si no se encontró
        }
    }
}