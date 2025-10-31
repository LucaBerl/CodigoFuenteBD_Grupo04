using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class PedidoLogica
    {
        private PedidoDatos _pedidoDatos = new PedidoDatos();

        // --- MÉTODO PARA OBTENER EL RESUMEN ---
        public EstadoDePedidoView ObtenerResumen(int idPedido)
        {
            if (idPedido <= 0)
            {
                throw new Exception("El ID del pedido no es válido.");
            }

            // Simplemente llama a la DAL
            var resumen = _pedidoDatos.ObtenerResumenPedido(idPedido);

            // La lógica de negocio podría verificar permisos, etc.
            // Si no lo encuentra, devuelve null

            return resumen;
        }
    }
}