using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebAPIEcommerce.BLL;
using WebAPIEcommerce.Models;

namespace WebAPIEcommerce.Controllers
{
    [RoutePrefix("api/favoritos")]
    public class FavoritosController : ApiController
    {
        private FavoritosLogica _favoritosLogica = new FavoritosLogica();

        [HttpPost]
        [Route("toggle")]
        public IHttpActionResult Toggle(ToggleFavoritoRequest request)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            try
            {
                _favoritosLogica.ToggleFavorito(request);
                
                return Ok(new { message = "Estado de favorito actualizado correctamente." });
            }
            catch (Exception ex)
            {
                
                return BadRequest(ex.Message);
            }
        }
    }
}