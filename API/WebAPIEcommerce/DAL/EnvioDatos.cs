using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace WebAPIEcommerce.DAL
{
    public class EnvioDatos
    {
        
        public void ActualizarEstadoEnvio(int idEnvio, int? idNuevoEstado, string tracking)
        {
            
            var queryBuilder = new StringBuilder("UPDATE dbo.ENVIO SET FechaUltMovimiento = GETDATE()");

            
            var parametros = new List<SqlParameter>();
            parametros.Add(new SqlParameter("@IDEnvio", idEnvio));

            
            if (idNuevoEstado.HasValue)
            {
                queryBuilder.Append(", IDEstadoEnvio = @IDEstadoEnvio");
                parametros.Add(new SqlParameter("@IDEstadoEnvio", idNuevoEstado.Value));
            }

            if (tracking != null)
            {
                queryBuilder.Append(", Tracking = @Tracking");

                
                if (tracking == "")
                {
                    parametros.Add(new SqlParameter("@Tracking", DBNull.Value));
                }
                else
                {
                    parametros.Add(new SqlParameter("@Tracking", tracking));
                }
            }

            
            queryBuilder.Append(" WHERE IDEnvio = @IDEnvio");

            
            using (var cnn = ConexionDB.GetConexion())
            {
                try
                {
                    cnn.Open();
                    var cmd = new SqlCommand(queryBuilder.ToString(), cnn);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddRange(parametros.ToArray());

                    int filasAfectadas = cmd.ExecuteNonQuery();

                    if (filasAfectadas == 0)
                    {
                        throw new Exception("No se encontró el envío con el ID proporcionado.");
                    }
                }
                catch (SqlException sqlEx)
                {
                    // Captura el RAISERROR del trigger
                    throw new Exception(sqlEx.Message);
                }
                catch (Exception ex)
                {
                    throw new Exception("Error al actualizar el envío: " + ex.Message);
                }
            }
        }
    }
}