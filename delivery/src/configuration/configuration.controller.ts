import { Controller, Get, Req, Headers } from '@nestjs/common';
import { Request } from 'express';

@Controller('configuration')
export class ConfigurationController {
  @Get()
  findAll(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    console.log(req.headers);
    console.log(req.originalUrl);
    console.log(req.params);
    return 'Configuration are available only for admins';
  }
}
