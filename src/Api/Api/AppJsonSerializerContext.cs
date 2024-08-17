using Domain.Entity;

using System.Text.Json.Serialization;

namespace Api
{
    [JsonSerializable(typeof(Todo[]))]
    internal partial class AppJsonSerializerContext : JsonSerializerContext
    {

    }
}