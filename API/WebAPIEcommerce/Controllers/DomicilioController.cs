using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;

namespace WebAPIEcommerce.Controllers
{
    // Modelo simple para pasar el IDCliente en el body del DELETE
    public class DeleteDomicilioRequest
    {
        public int IDCliente { get; set; }
    }

    [RoutePrefix("api/domicilios")]
    public class DomicilioController : ApiController
    {
        private DomicilioLogica _domicilioLogica = new DomicilioLogica();

        [HttpDelete]
        [Route("{idDomicilio:int}")]
        public IHttpActionResult Eliminar(int idDomicilio, DeleteDomicilioRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            try
            {
                // Pasamos el idCliente (del body) para validar que es el dueño
                _domicilioLogica.EliminarDomicilio(idDomicilio, request.IDCliente);
                return Ok(new { message = "Domicilio eliminado. Si era predeterminado, se asignó uno nuevo." });
            }
            catch (Exception ex)
            {
                // Captura error de FK (domicilio en uso) o si no se encontró
                return BadRequest(ex.Message);
            }
        }
    }
}