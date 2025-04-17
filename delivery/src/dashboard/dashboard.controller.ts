import { Controller, Get, Param } from '@nestjs/common';

@Controller('dashboard')
export class DashboardController {
  @Get('account')
  findAll(@Param('account') account): string {
    return 'Users can see the stock';
  }
}
