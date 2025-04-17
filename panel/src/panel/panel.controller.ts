import { Controller, Get, Req, Headers } from '@nestjs/common';
import { Request } from 'express';

@Controller('panel')
export class PanelController {
  @Get()
  findAll(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    return `
    <html>
      <script>
        function callConfig() {
          const xhttp = new XMLHttpRequest();
          xhttp.open("GET", "http://172.25.0.10:9080/configuration", true);
          xhttp.setRequestHeader("Authorization", "${headers.authorization}");
          xhttp.setRequestHeader("Host", "delivery");
          xhttp.send();
        }
      </script>
      <body>
        Panel are available for all<p><button onclick="callConfig()">OK</button>
      </body>
    </html>
    `;
  }
}
