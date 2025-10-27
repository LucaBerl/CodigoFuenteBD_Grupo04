using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class CarritoLogica
    {
        private PedidoDatos _pedidoDatos = new PedidoDatos();

        public void AgregarArticulo(AgregarArticuloRequest request)
        {
            if (request.Cantidad <= 0)
            {
                throw new Exception("La cantidad debe ser mayor a cero.");
            }
            _pedidoDatos.AgregarArticuloEnPedido(request.IDCliente, request.SKU, request.Cantidad);
        }

        public void QuitarArticulo(AgregarArticuloRequest request)
        {
            if (request.Cantidad <= 0)
            {
                throw new Exception("La cantidad debe ser mayor a cero.");
            }
            _pedidoDatos.QuitarArticuloDelPedido(request.IDCliente, request.SKU, request.Cantidad);
        }
    }
}