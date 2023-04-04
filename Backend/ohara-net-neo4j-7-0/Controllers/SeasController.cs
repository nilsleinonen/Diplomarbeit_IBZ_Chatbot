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

    public class SeasController : ControllerBase
    {
        private readonly IGraphClient _client;

        public SeasController(IGraphClient client)
        {
            _client = client;
        }

        [EnableCors]
        [HttpGet]

       public async Task<IActionResult> Get(){
             var response = await _client.Cypher.Match("(n: Sea)")
                                                   .Return(n => n.As<Sea>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

        [EnableCors]
        [HttpGet("{island}")]
       public async Task<IActionResult> GetBySea(string island)
        {
            var response = await _client.Cypher.Match("(m:Sea)<-[:LOCATED_IN]-(d:Island)")
                                                  .Where((Island d) => d.name == island)
                                                  .Return(m => m.As<Sea>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

      

    }
}
