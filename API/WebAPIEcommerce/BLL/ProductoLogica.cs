using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebAPIEcommerce.DAL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.BLL
{
    public class ProductoLogica
    {
        private ProductoDatos _productoDatos = new ProductoDatos();

        public List<ArticuloPorCategoriaView> ObtenerArticulosPorCategoria(int idCategoria)
        {
            if (idCategoria <= 0)
            {
                throw new System.Exception("El ID de categoría no es válido.");
            }
            return _productoDatos.ObtenerArticulosPorCategoria(idCategoria);
        }
    }
}