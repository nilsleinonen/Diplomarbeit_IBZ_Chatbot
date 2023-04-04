using Microsoft.AspNetCore.Cors.Infrastructure;
using Neo4jClient;
using Microsoft.AspNetCore.Builder;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddCors(options =>
{
       options.AddDefaultPolicy(builder =>
    {
        builder.AllowAnyOrigin();

    });
});



// Add services to the container

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var client = new BoltGraphClient(new Uri("bolt://******:****"), "user", "********");
client.ConnectAsync();
builder.Services.AddSingleton<IGraphClient>(client);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run();
