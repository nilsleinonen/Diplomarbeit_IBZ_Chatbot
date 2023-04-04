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

    public class ArcsController : ControllerBase
    {
        private readonly IGraphClient _client;

        public ArcsController(IGraphClient client)
        {
            _client = client;
        }

        [EnableCors]
        [HttpGet]

       public async Task<IActionResult> Get(){
             var response = await _client.Cypher.Match("(n: Arc)")
                                                   .Return(n => n.As<Arc>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

        [EnableCors]
        [HttpGet("{arc}")]
       public async Task<IActionResult> GetByArc(string arc)
        {
             var response = await _client.Cypher.Match("(d:Arc)")
                                                   .Where((Arc d) => d.name == arc)
                                                   .Return(d => d.As<Arc>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

      

    }
}
