using App.Api;
using App.Domain.Entity;

using OpenTelemetry.Trace;

var builder = WebApplication.CreateSlimBuilder(args);

builder.Services
    .ConfigureHttpJsonOptions(options =>
        {
            options.SerializerOptions.TypeInfoResolverChain.Insert(0, AppJsonSerializerContext.Default);
        })
    .AddOpenApi()
    .AddProblemDetails()
    .AddHealthChecks();

builder.Services.AddOpenTelemetry()
        .WithTracing(builder => builder
            .AddAspNetCoreInstrumentation()
            .AddConsoleExporter());

var app = builder.Build();

app.MapOpenApi();

var sampleTodos = new Todo[] {
    new(1, "Walk the dog"),
    new(2, "Do the dishes", DateOnly.FromDateTime(DateTime.Now)),
    new(3, "Do the laundry", DateOnly.FromDateTime(DateTime.Now.AddDays(1))),
    new(4, "Clean the bathroom"),
    new(5, "Clean the car", DateOnly.FromDateTime(DateTime.Now.AddDays(2)))
};

var todosApi = app.MapGroup("/todos");
todosApi.MapHealthChecks("/health");
todosApi.MapGet("/", () => sampleTodos);
todosApi.MapGet("/{id:int}", (int id) =>
    sampleTodos.FirstOrDefault(a => a.Id == id) is { } todo
        ? Results.Ok(todo)
        : Results.NotFound());

app.Run();
