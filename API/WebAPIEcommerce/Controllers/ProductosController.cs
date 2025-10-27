using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/productos")]
    public class ProductosController : ApiController
    {
        private ProductoLogica _productoLogica = new ProductoLogica();

        [HttpGet]
        [Route("categoria/{id:int}")]
        public IHttpActionResult GetPorCategoria(int id)
        {
            try
            {
                var productos = _productoLogica.ObtenerArticulosPorCategoria(id);
                return Ok(productos);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}