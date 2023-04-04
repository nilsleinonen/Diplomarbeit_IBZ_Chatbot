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

    public class CaptainsController : ControllerBase
    {
        private readonly IGraphClient _client;

        public CaptainsController(IGraphClient client)
        {
            _client = client;
        }

        [EnableCors]
        [HttpGet]

       public async Task<IActionResult> Get(){
             var response = await _client.Cypher.Match("(m:Crew)<-[:LEADS]-(d:Character{type:'pirate'})")
                                                   .Return(d => d.As<Character>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

        [EnableCors]
        [HttpGet("{crew}")]
       public async Task<IActionResult> GetByLeader(string crew)
        {
             var response = await _client.Cypher.Match("(m:Crew)<-[:LEADS]-(d:Character)")
                                                   .Where((Crew m) => m.name == crew)
                                                   .OrWhere((Character d) => d.alias == crew)
                                                   .Return(d => d.As<Character>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

       

    }
}
