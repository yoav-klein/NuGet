using System;
using using_dotnet_cli;

namespace MyApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Logger log = new Logger();
            log.Log("INFO: Works fine !");
        }
    }
}
