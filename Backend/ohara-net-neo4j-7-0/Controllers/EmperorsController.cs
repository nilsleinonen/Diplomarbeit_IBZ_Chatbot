using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading.Tasks;
using System.Xml.Linq;
using HR.Models;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Neo4jClient;
using ohara_net_neo4j.Models;

namespace HR.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class EmperorsController : ControllerBase
    {
        private readonly IGraphClient _client;

        public EmperorsController(IGraphClient client)
        {
            _client = client;
        }

        [EnableCors]
        [HttpGet]

        public async Task<IActionResult> Get()
        {
            var response = await _client.Cypher.Match("(n:Character)-[:IS_A_EMP]->(m:Fouremperors)")
                                                  .Return(n => n.As<Character>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }




    }
}
