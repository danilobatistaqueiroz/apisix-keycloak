import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PanelController } from './panel/panel.controller';
import { DashboardController } from './dashboard/dashboard.controller';
import { AnythingController } from './anything/anything.controller';

@Module({
  imports: [],
  controllers: [AppController, PanelController, DashboardController, AnythingController],
  providers: [AppService],
})
export class AppModule {}
