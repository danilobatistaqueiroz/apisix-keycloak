import { Controller, Get, Req, Headers } from '@nestjs/common';
import { Request } from 'express';

@Controller('delivery')
export class DeliveryController {
  @Get()
  findAll(@Req() req: Request, @Headers() headers): string {
    console.log('HEADERS:')
    console.log(headers); 
    return 'Delivery is available for all users and admins';
  }
}
