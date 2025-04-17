import { Controller, Get, Headers, Req } from '@nestjs/common';
import { Request } from 'express';

@Controller('anything')
export class AnythingController {

  @Get("callback")
  printHeaders(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    console.log('REQUEST:')
    console.log(req.headers); 
    return `
    <html>
    Ola1
    </html>
    `;
  }

  @Get("test")
  getAllHeaders(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    console.log('REQUEST:')
    console.log(req.headers); 
    return `
    <html>
    Ola2
    </html>
    `;
  }

}
