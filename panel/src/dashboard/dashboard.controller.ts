import { Controller, Get, Req, Headers } from '@nestjs/common';
import { Request } from 'express';

@Controller('dashboard')
export class DashboardController {
  @Get("callback")
  findAll(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    return `
    <html>
    Ola
    </html>
    `;
  }

  @Get("1")
  getAll(@Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    return `
    <html>
    Ola1
    </html>
    `;
  }
}