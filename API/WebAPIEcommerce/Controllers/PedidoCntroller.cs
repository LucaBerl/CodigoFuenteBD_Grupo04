using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/pedidos")]
    public class PedidosController : ApiController
    {
        private PedidoLogica _pedidoLogica = new PedidoLogica();

        
        // Endpoint: GET /api/pedidos/5

        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetPedidoById(int id)
        {
            try
            {
                var pedidoResumen = _pedidoLogica.ObtenerResumen(id);

                if (pedidoResumen == null)
                {
                    // Si la BLL devuelve null, es un 404 Not Found
                    return NotFound();
                }

                // Devuelve 200 OK con el JSON del resumen del pedido
                return Ok(pedidoResumen);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}