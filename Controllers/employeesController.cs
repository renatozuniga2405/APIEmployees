using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using API_practica;
using API_practica.Models;
using System.Data.SqlClient;

namespace API_practica.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class employeesController : ControllerBase
    {
        private readonly AplicationDbContext _context;

        public employeesController(AplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<List<employees>> Get()
        {
            try
            {
                var listaEmpleados = _context.empleados.ToList();
                return Ok(listaEmpleados);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        public ActionResult Post([FromBody] employees empleados)
        {
            try
            {
                _context.Add(empleados);
                _context.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        public ActionResult Put([FromBody] employees empleados)
        {
            try
            {

                System.Data.SqlClient.SqlConnection cn = new System.Data.SqlClient.SqlConnection("Server=.;Database=API_practica;User Id=sa;Password=123;");
                SqlCommand cmd = cn.CreateCommand();
                cn.Open();
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.CommandText = "sp_upd_empleado";
                cmd.Parameters.Add("@id", System.Data.SqlDbType.Int).Value = empleados.id;
                cmd.Parameters.Add("@emp_name", System.Data.SqlDbType.NVarChar).Value = empleados.employee_name;
                cmd.Parameters.Add("@emp_salary", System.Data.SqlDbType.Decimal).Value = empleados.employee_salary;
                cmd.Parameters.Add("@emp_age", System.Data.SqlDbType.Int).Value = empleados.employee_age;
                cmd.Parameters.Add("@emp_profileimg", System.Data.SqlDbType.NVarChar).Value = empleados.profile_image;
                cmd.ExecuteNonQuery();
                cn.Close();

                return Ok();
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }
        }


        //[HttpPut("{id}")]
        //public ActionResult Put(int id,[FromBody] employees empleados)
        //{
        //    try
        //    {
        //        if (id != empleados.id)
        //        {
        //            return BadRequest("");
        //        }

        //        _context.Entry(empleados).State = EntityState.Modified;
        //        _context.Update(empleados);
        //        _context.SaveChanges();

        //        return Ok();
        //    }
        //    catch (Exception ex)
        //    {

        //        return BadRequest(ex.Message);
        //    }
        //}

        
    }
}
