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

    public class TellMeMoreController : ControllerBase
    {
        private readonly IGraphClient _client;

        public TellMeMoreController(IGraphClient client)
        {
            _client = client;
        }
     
        [EnableCors]
        [HttpGet("{alias}")]
       public async Task<IActionResult> GetByType(string alias)
        {
             var response = await _client.Cypher.Match("(d:Character)")
                                                   .Where((Character d) => d.alias == alias)
                                                   .OrWhere((Character d) => d.name == alias)
                                                   .Return(d => d.As<Character>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

       
    }
}
