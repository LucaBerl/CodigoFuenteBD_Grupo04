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

        
        public EstadoDePedidoView ObtenerResumen(int idPedido)
        {
            if (idPedido <= 0)
            {
                throw new Exception("El ID del pedido no es válido.");
            }

            
            var resumen = _pedidoDatos.ObtenerResumenPedido(idPedido);

            
            return resumen;
        }
    }
}