using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.DAL
{
    public class ProductoDatos
    {
        // Llama a sp_GetArticulosPorCategoria
        public List<ArticuloPorCategoriaView> ObtenerArticulosPorCategoria(int idCategoria)
        {
            var lista = new List<ArticuloPorCategoriaView>();
            string sp = "sp_GetArticulosPorCategoria";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IDCategoria", idCategoria);

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new ArticuloPorCategoriaView
                            {
                                IDProducto = (int)reader["IDProducto"],
                                NombreProducto = reader["NombreProducto"].ToString(),
                                ImagenUrl = reader["ImagenUrl"] != DBNull.Value ? reader["ImagenUrl"].ToString() : null
                            });
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al consultar productos: " + ex.Message);
                }
            }
            return lista;
        }

        public List<ArticuloDisponibleView> ObtenerProductosDisponibles()
        {
            var lista = new List<ArticuloDisponibleView>();
            string query = "SELECT * FROM vw_ProductosConStock";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(query, cnn);
                    cmd.CommandType = CommandType.Text;

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new ArticuloDisponibleView
                            {
                                IDProducto = (int)reader["IDProducto"],
                                NombreProducto = reader["NombreProducto"].ToString(),
                                Descripcion = reader["Descripcion"].ToString(),
                                SKU = (int)reader["SKU"],
                                Color = reader["Color"].ToString(),
                                Talle = reader["Talle"].ToString(),
                                CantidadStock = (int)reader["CantidadStock"],
                                Precio = (decimal)reader["Precio"]
                            });
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al consultar productos disponibles: " + ex.Message);
                }
            }
            return lista;
        }
    }
}