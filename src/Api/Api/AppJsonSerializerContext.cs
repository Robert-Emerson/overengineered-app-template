using App.Domain.Entity;

using System.Text.Json.Serialization;

namespace App.Api
{
    [JsonSerializable(typeof(Todo[]))]
    internal partial class AppJsonSerializerContext : JsonSerializerContext
    {

    }
}