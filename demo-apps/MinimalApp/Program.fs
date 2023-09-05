open Microsoft.AspNetCore.Builder
open Microsoft.Extensions.Hosting
open Giraffe

let builder = WebApplication.CreateBuilder()
builder.Services.AddGiraffe() |> ignore
let app = builder.Build()
let webApp =
    choose [
        route "/ping"   >=> text "pong"
        route "/"       >=> text "Hello World" ]

app.UseGiraffe(webApp)
app.Run()