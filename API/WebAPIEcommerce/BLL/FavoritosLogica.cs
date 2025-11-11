using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class FavoritosLogica
    {
        private FavoritosDatos _favoritosDatos = new FavoritosDatos();

        public void ToggleFavorito(ToggleFavoritoRequest request)
        {
            if (request.IDCliente <= 0 || request.SKU <= 0)
            {
                throw new Exception("IDCliente y SKU son requeridos y deben ser válidos.");
            }

          
            _favoritosDatos.ToggleFavorito(request.IDCliente, request.SKU);
        }
    }
}