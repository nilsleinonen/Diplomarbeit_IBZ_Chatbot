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

    public class SagasController : ControllerBase
    {
        private readonly IGraphClient _client;

        public SagasController(IGraphClient client)
        {
            _client = client;
        }

        [EnableCors]
        [HttpGet]

       public async Task<IActionResult> Get(){
             var response = await _client.Cypher.Match("(n: Saga)")
                                                   .Return(n => n.As<Arc>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

        [EnableCors]
        [HttpGet("{saga}")]
       public async Task<IActionResult> GetBySaga(string saga)
        {
             var response = await _client.Cypher.Match("(d:Saga)<-[:is_in]-(m:Arc)")
                                                   .Where((Saga d) => d.name == saga)
                                                   .Return(m => m.As<Arc>()).ResultsAsync;

            if (!response.Any())
            { return NotFound(); }

            return Ok(response);
        }

      

    }
}
