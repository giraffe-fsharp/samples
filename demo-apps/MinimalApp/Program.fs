open Microsoft.AspNetCore.Builder
open Microsoft.Extensions.Hosting
open Giraffe

let builder = WebApplication.CreateBuilder()
builder.Services.AddGiraffe() |> ignore
let app = builder.Build()

app.UseGiraffe(text "Hello World!")
app.Run()