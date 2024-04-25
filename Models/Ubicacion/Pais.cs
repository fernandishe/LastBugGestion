using System.ComponentModel.DataAnnotations;

namespace LastBugGestion.Models.Ubicacion
{
    public class Pais
    {
        [Key]
        public string codigo { get; set; }
        public string nombre { get; set; }

        public string usuarioCreacion { get; set; }
        public string usuarioModificacion { get; set; }
    }
}
