using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.DAL
{
    public class ReportesDatos
    {
        // Llama a sp_ReporteVentasParam
        public List<ReporteVentasView> ObtenerReporteVentas(ReporteVentasRequest request)
        {
            var lista = new List<ReporteVentasView>();
            string sp = "sp_ReporteVentasParam";

            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(sp, cnn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Desde", request.Desde);
                    cmd.Parameters.AddWithValue("@Hasta", request.Hasta);
                    cmd.Parameters.AddWithValue("@IDMarca", (object)request.IDMarca ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@IDCategoria", (object)request.IDCategoria ?? DBNull.Value);

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            lista.Add(new ReporteVentasView
                            {
                                Anio = (int)reader["Anio"],
                                Mes = (int)reader["Mes"],
                                Marca = reader["Marca"].ToString(),
                                Categoria = reader["Categoria"].ToString(),
                                CantPedidos = (int)reader["CantPedidos"],
                                TotalVendido = (decimal)reader["TotalVendido"]
                            });
                        }
                    }
                }
                catch (Exception ex) { throw new Exception("Error al obtener reporte de ventas: " + ex.Message); }
            }
            return lista;
        }

        // Llama a vw_ReporteMensual
        public List<ReporteMensualView> ObtenerReporteMensual()
        {
            var lista = new List<ReporteMensualView>();
            string query = "SELECT * FROM vw_ReporteMensual ORDER BY Anio, Mes";

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
                            lista.Add(new ReporteMensualView
                            {
                                Anio = (int)reader["Anio"],
                                Mes = (int)reader["Mes"],
                                MontoTotalVentas = (decimal)reader["MontoTotalVentas"],
                                CantidadPedidos = (int)reader["CantidadPedidos"]
                            });
                        }
                    }
                }
                catch (Exception ex) { throw new Exception("Error al obtener reporte mensual: " + ex.Message); }
            }
            return lista;
        }
    }
}